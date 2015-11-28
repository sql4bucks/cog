package org.cog


class AuditService {

	static transactional = false
	def sessionService
	def springSecurityService
	def timeService 
	
	def setAudit(Object updatedObject) {

		Audit audit = updatedObject as Audit
		log.info "In audit service"
		if (audit) {
			def principal = springSecurityService.principal
			def user = User.get(principal.id)
			Date now = timeService.getTime()
			//Date now = new Date()
			log.info "Setting mod date for ${updatedObject} - ${now}"
			updatedObject.modifiedDate = now
			updatedObject.modifiedUser = user
		}	
					
	}
	
	
}