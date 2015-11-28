package org.cog

import org.springframework.dao.DataIntegrityViolationException

class AdminUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def sessionService
    def index() {
        redirect(uri: "/")
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [adminUserInstanceList: AdminUser.list(params), adminUserInstanceTotal: AdminUser.count()]
    }

    def create() {
        [adminUserInstance: new AdminUser(params)]
    }

    def save() {
        def adminUserInstance = new AdminUser(params)
        if (!adminUserInstance.save(flush: true)) {
            render(view: "create", model: [adminUserInstance: adminUserInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), adminUserInstance.id])
        redirect(action: "show", id: adminUserInstance.id)
    }

    def show() {
        def adminUserInstance = AdminUser.get(params.id)
        if (!adminUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), params.id])
            redirect(action: "list")
            return
        }

        [adminUserInstance: adminUserInstance]
    }

    def edit() {
        def adminUserInstance = AdminUser.get(params.id)
        if (!adminUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), params.id])
            redirect(action: "list")
            return
        }

        [adminUserInstance: adminUserInstance]
    }
	
	def login() {
		[params: params]
	}
	
	def authenticate() { 
		boolean success = false
		AdminUser user = AdminUser.findByEmail(params.email)
		if (user) {
			if (user.password==params.password) {
				log.info("User ${user.firstName} ${user.lastName} authenticated successfully.")
				sessionService.logon(user)
				success = true
				if (params.cName) {
					redirect(controller:params.cName, action:params.aName, params:[id: params.id])
				} else {
					redirect(uri:"/")
				}
			} 
		}
		if (!success) {
			flash.message = "Invalid user email address or password"
			redirect (action: "login")
		}
	}
	
	def logout = {
		sessionService.logout()
		redirect(uri:'/')
	}


    def update() {
        def adminUserInstance = AdminUser.get(params.id)
        if (!adminUserInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (adminUserInstance.version > version) {
                adminUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'adminUser.label', default: 'AdminUser')] as Object[],
                          "Another user has updated this AdminUser while you were editing")
                render(view: "edit", model: [adminUserInstance: adminUserInstance])
                return
            }
        }

        adminUserInstance.properties = params

        if (!adminUserInstance.save(flush: true)) {
            render(view: "edit", model: [adminUserInstance: adminUserInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), adminUserInstance.id])
        redirect(action: "show", id: adminUserInstance.id)
    }

    def delete() {
        def adminUserInstance = AdminUser.get(params.id)
        if (!adminUserInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), params.id])
            redirect(action: "list")
            return
        }

        try {
            adminUserInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'adminUser.label', default: 'AdminUser'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
