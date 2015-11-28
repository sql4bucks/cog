package org.cog

class LocationDetail {
	
	Location	location
	String		type
	String		label
	String		value
	Integer		sortOrder				

    static constraints = {
		type (blank:false, maxSize:10)
		label (blank: false, maxSize:30)
		value (blank:true, maxSize:50)
    }
	
	static belongsTo = [location:Location]
	
	static mapping = {
		table "location_detail"
		version false
		id column: "location_detail_id"
		location column: "location_id"
		type column: "type_code"
	}
	
	String toString() {
		return "${label} ${value}"
	}
	
	String getEncodeMask() {
		return Utility.encodeEmail(this.value)
	}
}
