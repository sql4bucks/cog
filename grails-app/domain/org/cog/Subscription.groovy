package org.cog

class Subscription {
	
	Integer			id
	String			name
	String			description

    static constraints = {
		name()
		description(blank:true, nullable:true)
    }
	
	static mapping = {
		table 'subscription'
		id column: 'subscription_id'
		name column: 'name_txt'
		description column: 'description'
		autoTimestamp false
		version false

	}
}

