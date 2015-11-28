package org.cog

class Content implements Audit {
	
	Integer		id
	String		name
	ContentType	type
	Topic		topic
	Location	location
	Author		author
	Date		contentDate
	Date		modifiedDate
	String		fileName
	String		filePath
	User		modifiedUser
	String 		uploadFile
	String 		active
	
	static transients = ['uploadFile']

    static constraints = {
		name (nullable:false, blank:false, maxSize:30)
		type(blank:false, nullable:false)
		contentDate(blank:false, nullable:false)
		fileName(blank:false, nullable:false)
		filePath(blank:false,nullable:false)
		author(blank:false,nullable:false)
		uploadFile(blank:true, nullable:true)
		active(blank:true, nullable:true)
    }
	
	static mapping = {
		table 'content'
		id column: 'content_id'
		name column: 'name_txt'
		type column: 'content_type_id'
		topic column: 'topic_id'
		author column: 'author_id'
		location column: 'location_id'
		fileName column: 'file_name'
		filePath column: 'path'
		active column: 'active_ind'
		contentDate column: 'content_date'
		modifiedDate column: 'added_date'
		modifiedUser column: 'modified_user'
		autoTimestamp false
		version false
	}
}
