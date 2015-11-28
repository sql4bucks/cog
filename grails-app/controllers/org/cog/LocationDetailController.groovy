package org.cog

import org.springframework.dao.DataIntegrityViolationException

class LocationDetailController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [locationDetailInstanceList: LocationDetail.list(params), locationDetailInstanceTotal: LocationDetail.count()]
    }

    def create() {
		def locationDetails = new LocationDetail(params)
		locationDetails.location = Location.get(params.parentLocation)
        [locationDetailInstance: locationDetails]
    }

    def save() {
        def locationDetailInstance = new LocationDetail(params)
        if (!locationDetailInstance.save(flush: true)) {
            render(view: "create", model: [locationDetailInstance: locationDetailInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), locationDetailInstance.id])
        redirect(controller: "location", action: "show", id: locationDetailInstance?.location?.id)
    }

    def show() {
        def locationDetailInstance = LocationDetail.get(params.id)
        if (!locationDetailInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), params.id])
            redirect(action: "list")
            return
        }

        [locationDetailInstance: locationDetailInstance]
    }

    def edit() {
        def locationDetailInstance = LocationDetail.get(params.id)
        if (!locationDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), params.id])
            redirect(action: "list")
            return
        }

        [locationDetailInstance: locationDetailInstance]
    }

    def update() {
        def locationDetailInstance = LocationDetail.get(params.id)
        if (!locationDetailInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (locationDetailInstance.version > version) {
                locationDetailInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'locationDetail.label', default: 'LocationDetail')] as Object[],
                          "Another user has updated this LocationDetail while you were editing")
                render(view: "edit", model: [locationDetailInstance: locationDetailInstance])
                return
            }
        }

        locationDetailInstance.properties = params

        if (!locationDetailInstance.save(flush: true)) {
            render(view: "edit", model: [locationDetailInstance: locationDetailInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), locationDetailInstance.id])
		redirect(controller: "location", action: "show", id: locationDetailInstance?.location?.id)
    }

    def delete() {
        def locationDetailInstance = LocationDetail.get(params.id)
        if (!locationDetailInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), params.id])
            redirect(action: "list")
            return
        }

        try {
            locationDetailInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), params.id])
            redirect(controller: "location", action: "show", params: [id: locationDetailInstance?.location?.id])
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'locationDetail.label', default: 'LocationDetail'), params.id])
			redirect(controller: "location", action: "show", id: locationDetailInstance?.location?.id)
        }
    }
}
