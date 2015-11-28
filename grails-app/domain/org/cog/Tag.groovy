package org.cog

class Tag {
	
	Integer		id
	String		name

    static constraints = {
		name(blank:false, nullable:false)
    }
	
	static mapping = {
		table 'tag'
		id column: 'tag_id'
		name column: 'name_txt'
		autoTimestamp false
		version false

	}
}
