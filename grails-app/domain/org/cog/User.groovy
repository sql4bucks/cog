package org.cog

class User implements Serializable {

	private static final long serialVersionUID = 1

	transient springSecurityService

	String username
	String password
	String firstName
	String lastName
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	User(String username, String password) {
		this.username = username
		this.password = password
	}

    static constraints = {
        username blank: false, unique: true
        password blank: false
        firstName blank:false
        lastName blank: false
    }

	@Override
	int hashCode() {
		username?.hashCode() ?: 0
	}

	@Override
	boolean equals(other) {
		is(other) || (other instanceof User && other.username == username)
	}

	@Override
	String toString() {
		username
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this)*.role
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
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}

	String getFullName() {
		firstName + " " + lastName
	}

    static mapping = {
    table: "User"
    id generator: 'native',  column: 'user_id'
    username column: 'user_name'
    password column: '`password`'
    enabled sqlType: 'boolean'
    accountExpired column: 'account_expired', sqlType: 'boolean'
    passwordExpired column: 'password_expired', sqlType: 'boolean'
    accountLocked column: 'account_locked', sqlType: 'boolean'
    version false
    autoTimestamp false
    }
}
