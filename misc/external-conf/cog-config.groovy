import org.apache.catalina.loader.WebappLoader

/* ----------------------------------------------------------
* Application specific
* ---------------------------------------------------------- */

dataSource {
    dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
	driverClassName = "com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/cog?autoReconnect=true"
	username = "cog"
	password = "real-password-goes-here"
	pooled = true
	// Other database parameters..
	properties {
	   maxActive = 50
	   maxIdle = 25
	   minIdle = 5
	   initialSize = 5
	   maxWait = 100000
	   minEvictableIdleTimeMillis = 1800000
	   timeBetweenEvictionRunsMillis = 1800000
	   maxWait = 10000
	}
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
	// cache.provider_class = 'net.sf.ehcache.hibernate.EhCacheProvider'
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}


cog.media.root = "/cogmedia/"
cog.media.url = "http://localhost:8080"
cog.bible.gateway.base.url = "http://www.biblegateway.com/passage/?search="
cogAdminEmail = "admin@churchofgodportland.org"

secureServerURL="https://localhost:8443"
// Don't cache resources
grails.resources.debug = true

// jQuery
grails.views.javascript.library="jquery"

// enable query caching by default
grails.hibernate.cache.queries = true

// set per-environment serverURL stem for creating absolute links
environments {
   development {
	   grails.logging.jul.usebridge = true
   }
   production {
	   grails.logging.jul.usebridge = false
   }
}

// log4j configuration
def logDirectory='/var/log/cog'
log4j = {
    appenders {
        console name:'stdout', threshold: ERROR
        rollingFile name:'file', file: "${logDirectory}/cog.log", maxFileSize:"1MB", maxBackupIndex: 10, 'append':true, additivity:false
    }

    root { info 'stdout', 'file' }

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
            'org.codehaus.groovy.grails.web.pages', //  GSP
            'org.codehaus.groovy.grails.web.sitemesh', //  layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping', // URL mapping
            'org.codehaus.groovy.grails.commons', // core / classloading
            'org.codehaus.groovy.grails.plugins', // plugins
            'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
    info   'grails.app'

}


// Spring Security
grails.plugin.springsecurity.userLookup.userDomainClassName = 'org.cog.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'org.cog.UserRole'
grails.plugin.springsecurity.authority.className = 'org.cog.Role'
grails.plugin.springsecurity.securityConfigType="InterceptUrlMap"
grails.plugin.springsecurity.portMapper.httpPort = '8080'
grails.plugin.springsecurity.portMapper.httpsPort = '8443'
grails.plugin.springsecurity.useSecurityEventListener = true
// grails.plugin.springsecurity.auth.forceHttps = true

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
        '/':                ['permitAll'],
        '/index':           ['permitAll'],
        '/index.gsp':       ['permitAll'],
        '/assets/**':       ['permitAll'],
        '/**/js/**':        ['permitAll'],
        '/**/css/**':       ['permitAll'],
        '/**/images/**':    ['permitAll'],
        '/**/favicon.ico':  ['permitAll']
]

grails.plugin.springsecurity.roleHierarchy = '''
ROLE_SUPER > ROLE_ADMIN > ROLE_USER
'''

grails.plugin.springsecurity.interceptUrlMap = [
        '/login/**':     ['IS_AUTHENTICATED_ANONYMOUSLY'],
        'j_spring_security_check': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/js/**':        ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/css/**':       ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/images/**':    ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/static/js/**':        ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/static/css/**':       ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/static/images/**':    ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/admin/*':		 ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/*/edit/*':   	 ['ROLE_ADMIN'],
        '/*/create':   	 ['ROLE_ADMIN'],
        '/*/delete/*': 	 ['ROLE_ADMIN'],
        '/*/update':   	 ['ROLE_ADMIN'],
        '/user/**':   	 ['ROLE_SUPER'],
        '/role/**':   	 ['ROLE_SUPER'],
        '/userRole/**':	 ['ROLE_SUPER'],
        '/**':            ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/logout/**':    ['IS_AUTHENTICATED_ANONYMOUSLY']
]

grails.plugin.springsecurity.secureChannel.definition = [
        '/login/**': 'ANY_CHANNEL',
//        '/login/**': 'REQUIRES_SECURE_CHANNEL' '+
        'j_spring_security_check': 'ANY_CHANNEL',
//        '/j_spring_security_check': 'REQUIRES_SECURE_CHANNEL',
        '/images/**': 'ANY_CHANNEL',
        '/css/**': 'ANY_CHANNEL',
        '/js/**': 'ANY_CHANNEL',
        '/static/images/**': 'ANY_CHANNEL',
        '/static/css/**': 'ANY_CHANNEL',
        '/static/js/**': 'ANY_CHANNEL',
        '/static/grails/**': 'ANY_CHANNEL',
        '/grails/**': 'ANY_CHANNEL',
        '/**': 'REQUIRES_INSECURE_CHANNEL' ]

/*
grails.plugins.springsecurity. onInteractiveAuthenticationSuccessEvent = { e, appCtx ->
	// handle InteractiveAuthenticationSuccessEvent
	// def principal = appCtx.springSecurityService.principal
	//def user = User.get(principal.id)
	//log.info "Principal = ${principal}"
	//log.info "Principal ID = ${principal.id}"
	//def time = appCtx.timeService
	//def date = time.getTime()
	log.info("User logged in successfully")
	// appCtx.sessionService.logon(user)
}
*/

/*
// Digest authentication setting
grails.plugins.springsecurity.useDigestAuth = true
grails.plugins.springsecurity.digest.realmName = "Church of God - Portland"
grails.plugins.springsecurity.digest.key = "Mdax3zc4"
grails.plugins.springsecurity.digest.useCleartextPasswords = true
grails.plugins.springsecurity.digest.passwordAlreadyEncoded = false
*/

// Use following behind an F5
// grails.plugins.springsecurity.secureChannel.useHeaderCheckChannelSecurity = true

//grails.plugins.springsecurity.useSessionFixationPrevention = true
//grails.plugins.springsecurity.sessionFixationPrevention.migrate = true
//grails.plugins.springsecurity.sessionFixationPrevention.alwaysCreateSession = false
