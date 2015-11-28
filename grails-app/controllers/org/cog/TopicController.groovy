package org.cog

import org.springframework.dao.DataIntegrityViolationException

class TopicController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [topicInstanceList: Topic.list(params), topicInstanceTotal: Topic.count()]
    }

    def create() {
        [topicInstance: new Topic(params)]
    }

    def save() {
        def topicInstance = new Topic(params)
        if (!topicInstance.save(flush: true)) {
            render(view: "create", model: [topicInstance: topicInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
        redirect(action: "show", id: topicInstance.id)
    }

    def show() {
        def topicInstance = Topic.get(params.id)
        if (!topicInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
            redirect(action: "list")
            return
        }

        [topicInstance: topicInstance]
    }

    def edit() {
        def topicInstance = Topic.get(params.id)
        if (!topicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
            redirect(action: "list")
            return
        }

        [topicInstance: topicInstance]
    }

    def update() {
        def topicInstance = Topic.get(params.id)
        if (!topicInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (topicInstance.version > version) {
                topicInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'topic.label', default: 'Topic')] as Object[],
                          "Another user has updated this Topic while you were editing")
                render(view: "edit", model: [topicInstance: topicInstance])
                return
            }
        }

        topicInstance.properties = params

        if (!topicInstance.save(flush: true)) {
            render(view: "edit", model: [topicInstance: topicInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'topic.label', default: 'Topic'), topicInstance.id])
        redirect(action: "show", id: topicInstance.id)
    }

    def delete() {
        def topicInstance = Topic.get(params.id)
        if (!topicInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
            redirect(action: "list")
            return
        }

        try {
            topicInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
