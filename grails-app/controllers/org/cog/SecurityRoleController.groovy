package org.cog

import org.springframework.dao.DataIntegrityViolationException

class SecurityRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [securityRoleInstanceList: SecurityRole.list(params), securityRoleInstanceTotal: SecurityRole.count()]
    }

    def create() {
        [securityRoleInstance: new SecurityRole(params)]
    }

    def save() {
        def securityRoleInstance = new SecurityRole(params)
        if (!securityRoleInstance.save(flush: true)) {
            render(view: "create", model: [securityRoleInstance: securityRoleInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), securityRoleInstance.id])
        redirect(action: "show", id: securityRoleInstance.id)
    }

    def show() {
        def securityRoleInstance = SecurityRole.get(params.id)
        if (!securityRoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), params.id])
            redirect(action: "list")
            return
        }

        [securityRoleInstance: securityRoleInstance]
    }

    def edit() {
        def securityRoleInstance = SecurityRole.get(params.id)
        if (!securityRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), params.id])
            redirect(action: "list")
            return
        }

        [securityRoleInstance: securityRoleInstance]
    }

    def update() {
        def securityRoleInstance = SecurityRole.get(params.id)
        if (!securityRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (securityRoleInstance.version > version) {
                securityRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'securityRole.label', default: 'SecurityRole')] as Object[],
                          "Another user has updated this SecurityRole while you were editing")
                render(view: "edit", model: [securityRoleInstance: securityRoleInstance])
                return
            }
        }

        securityRoleInstance.properties = params

        if (!securityRoleInstance.save(flush: true)) {
            render(view: "edit", model: [securityRoleInstance: securityRoleInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), securityRoleInstance.id])
        redirect(action: "show", id: securityRoleInstance.id)
    }

    def delete() {
        def securityRoleInstance = SecurityRole.get(params.id)
        if (!securityRoleInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), params.id])
            redirect(action: "list")
            return
        }

        try {
            securityRoleInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'securityRole.label', default: 'SecurityRole'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
