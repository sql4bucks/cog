package org.cog

class ContentTag {
	
	Integer 		id
	Content			content
	Tag				tag
	AdminUser		modifiedUser

    static constraints = {
    }
	
	static mapping = {
		table 'content_tag'
		id column: 'content_tag_id'
		content column: 'content_id'
		tag column: 'tag_id'
		modifiedUser column: 'modified_user'
		autoTimestamp false
		version false

	}
}
