package org.cog

class Topic {
	
	Integer		id
	String		name

    static constraints = {
    }
	
	static mapping = {
		table 'topic'
		id column: 'topic_id'
		name column: 'name_txt'
		autoTimestamp false
		version false

	}
	
	String toString() {
		name
	}
}
