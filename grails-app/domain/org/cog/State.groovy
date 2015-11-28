package org.cog

class State {
	
	Integer		id
	String		name
	String		code

  static constraints = {
		name (nullable:false, blank:false, maxSize:30)
		code(blank:false, nullable:false)
    }
	
	static mapping = {
		table 'state'
		name column: 'name_txt'
		code column: 'state_cd'
		autoTimestamp false
		version false
		id column:'STATE_ID'

	}
	
	String toString() {
		code
	}
}
