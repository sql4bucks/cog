package org.cog

class AboutController {
	
	def userAgentService
	def grailsApplication

    def index() {
		
	}

    def credits() {}

    def technical() {
        def agentInfo = userAgentService.getUserAgentInfo()
        String email = grailsApplication.config.cogAdminEmail
        def adminMail = Utility.encodeEmail(email)
        [agentInfo: agentInfo, adminMail: adminMail]
    }
}
