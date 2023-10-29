package org.cog

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.dao.DataIntegrityViolationException

class SuggestionBoxController {

    def auditService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [suggestionInstanceList: SuggestionBox.list(params), suggestionInstanceTotal: SuggestionBox.count()]
    }

    def create() {
        def suggestionInstance = new SuggestionBox(params)
        suggestionInstance.reviewed = 0;

        [suggestionInstance: suggestionInstance]
    }

    def save() {
        def suggestionInstance = new SuggestionBox(params)
        log.info("suggestion Box to be saved  = " + suggestionInstance)
        auditService.setAudit(suggestionInstance)
        if (!suggestionInstance.save(flush: true)) {
            render(view: "create", model: [suggestionInstance: suggestionInstance])
            return
        } else {
            log.info("Failed to save suggestion Box  = " + suggestionInstance);
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'suggestionBox.label', default: 'Suggestion'), suggestionInstance.id])
        redirect(action: "show", id: suggestionInstance.id)
    }

    def show() {
        def suggestionInstance = SuggestionBox.get(params.id)
        if (!suggestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suggestionBox.label', default: 'Suggestion'), params.id])
            redirect(action: "list")
            return
        }
        [suggestionInstance: suggestionInstance]
    }

    def edit() {
        def suggestionInstance = SuggestionBox.get(params.id)
        if (!suggestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suggestionBox.label', default: 'Suggestion'), params.id])
            redirect(action: "list")
            return
        }

        [suggestionInstance: suggestionInstance]
    }

    def update() {
        def suggestionInstance = SuggestionBox.get(params.id)
        if (!suggestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suggestionBox.label', default: 'SUggestion'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (suggestionInstance.version > version) {
                suggestionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'suggestionBox.label', default: 'Suggestion')] as Object[],
                        "Another user has updated this Suggestion while you were editing")
                render(view: "edit", model: [suggestionInstance: suggestionInstance])
                return
            }
        }

        suggestionInstance.properties = params
        auditService.setAudit(suggestionInstance)

        if (!suggestionInstance.save(flush: true)) {
            render(view: "edit", model: [suggestionInstance: suggestionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'suggestionBox.label', default: 'Suggestion'), suggestionInstance.id])
        redirect(action: "show", id: suggestionInstance.id)
    }

    @Secured('ROLE_ADMIN')
    def delete() {
        def suggestionInstance = SuggestionBox.get(params.id)
        if (!suggestionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'suggestionBox.label', default: 'Suggestion'), params.id])
            redirect(action: "list")
            return
        }

        try {
            suggestionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'suggestionBox.label', default: 'Suggestion'), params.id])
            redirect(action: "list")
        }
        catch (Exception e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'suggestionBox.label', default: 'Suggestion'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
