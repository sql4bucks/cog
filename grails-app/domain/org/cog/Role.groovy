package org.cog

class Role {

	String authority

	static mapping = {
		cache true
		id column: 'role_id'
		version false
		autoTimestamp false
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	String toString() {
		authority
	}
}
