package org.cog

class Location {
	
	Integer			id
	City			city
	String			name
	String			address
	String			description
	String			active
	String 			googleUrl

    static constraints = {
		name (nullable:false, blank:false, maxSize:30)
		description(blank:true, nullable:true)
		address(blank:true, nullable:true)
		active (blank:false, nullable:false)
		googleUrl (blank:true, nullable:true, maxSize:1000)
    }
	
	static hasMany = [details: LocationDetail]
	
	static mapping = {
		table 'location'
		id column: 'location_id'
		name column: 'name_txt'
		active column: "active_ind"
		googleUrl column: "google_url"
		description column: 'description'
		city column: 'city_id'
		autoTimestamp false
		version false
		details fetch: "join", sort: "sortOrder"

	}
	
	String toString() {
		"${name}, ${city.state.code}"
	}

}
