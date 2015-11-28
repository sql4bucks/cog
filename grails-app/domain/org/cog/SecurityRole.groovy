package org.cog

class SecurityRole {
	
	Integer		id
	Integer		accessLevel
	String		name
	String		description

    static constraints = {
		name (nullable:false, blank:false, maxSize:30)
		accessLevel (nullable:false, blank:false)
		description(blank:true, nullable:true)
    }
	
	static mapping = {
		table 'security_role'
		id column: 'security_role_id'
		accessLevel column: 'access_level'
		name column: 'name_txt'
		autoTimestamp false
		version false

	}
	
	String toString() {
		name
	}
}
