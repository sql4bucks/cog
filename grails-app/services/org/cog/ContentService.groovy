package org.cog

class ContentService {
	
	def grailsApplication

	def searchContent(SearchCommand cmdObj) {
		
		def searchResults = []
		def success = true
		def error = null
		 
		// Build a detached query based on the criteria provided by user
		
		def query = Content.where {
			active == 'Y'
		}
		
		if (cmdObj?.name != null && cmdObj.name.size() > 0) {
			query = query.where {
				name =~ cmdObj.name + "%"
			}	 
		}
		if (cmdObj?.author?.id != null && cmdObj?.author?.id != 0) {
			query = query.where {
				author.id == cmdObj?.author?.id
			}	
		}
		if (cmdObj?.type?.id != null && cmdObj?.type?.id != 0) {
			query = query.where {
				type.id == cmdObj.type.id
			}	
		}
		if (cmdObj?.location?.id != null && cmdObj?.location?.id != 0) {
			query = query.where {
				location.id == cmdObj.location.id
			}
		}
		if (cmdObj?.topic?.id != null && cmdObj?.topic?.id != 0) {
			query = query.where {
				topic.id == cmdObj.topic.id
			}	
		}
		if (cmdObj?.afterDate != null) {
			query = query.where {
				contentDate >= cmdObj.afterDate
			}	
		}
		if (cmdObj?.beforeDate != null) {
			query = query.where {
				contentDate <= cmdObj.beforeDate
			}	
		}

		return query
		
	}
	
	
    def fileUpload(request, params, content) {
		try
		{
			println "File upload - Content Service"
			def uploadedFile = request.getFile('uploadFile')
				
			if( uploadedFile  && !uploadedFile.empty ){
			  def rootDir = grailsApplication.config.cog.media.root
			  rootDir += "content/"
			  def mediaDir = rootDir + Utility.getDatedDirectory(content?.contentDate)
			  Utility.makeDir(mediaDir)
			  log.info("Media dir = ${mediaDir}")
			  uploadedFile.transferTo( new File( mediaDir, uploadedFile.originalFilename))
			  content.fileName = uploadedFile.originalFilename
			  content.filePath = mediaDir
			  return [success: true]
			}
			else
			{
				// Error Message, reject value if empty
				content.errors.rejectValue("uploadFile", "Media files must be of type .mp3, .mp4, .wav, or .m4a to be uploaded." )
				return [success: false, contentInstance: content]
			 }
		}
		catch (Exception ex)
		{
			// Error Message, failed to upload.
			log.error("File upload failed due to: ${ex.getMessage()}")
			content.errors.rejectValue("uploadFile", "File upload failed - ${ex.getMessage()}" )
			return [success: false, contentInstance: content]
		}
			
    }
	
	/**
	 * Create a URL for the JQuery media player to access the content service
	 * Content service uses a separate web context than the base application
	 * @param content - a Content domain instance 
	 * @returns The media content URL
	 */
	String getMediaInfo(Content content) {
		String mediaRoot = grailsApplication.config.cog.media.url
		String filePath = content.filePath
		String mediaUrl = mediaRoot + filePath
		return mediaUrl
	}

    String getMediaRoot() {
        return grailsApplication.config.cog.media.root
    }
	
}
