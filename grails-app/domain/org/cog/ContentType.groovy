package org.cog

class ContentType {
	
	Integer		id
	String		type
	String		description

    static constraints = {
		description(nullable:true, blank:true)
    }
	
	static mapping = {
		table 'content_type'
		id column:'content_type_id'
		type column:'content_type'
		description column:'description'
		autoTimestamp false
		version false

	}
	
	String toString() {
		type
	}

}
