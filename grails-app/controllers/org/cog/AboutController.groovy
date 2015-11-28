package org.cog

class AboutController {
	
	def userAgentService
	def grailsApplication

    def index() {
		
		 def agentInfo = userAgentService.getUserAgentInfo()
		 def adminMail = Utility.encodeEmail(grailsApplication.config.cog.admin.email)
		 [agentInfo: agentInfo, adminMail: adminMail]
		
	}
}
