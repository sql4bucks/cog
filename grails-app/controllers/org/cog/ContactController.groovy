package org.cog

class ContactController {

    def index() { 
		def list = Location.findAllWhere(active: "Y").sort {it.city?.state?.code + it.name}
		Location defaultLocation = list.find{ it.name == 'Gladstone'}
		log.info("Default location = ${defaultLocation}")
		log.info("Default details = ${defaultLocation.details}")

		return [locationList: list, defaultLocation: defaultLocation, defaultDetails: defaultLocation.details]
    }
	
	def changeDetails() {
		def location = Location.get(params.id)
		render (template: "/contact/details", model: [locationDetails: location.details])
	}
	
	def changeMap() {
		def location = Location.get(params.id)
		render (template: "/contact/map", model: [location: location])
	}
	
	def testMapsAPI() {
		
	}
	
	def links() {
		
		
	}
}
