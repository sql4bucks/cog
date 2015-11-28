package org.cog

class SecurityService {

	def sessionService
    static transactional = false
    
	def isPower() {
		def level = sessionService.getAccessLevel()
		return ( level >= SecurityAccess.POWER.value() )
    }

	def isSuper() {
		def level = sessionService.getAccessLevel()
		return ( level >= SecurityAccess.SUPER.value() )
	}

	def isUploader() {
		def level = sessionService.getAccessLevel()
		return ( level >= SecurityAccess.UPLOADER.value() )
	}

	def isViewer() {
		def level = sessionService.getAccessLevel()
		return ( level >= SecurityAccess.VIEWER.value() )
	}

	
}

