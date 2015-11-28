package org.cog

class Author {
	
	Integer		id
	String		firstName
	String		lastName

     static constraints = {
		firstName (nullable:false, blank:false, maxSize:30)
		lastName (nullable:false, blank:false, maxSize:30)
    }
	
	static mapping = {
		table 'author'
		id column:'author_id'
		firstName column:'first_name'
		lastName column:'last_name'
		autoTimestamp false
		version false

	}
	
	String toString() {
		"$firstName $lastName"
	}
}