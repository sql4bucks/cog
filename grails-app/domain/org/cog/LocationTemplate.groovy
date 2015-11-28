package org.cog

class LocationTemplate {
	
	String		type
	String		label
	String		value
	Integer		sortOrder				

    static constraints = {
		type (blank:false, maxSize:10)
		label (blank: false, maxSize:30)
		value (blank:true, maxSize:50)
    }
	
	static mapping = {
		table "location_template"
		version false
		id column: "location_template_id"
		type column: "type_code"
	}
	
	String toString() {
		return "${label} ${value}"
	}
}
