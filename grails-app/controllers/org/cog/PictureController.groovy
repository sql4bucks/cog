package org.cog

import org.springframework.dao.DataIntegrityViolationException

class PictureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def auditService
	def pictureService

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 15, 100)
        [pictureInstanceList: Picture.list(params), pictureInstanceTotal: Picture.count()]
    }

    def create() {
        [pictureInstance: new Picture(params)]
    }

    def save() {
		
		println "Picture controller: Params= ${params}"
		// Handle the checkbox
		if (!params.active) {
			params.active = 'N'
		}

        def pictureInstance = new Picture(params)
		log.debug "Calling Audit Service"
		auditService.setAudit(pictureInstance)
		log.info("modifiedDate = ${pictureInstance.modifiedDate}")
		
		def uploadedFile = request.getFile('uploadFile')
		if (uploadedFile && !uploadedFile.isEmpty()) {
			// Process the file upload
			def results = pictureService.fileUpload(request, params, pictureInstance)
			if (results.success) {
				if (!pictureInstance.save(flush: true)) {
					render(view: "create", model: [pictureInstance: pictureInstance])
					return
				} else {
					flash.message = message(code: 'default.created.message', args: [message(code: 'picture.label', default: 'Picture'), pictureInstance.id])
					redirect(action: "show", id: pictureInstance.id)
					return
				}
			}	
		}	
		// If we get here, there were file upload issues
		render(view: "create", model: [pictureInstance: pictureInstance])
		return
		
    }

    def show() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        [pictureInstance: pictureInstance]
    }

    def edit() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        [pictureInstance: pictureInstance]
    }

    def update() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (pictureInstance.version > version) {
                pictureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'picture.label', default: 'Picture')] as Object[],
                          "Another user has updated this Picture while you were editing")
                render(view: "edit", model: [pictureInstance: pictureInstance])
                return
            }
        }

		// Handle the checkbox
		if (!params.active) {
			params.active = 'N'
		}

        pictureInstance.properties = params
		def results = [:]
		results.success = true
		
		log.debug "Calling Audit Service"
		auditService.setAudit(pictureInstance)


		// Check to see if file was uploaded and delegate to service
		def uploadedFile = request.getFile('uploadFile')
		if (uploadedFile && !uploadedFile.isEmpty()) {
			results = pictureService.fileUpload(request, params, pictureInstance)
		}
		
		if (results.success) {
			println "Picture upload - Success  = true"
			if (!pictureInstance.save(flush: true)) {
				render(view: "edit", model: [pictureInstance: pictureInstance])
				return
			} else {

				flash.message = message(code: 'default.updated.message', args: [message(code: 'picture.label', default: 'Picture'), pictureInstance.id])
				redirect(action: "show", id: pictureInstance.id)
			}	
		} else {
			render(view: "edit", model: [pictureInstance: results.pictureInstance])
			return
		}
    }

    def delete() {
        def pictureInstance = Picture.get(params.id)
        if (!pictureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
            return
        }

        try {
            pictureInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'picture.label', default: 'Picture'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
