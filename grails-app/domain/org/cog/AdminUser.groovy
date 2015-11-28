package org.cog

class AdminUser {
	
	Integer			id
	SecurityRole	role
	String			loginId
	String			firstName
	String			lastName
	String			password
	String			email

     static constraints = {
		loginId (nullable:false, blank:false, maxSize:30)
		firstName (nullable:false, blank:false, maxSize:30)
		lastName(blank:false, nullable:false, maxSize:30)
		password (nullable:false, blank:false, maxSize:30, size: 8..30)
		email (nullable:false, blank:false, maxSize:75, email:true)
    }
	
	static mapping = {
		table: 'admin_user'
		id column: 'user_id'
		firstName column: 'first_name'
		lastName column: 'last_name'
		loginId column: 'login_id'
		role column:'security_role_id'
		autoTimestamp false
		version false
	}
	
	String toString() {
		"${firstName} ${lastName}"
	}
}
