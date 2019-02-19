package org.cog

class AboutController {
	
	def userAgentService
	def grailsApplication

    def index() {
		
		def agentInfo = userAgentService.getUserAgentInfo()
        String email = grailsApplication.config.cogAdminEmail
        def adminMail = Utility.encodeEmail(email)
//        def adminMail = Utility.encodeEmail(grailsApplication.config.cog.admin.email)
        [agentInfo: agentInfo, adminMail: adminMail]
	}
}
