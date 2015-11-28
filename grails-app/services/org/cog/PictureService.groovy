package org.cog

class PictureService {
	
	def grailsApplication

	def fileUpload(request, params, content) {
		try
		{
			println "File upload - Picture Service"
			def uploadedFile = request.getFile('uploadFile')
				
			if( uploadedFile  && !uploadedFile.empty){
			  def rootDir = grailsApplication.config.cog.media.root
			  rootDir += "pictures/"	
			  log.info("Root dir = ${rootDir}")
			  def mediaDir = rootDir + Utility.getDatedDirectory(content?.modifiedDate)
			  Utility.makeDir(mediaDir)
			  log.info("Picture dir = ${mediaDir}")
			  uploadedFile.transferTo( new File( mediaDir, uploadedFile.originalFilename))
			  content.fileName = uploadedFile.originalFilename
			  content.filePath = mediaDir
			  return [success: true]
			}
			else
			{
				// Error Message, reject value if empty
				content.errors.rejectValue("uploadFile", "Invalid file specified." )
				return [success: false, pictureInstance: content]
			 }
		}
		catch (Exception ex)
		{
			// Error Message, failed to upload.
			log.error("File upload failed due to: ${ex.getMessage()}")
			content.errors.rejectValue("uploadFile", "File upload failed - ${ex.getMessage()}" )
			return [success: false, pictureInstance: content]
		}
	}
	
}
