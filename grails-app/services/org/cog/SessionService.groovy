package org.cog

import javax.servlet.http.HttpSession
import org.springframework.web.context.request.RequestContextHolder

class SessionService {
	
	  static transactional = false
	  static scope = "singleton"
	  
	  def timeService, securityService
	  def springSecurityService
	  
	  def setUser(User user) {
		getSession().user = user
	  }
	  
	  def getUser() {
		def principal = springSecurityService.principal
		return User.get(principal.id)
	  }
	

	  def getTimeOffset() {
		  getSession().timeOffset
	  }

	  def setTimeOffset(long time) {
		  getSession().timeOffset = time
	  }	  

	  def setTimeOffset(Object time) {
		  getSession().timeOffset = time
	  }
	  
	  def getRoleName() {
		  getSession().roleName
	   }
	   
	   def setRoleName (String role) {
			 getSession().roleName = role
	   }
	  
	  def logout() {
		  getSession().invalidate()
	  }
	  
	  def logon(User user) {
		  setUser(user)
		  timeService.initializeTime()
	  }
	  	 
	  private HttpSession getSession() {
		return RequestContextHolder.currentRequestAttributes().getSession()
	  }
	  
}


