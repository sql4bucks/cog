package org.cog

class City {
	
	Integer		id
	State		state
	String		name
	String		description

     static constraints = {
		name (nullable:false, blank:false, maxSize:30)
		description(blank:true, nullable:true)
    }
	
	static mapping = {
		table 'city'
		id column:'city_id'
		name column:'name_txt'
		state column:'state_id'
		autoTimestamp false
		version false

	}
	
	String toString() {
		name
	}
}
