package org.cog

import org.springframework.web.context.request.RequestContextHolder as RCH

class UserAgentService {
 
 
    boolean transactional = false
 
    static scope = "prototype"
 
    def getRequest()
    {
    	return RCH.currentRequestAttributes().currentRequest
    }
 
    def getSession()
    {
    	return RCH.currentRequestAttributes().session 
    }

	public final static String CHROME = "Chrome"
	public final static String FIREFOX = "Firefox"
	public final static String SAFARI = "Safari"
	public final static String OTHER = "Other"
	public final static String MSIE = "Internet Explorer"
	public final static String UNKNOWN = "unknown"
	public final static String BLACKBERRY = "Blackberry"
	public final static String SEAMONKEY = "seamonkey"
	public final static String OPERA = "Opera"
 
	public final static int CLIENT_CHROME = 0
	public final static int CLIENT_FIREFOX = 1
	public final static int CLIENT_SAFARI = 2
	public final static int CLIENT_OTHER = 3
	public final static int CLIENT_MSIE = 4
	public final static int CLIENT_UNKNOWN = 5
	public final static int CLIENT_BLACKBERRY = 6
	public final static int CLIENT_SEAMONKEY = 7
	public final static int CLIENT_OPERA = 8
	
 
	def getUserAgentTag()
	{
		getRequest().getHeader("user-agent")
	}
 
	def getUserAgentInfo()
	{
 
		def userAgent = getUserAgentTag()
		log.info ("User agent = ${userAgent}")
 
		def agentInfo = getRequest().getSession().getAttribute("UserAgentService.agentInfo")
		if (agentInfo != null && agentInfo.agentString == userAgent) {
			return agentInfo
		} else if (agentInfo != null && agentInfo.agentString != userAgent) {
			log.warn "User agent string has changed in a single session!"
			log.warn "Previous User Agent: ${agentInfo.agentString}"
			log.warn "New User Agent: ${userAgent}"
			log.warn "Discarding existing agent info and creating new..."
		} else {
			log.debug "User agent info does not exist in session scope, creating..."
		}
 
		agentInfo = [:]
 
		def browserVersion
		def browserType
		def operatingSystem
 
		def platform
		def security = "unknown"
		def language = "en-US"
 
		if (userAgent == null) {
			agentInfo.browserType = UserAgentService.CLIENT_UNKNOWN
			return agentInfo
		}
 
		browserType = UserAgentService.CLIENT_OTHER;
 
		int pos = -1;
		if ((pos = userAgent.indexOf("Firefox")) >= 0) {
			browserType = UserAgentService.CLIENT_FIREFOX;
			browserVersion = userAgent.substring(pos + 8).trim();
			if (browserVersion.indexOf(" ") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(" "));
			log.debug("Browser type: Firefox " + browserVersion);
		}
		if ((pos = userAgent.indexOf("Chrome")) >= 0) {
			browserType = UserAgentService.CLIENT_CHROME;
			browserVersion = userAgent.substring(pos + 7).trim();
			if (browserVersion.indexOf(" ") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(" "));
			log.debug("Browser type: Chrome " + browserVersion);
 
		}
		if ((pos = userAgent.indexOf("Opera")) >= 0) {
			browserType = UserAgentService.CLIENT_OPERA;
			browserVersion = userAgent.substring(pos + 6).trim();
			if (browserVersion.indexOf(" ") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(" "));
			log.debug("Browser type: Opera " + browserVersion);
 
		}
		if ((pos = userAgent.indexOf("Safari")) >= 0 && (userAgent.indexOf("Chrome") == -1)) {
			browserType = UserAgentService.CLIENT_SAFARI;
			browserVersion = userAgent.substring(pos + 7).trim();
			if (browserVersion.indexOf(" ") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(" "));
			log.debug("Browser type: Safari " + browserVersion);
 
		}
		if ((pos = userAgent.indexOf("BlackBerry")) >= 0) {
			browserType = UserAgentService.CLIENT_BLACKBERRY;
			browserVersion = userAgent.substring(userAgent.indexOf("/")).trim();
			if (browserVersion.indexOf(" ") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(" "));
			log.debug("Browser type: BlackBerry " + browserVersion);
 
		}
		if ((pos = userAgent.indexOf("SeaMonkey")) >= 0) {
			browserType = UserAgentService.CLIENT_SEAMONKEY;
			browserVersion = userAgent.substring(userAgent.indexOf("/")).trim();
			if (browserVersion.indexOf(" ") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(" "));
			log.debug("Browser type: SeaMonkey " + browserVersion);
 
		}
		if ((pos = userAgent.indexOf("MSIE")) >= 0) {
			browserType = UserAgentService.CLIENT_MSIE;
			browserVersion = userAgent.substring(pos + 5).trim();
			if (browserVersion.indexOf(" ") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(" "));
			if (browserVersion.indexOf(";") > 0)
				browserVersion = browserVersion.substring(0, browserVersion.indexOf(";"));
			log.debug("Browser type: MSIE " + browserVersion);
 
		}
 
 
		if (userAgent.indexOf("(") > 0) {
			String osInfo = userAgent.substring(userAgent.indexOf("(") + 1);
			osInfo = osInfo.substring(0, osInfo.indexOf(")"));
			log.info("OS info = ${osInfo}")
 
			String[] infoParts = osInfo.split(" ");
			platform = infoParts[0];
			operatingSystem = infoParts[2];
 
			if (browserType != UserAgentService.CLIENT_MSIE) {
				if (infoParts[1].equals("U"))
					security = "strong";
				if (infoParts[1].equals("I"))
					security = "weak";
				if (infoParts[1].equals("N"))
					security = "none";
 
				language = "" //infoParts[3];
 
			}
 
		} else {
			if (browserType == UserAgentService.CLIENT_BLACKBERRY) {
				operatingSystem = "BlackBerry " + browserVersion;
			}
		}
 
		agentInfo.browserVersion = browserVersion
		agentInfo.browserType = browserType
		agentInfo.operatingSystem = operatingSystem
		agentInfo.platform = platform
		agentInfo.security = security
		agentInfo.language = language
		agentInfo.agentString = userAgent
		agentInfo.browserName = getBrowserType(browserType)
		log.debug "Browser name = ${agentInfo.browserName}"
 
 
		getRequest().getSession().setAttribute("UserAgentService.agentInfo", agentInfo)
		return agentInfo
	}
 
 
	public boolean isChrome()
	{
		return (getUserAgentInfo().browserType == UserAgentService.CLIENT_CHROME);
	}
 
	public boolean isFirefox()
	{
		return (getUserAgentInfo().browserType == UserAgentService.CLIENT_FIREFOX);
	}
 
	public boolean isMsie()
	{
		return (getUserAgentInfo().browserType == UserAgentService.CLIENT_MSIE);
	}
 
	public boolean isOther()
	{
		return (getUserAgentInfo().browserType == UserAgentService.CLIENT_OTHER);
	}
 
	public boolean isSafari()
	{
		return (getUserAgentInfo().browserType == UserAgentService.CLIENT_SAFARI);
	}
 
	public boolean isBlackberry()
	{
		return (getUserAgentInfo().browserType == UserAgentService.CLIENT_BLACKBERRY);
	}
 
	public boolean isSeamonkey()
	{
		return (getUserAgentInfo().browserType == UserAgentService.CLIENT_SEAMONKEY);
	}
 
 
	public String getBrowserVersion()
	{
		return getUserAgentInfo().browserVersion;
	}
 
	public String getOperatingSystem()
	{
		return getUserAgentInfo().operatingSystem;
	}
 
	public String getPlatform()
	{
		return getUserAgentInfo().platform;
	}
 
	public String getSecurity()
	{
		return getUserAgentInfo().security;
	}
 
	public String getLanguage()
	{
		return getUserAgentInfo().language;
	}
 
	public String getBrowserType(browserType)
	{
		switch (browserType) {
		case CLIENT_FIREFOX:
			return FIREFOX;
		case CLIENT_CHROME:
			return CHROME;
		case CLIENT_SAFARI:
			return SAFARI;
		case CLIENT_SEAMONKEY:
			return SEAMONKEY;
		case CLIENT_MSIE:
			return MSIE;
		case CLIENT_BLACKBERRY:
			return BLACKBERRY;
		case CLIENT_OPERA:
			return OPERA;
		case CLIENT_OTHER:
		case CLIENT_UNKNOWN:
		default:
			return OTHER;
		}
	}
	
	public String getBrowserType() {
		def browserType = getUserAgentInfo().browserType
		return getBrowserType(browserType)
	}
	
}
	 
