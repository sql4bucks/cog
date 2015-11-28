package org.cog

import org.springframework.dao.DataIntegrityViolationException

class ContentTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [contentTypeInstanceList: ContentType.list(params), contentTypeInstanceTotal: ContentType.count()]
    }

    def create() {
        [contentTypeInstance: new ContentType(params)]
    }

    def save() {
        def contentTypeInstance = new ContentType(params)
        if (!contentTypeInstance.save(flush: true)) {
            render(view: "create", model: [contentTypeInstance: contentTypeInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'contentType.label', default: 'ContentType'), contentTypeInstance.id])
        redirect(action: "show", id: contentTypeInstance.id)
    }

    def show() {
        def contentTypeInstance = ContentType.get(params.id)
        if (!contentTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentType.label', default: 'ContentType'), params.id])
            redirect(action: "list")
            return
        }

        [contentTypeInstance: contentTypeInstance]
    }

    def edit() {
        def contentTypeInstance = ContentType.get(params.id)
        if (!contentTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentType.label', default: 'ContentType'), params.id])
            redirect(action: "list")
            return
        }

        [contentTypeInstance: contentTypeInstance]
    }

    def update() {
        def contentTypeInstance = ContentType.get(params.id)
        if (!contentTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentType.label', default: 'ContentType'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contentTypeInstance.version > version) {
                contentTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contentType.label', default: 'ContentType')] as Object[],
                          "Another user has updated this ContentType while you were editing")
                render(view: "edit", model: [contentTypeInstance: contentTypeInstance])
                return
            }
        }

        contentTypeInstance.properties = params

        if (!contentTypeInstance.save(flush: true)) {
            render(view: "edit", model: [contentTypeInstance: contentTypeInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'contentType.label', default: 'ContentType'), contentTypeInstance.id])
        redirect(action: "show", id: contentTypeInstance.id)
    }

    def delete() {
        def contentTypeInstance = ContentType.get(params.id)
        if (!contentTypeInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentType.label', default: 'ContentType'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contentTypeInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contentType.label', default: 'ContentType'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contentType.label', default: 'ContentType'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
