package org.cog

import grails.converters.JSON
import groovy.sql.GroovyRowResult
import groovy.sql.Sql
import org.springframework.dao.DataIntegrityViolationException

import java.sql.SQLException

class ContentController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def contentService
	def auditService
	def grailsApplication
	def dataSource

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 20, 100)
        [contentInstanceList: Content.list(params), contentInstanceTotal: Content.count()]
    }
	
	def search() {
		
		def cmdObj = new SearchCommand()
		[cmdObj: cmdObj, contentInstanceTotal: 0]
		
	}
	
		
	def doSearch(SearchCommand cmdObj) {
		def query = contentService.searchContent(cmdObj)
		session.contentQuery = query
		session.searchCommand = cmdObj
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if (params.offset==null) {params.offset=0}
        // Default sort is by content data desc
        if (params.sort == null)  {
            params.sort = "contentDate"
            params.order = "desc"
        }
		render (view: "searchResults", model: [contentInstanceList: query.list(params), contentInstanceTotal: query.count(), cmdObj: cmdObj, params: params])
	}
	
	/** 
	 * Called by the pagination of a prior doSearch
	 * @return
	 */
	def getPage() {
		def query = session?.contentQuery
		SearchCommand cmdObj = session?.searchCommand
		if (query==null) {
			flash.message="Session expired, defaulting to new search"
			redirect(action: "search") 
			return
		}
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if (params.offset==null) {params.offset=0}
		render (view: "searchResults", model: [contentInstanceList: query.list(params), contentInstanceTotal: query.count(), cmdObj: cmdObj, params: params])
	}

	

    def create() {
        [contentInstance: new Content(params)]
    }

    def save() {
		
		// Handle the checkbox
		if (!params.active) {
			params.active = 'N'
		}
        def contentInstance = new Content(params)
		
		// Check the file upload
		def uploadedFile = request.getFile('uploadFile')
		if (uploadedFile && !uploadedFile.isEmpty()) {
			// Process the file upload
			def results = contentService.fileUpload(request, params, contentInstance)
			if (results.success) {
				log.debug "Calling Audit Service"
				auditService.setAudit(contentInstance)
				
				log.info("modifiedDate = ${contentInstance.modifiedDate}")
				
				if (!contentInstance.save(flush: true)) {
					render(view: "create", model: [contentInstance: contentInstance])
					return
				} else {
					// Successful save
					flash.message = message(code: 'default.created.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.id])
					redirect(action: "show", id: contentInstance.id)
				}
			}		
        }
		// File upload issues
		render(view: "create", model: [contentInstance: contentInstance])
		return
    }

    def show() {
        def contentInstance = Content.get(params.id)
        if (!contentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), params.id])
            redirect(action: "list")
            return
        }

        [contentInstance: contentInstance]
    }
	
	def view() {
		log.info("Viewing content - params = ${params}")
		def contentInstance = Content.get(params.id)
		if (!contentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), params.id])
			redirect(action: "search")
			return 
		}

		// Get the URL for the media context
		String mediaUrl = contentService.getMediaInfo(contentInstance)
        String mediaRoot = contentService.getMediaRoot()

        // Check if file exists
        File file = new File(contentInstance.filePath + "/" + contentInstance.fileName)
        log.info("File path for content to be served: ${file.getAbsolutePath()}")
        if (!file.exists()) {
			contentInstance.errors.rejectValue("fileName", "content.file.not.found",
                  [contentInstance.name] as Object[],
				  "The underlying file ({0}) is no longer present and can not be played or downloaded."	)
		}
		return [contentInstance: contentInstance, mediaUrl: mediaUrl, params: params]
	}

    def edit() {
        def contentInstance = Content.get(params.id)
        if (!contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), params.id])
            redirect(action: "list")
            return
        }

        [contentInstance: contentInstance]
    }
	
	def file() {
		Content content = Content.get(params.id)
		File file = new File(content.filePath + "/" + content.fileName)
        log.info("Request to download file ${file.absolutePath}")
		if (file.exists()) {
            log.info("File exists, preparing to stream")
			file.withInputStream {
				  response.contentLength = it.available()
				  response.setHeader("Content-disposition", "attachment; filename=${content.fileName}")
				  response.contentType = "audio/mpeg3"
				  response.outputStream << it
				}
			response.outputStream.flush()
		} else {
			flash.message = message(code: "content.file.not.found",	args:[content.name]) 
			redirect(action: "search")
		}
	}

    def update() {
		log.info("Update, params: ${params}")
        def contentInstance = Content.get(params.id)
        if (!contentInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (contentInstance.version > version) {
                contentInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'content.label', default: 'Content')] as Object[],
                          "Another user has updated this Content while you were editing")
                render(view: "edit", model: [contentInstance: contentInstance])
                return
            }
        }

		// Handle the checkbox
		if (!params.active) {
			params.active = 'N'
		}
		
		contentInstance.properties = params
		def results = [:]
		results.success = true

		log.debug "Calling Audit Service"
		auditService.setAudit(contentInstance)

		// Check to see if file was uploaded and delegate to service
		def uploadedFile = request.getFile('uploadFile')
		if (uploadedFile && !uploadedFile.isEmpty()) {
			results = contentService.fileUpload(request, params, contentInstance)
		}
		
		if (results.success) {
			println "Success  = true"
			if (!contentInstance.save(flush: true)) {
				render(view: "edit", model: [contentInstance: contentInstance])
				return
			}

			flash.message = message(code: 'default.updated.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.id])
			redirect(action: "show", id: contentInstance.id)
		} else {
			render(view: "edit", model: [contentInstance: results.contentInstance])
			return

		}
    }

    def delete() {
        def contentInstance = Content.get(params.id)
        if (!contentInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), params.id])
            redirect(action: "list")
            return
        }

        try {
            contentInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'content.label', default: 'Content'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'content.label', default: 'Content'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
	
	/**
	 * Name field on the search screen is wired for autocomplete
	 */
	def autoComplete = {
		Sql sql = new Sql(dataSource)
		def resultSet = []

		/* --------------------------------------------------------------
		 * Form a query to be executed by the autoComplete 
		   --------------------------------------------------------------*/
		String query = "select name_txt as item from content where lower(name_txt) like ?"
		
		// Add a percentage to do the like
		String arg = params.term + "%"
		
		// Execute the query, catch exceptions and render a suitable message
		try {
			sql.eachRow(query, [arg]) {

                def row =  it.toRowResult()
                def resultMap = [:]
                // resultSet << row
                resultMap.put("id",row.get("item"))
                resultMap.put("label",row.get("item"))
                resultMap.put("value",row.get("item"))
                resultSet << resultMap
			}
		} catch (SQLException e) {
			log.error """
				Exception executing SQL for auto-complete: ${e.getMessage()}
				Query = ${query}
			 """
			def result = new GroovyRowResult([item:"Auto-completion problem - contact webmaster"])
			resultSet << result
		}
			
		/* ----------------------------------------------
		 * Render the results as XML. Things to note:
		 * The method names that specify the XML tags must be
		 * specified as "result" and "name"
		 * ---------------------------------------------*/
		/*
		render(contentType: "text/json") {
			results() {
				resultSet.each {
					row -> result()
					{ name(row.item)	}
				}
			}
		}
		*/

        render resultSet as JSON

	}

}

class SearchCommand { 
	String name 
	Author author
	Location location
	Topic topic
	ContentType type
	Date	afterDate
	Date	beforeDate
}	
