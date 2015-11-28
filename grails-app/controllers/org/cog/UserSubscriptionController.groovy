package org.cog

import org.springframework.dao.DataIntegrityViolationException

class UserSubscriptionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [userSubscriptionInstanceList: UserSubscription.list(params), userSubscriptionInstanceTotal: UserSubscription.count()]
    }

    def create() {
        [userSubscriptionInstance: new UserSubscription(params)]
    }

    def save() {
        def userSubscriptionInstance = new UserSubscription(params)
        if (!userSubscriptionInstance.save(flush: true)) {
            render(view: "create", model: [userSubscriptionInstance: userSubscriptionInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), userSubscriptionInstance.id])
        redirect(action: "show", id: userSubscriptionInstance.id)
    }

    def show() {
        def userSubscriptionInstance = UserSubscription.get(params.id)
        if (!userSubscriptionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), params.id])
            redirect(action: "list")
            return
        }

        [userSubscriptionInstance: userSubscriptionInstance]
    }

    def edit() {
        def userSubscriptionInstance = UserSubscription.get(params.id)
        if (!userSubscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), params.id])
            redirect(action: "list")
            return
        }

        [userSubscriptionInstance: userSubscriptionInstance]
    }

    def update() {
        def userSubscriptionInstance = UserSubscription.get(params.id)
        if (!userSubscriptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (userSubscriptionInstance.version > version) {
                userSubscriptionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'userSubscription.label', default: 'UserSubscription')] as Object[],
                          "Another user has updated this UserSubscription while you were editing")
                render(view: "edit", model: [userSubscriptionInstance: userSubscriptionInstance])
                return
            }
        }

        userSubscriptionInstance.properties = params

        if (!userSubscriptionInstance.save(flush: true)) {
            render(view: "edit", model: [userSubscriptionInstance: userSubscriptionInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), userSubscriptionInstance.id])
        redirect(action: "show", id: userSubscriptionInstance.id)
    }

    def delete() {
        def userSubscriptionInstance = UserSubscription.get(params.id)
        if (!userSubscriptionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), params.id])
            redirect(action: "list")
            return
        }

        try {
            userSubscriptionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'userSubscription.label', default: 'UserSubscription'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
