package org.cog

import org.springframework.dao.DataIntegrityViolationException

class ContentTagController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [contentTagInstanceList: ContentTag.list(params), contentTagInstanceTotal: ContentTag.count()]
    }

    def create() {
        [contentTagInstance: new ContentTag(params)]
    }

    def save() {
        def contentTagInstance = new ContentTag(params)
        if (!contentTagInstance.save(flush: true)) {
            render(view: "create", model: [contentTagInstance: contentTagInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), contentTagInstance.id])
        redirect(action: "show", id: contentTagInstance.id)
    }

    def show() {
        def contentTagInstance = ContentTag.get(params.id)
        if (!contentTagInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), params.id])
            redirect(action: "list")
            return
        }

        [contentTagInstance: contentTagInstance]
    }

    def edit() {
        def contentTagInstance = ContentTag.get(params.id)
        if (!contentTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), params.id])
            redirect(action: "list")
            return
        }

        [contentTagInstance: contentTagInstance]
    }

    def update() {
        def contentTagInstance = ContentTag.get(params.id)
        if (!contentTagInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contentTagInstance.version > version) {
                contentTagInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contentTag.label', default: 'ContentTag')] as Object[],
                          "Another user has updated this ContentTag while you were editing")
                render(view: "edit", model: [contentTagInstance: contentTagInstance])
                return
            }
        }

        contentTagInstance.properties = params

        if (!contentTagInstance.save(flush: true)) {
            render(view: "edit", model: [contentTagInstance: contentTagInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), contentTagInstance.id])
        redirect(action: "show", id: contentTagInstance.id)
    }

    def delete() {
        def contentTagInstance = ContentTag.get(params.id)
        if (!contentTagInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contentTagInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contentTag.label', default: 'ContentTag'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
