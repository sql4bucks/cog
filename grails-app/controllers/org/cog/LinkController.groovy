package org.cog

import org.springframework.dao.DataIntegrityViolationException

class LinkController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 15, 100)
        [linkInstanceList: Link.list(params), linkInstanceTotal: Link.count()]
    }
	
	def links() {
        log.info("Before Params = ${params}")
		params.max = Math.min(params.max ? params.int('max') : 15, 100)
		log.info("Params = ${params}")
		params.sort = "sortOrder"

		[linkInstanceList: Link.list(params), linkInstanceTotal: Link.count()]
	}

    def create() {
        [linkInstance: new Link(params)]
    }

    def save() {
        def linkInstance = new Link(params)
        if (!linkInstance.save(flush: true)) {
            render(view: "create", model: [linkInstance: linkInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'link.label', default: 'Link'), linkInstance.id])
        redirect(action: "show", id: linkInstance.id)
    }

    def show() {
        def linkInstance = Link.get(params.id)
        if (!linkInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'link.label', default: 'Link'), params.id])
            redirect(action: "list")
            return
        }

        [linkInstance: linkInstance]
    }

    def edit() {
        def linkInstance = Link.get(params.id)
        if (!linkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'link.label', default: 'Link'), params.id])
            redirect(action: "list")
            return
        }

        [linkInstance: linkInstance]
    }

    def update() {
        def linkInstance = Link.get(params.id)
        if (!linkInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'link.label', default: 'Link'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (linkInstance.version > version) {
                linkInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'link.label', default: 'Link')] as Object[],
                          "Another user has updated this Link while you were editing")
                render(view: "edit", model: [linkInstance: linkInstance])
                return
            }
        }

        linkInstance.properties = params

        if (!linkInstance.save(flush: true)) {
            render(view: "edit", model: [linkInstance: linkInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'link.label', default: 'Link'), linkInstance.id])
        redirect(action: "show", id: linkInstance.id)
    }

    def delete() {
        def linkInstance = Link.get(params.id)
        if (!linkInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'link.label', default: 'Link'), params.id])
            redirect(action: "list")
            return
        }

        try {
            linkInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'link.label', default: 'Link'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'link.label', default: 'Link'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
