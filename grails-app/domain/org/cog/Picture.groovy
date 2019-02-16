package org.cog

class Picture {
	
	 def grailsApplication 
	
	String description
	String caption
	String filePath
	String fileName
	String active
	String uploadFile
	User modifiedUser
	Date modifiedDate
	
	static transients = ['uploadFile']

    static constraints = {
		description (blank:false, nullable:false, maxSize:75)
		caption (blank:true, nullable:true, maxSize:30)
		uploadFile(blank:true, nullable:true)
    }
	
	static mapping = {
		table: "PICTURE"
		id column: "picture_id"
		filePath column:"path"
		caption column: "caption_txt"
		active column: "active_ind"
		modifiedUser column: "modified_user"
		autoTimestamp false
		version false
	}
	
	String toString() {
		return description ?: caption ?: fileName
	}
	
	/**
	* Create a URL for the web app to access the picture service
	* Picture service uses a separate web context than the base application
	* @param content - a Picture domain instance
	* @returns The media content URL
	*/
	
	String getUrl() {
	   String pictureUrl = this.filePath + "/" + this.fileName
	   return pictureUrl
   }

	
}
