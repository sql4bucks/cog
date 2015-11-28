package org.cog

class User {

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
		firstName blank:false
		lastName blank: false
	}

	static mapping = {
		table: "User"
		id column: 'user_id'
		password column: '`password`'
		username column: 'user_name'
		enabled sqlType: 'boolean'
		accountExpired column: 'account_expired', sqlType: 'boolean'
		passwordExpired column: 'password_expired', sqlType: 'boolean'
		accountLocked column: 'account_locked', sqlType: 'boolean'
		version false
		autoTimestamp false
		
		
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	String getFullName() {
		firstName + " " + lastName
	}
	
	String toString() {
		getFullName()
	}
}
