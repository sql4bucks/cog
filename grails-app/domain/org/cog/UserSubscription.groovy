package org.cog

class UserSubscription {
	
	Integer			id
	AdminUser		user
	Subscription	subscription

    static constraints = {
    }
	
	static mapping = {
		table 'user_subscription'
		id column: 'user_subscription_id'
		subscription column: 'subscription_id'
		user column: 'user_id'
	}
}
