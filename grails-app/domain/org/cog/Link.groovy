package org.cog

class Link {
	
	String name
	String url
	Integer sortOrder

    static constraints = {
		name (blank: false, nullable: false, maxSize: 50)
		url  (blank: false, nullable: false, maxSize: 100)
		sortOrder (nullable: true, max: 1000)
    }
	
	static mapping = {
		table "link"
		version false
		autoTimestamp false
	}
}
