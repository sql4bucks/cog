package org.cog

import org.springframework.dao.DataIntegrityViolationException

class ScriptureController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [scriptureInstanceList: Scripture.list(params), scriptureInstanceTotal: Scripture.count()]
    }

    def create() {
        [scriptureInstance: new Scripture(params)]
    }

    def save() {
        def scriptureInstance = new Scripture(params)
        if (!scriptureInstance.save(flush: true)) {
            render(view: "create", model: [scriptureInstance: scriptureInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'scripture.label', default: 'Scripture'), scriptureInstance.id])
        redirect(action: "show", id: scriptureInstance.id)
    }

    def show() {
        def scriptureInstance = Scripture.get(params.id)
        if (!scriptureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'scripture.label', default: 'Scripture'), params.id])
            redirect(action: "list")
            return
        }

        [scriptureInstance: scriptureInstance]
    }

    def edit() {
        def scriptureInstance = Scripture.get(params.id)
        if (!scriptureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scripture.label', default: 'Scripture'), params.id])
            redirect(action: "list")
            return
        }

        [scriptureInstance: scriptureInstance]
    }

    def update() {
        def scriptureInstance = Scripture.get(params.id)
        if (!scriptureInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'scripture.label', default: 'Scripture'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (scriptureInstance.version > version) {
                scriptureInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'scripture.label', default: 'Scripture')] as Object[],
                          "Another user has updated this Scripture while you were editing")
                render(view: "edit", model: [scriptureInstance: scriptureInstance])
                return
            }
        }

        scriptureInstance.properties = params

        if (!scriptureInstance.save(flush: true)) {
            render(view: "edit", model: [scriptureInstance: scriptureInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'scripture.label', default: 'Scripture'), scriptureInstance.id])
        redirect(action: "show", id: scriptureInstance.id)
    }

    def delete() {
        def scriptureInstance = Scripture.get(params.id)
        if (!scriptureInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'scripture.label', default: 'Scripture'), params.id])
            redirect(action: "list")
            return
        }

        try {
            scriptureInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'scripture.label', default: 'Scripture'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'scripture.label', default: 'Scripture'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
