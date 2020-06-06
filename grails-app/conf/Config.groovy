grails.config.locations = [ "classpath:${appName}-config.groovy"]

def configLocation = "COG_CONFIG"
def defaultConfiguration = "/home/javabucks/cog/cog-config.groovy"

if(!grails.config.locations || !(grails.config.locations instanceof List)) {
    grails.config.locations = []
}
if(System.getenv(configLocation)) {
    println "Including configuration file specified in environment: " + System.getenv(configLocation)
    grails.config.locations << "file:" + System.getenv(configLocation)
} else if(System.getProperty(configLocation)) {
    println "Including configuration file specified on command line: " + System.getProperty(configLocation)
    grails.config.locations << "file:" + System.getProperty(configLocation)
} else {
    File defaultConfig = new File(defaultConfiguration)
    if (defaultConfig.exists()) {
        println " Found default configuration file at ${defaultConfiguration}"
        grails.config.locations << "file:" + defaultConfiguration
    } else {
        println "WARNING! No external configuration file found."
    }
}

javax.servlet.http.HttpServletRequest.metaClass.getSiteUrl = {
    final String url = delegate.getRequestURL().toString()
    return url.replace("grails/","").replace(".dispatch","")
}

cog.bible.gateway.base.url = "http://www.biblegateway.com/passage/?search="

// secureServerURL="https://localhost"

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text/plain',
                      js: 'text/javascript',
                      mp3: 'audio/mpeg3',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// jQuery
grails.views.javascript.library="jquery"


// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// enable query caching by default
grails.hibernate.cache.queries = true

// set per-environment serverURL stem for creating absolute links
def logDirectory = null
environments {
    development {
        grails.logging.jul.usebridge = true
        logDirectory='/var/log/cog'

    }
    production {
        grails.logging.jul.usebridge = false
        logDirectory='/home/javabucks/tomcat/logs'
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}


// log4j configuration
log4j = {
    appenders {
        console name:'stdout', threshold: org.apache.log4j.Level.ERROR
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
    info   'grails.app',
            'org.cog'


}

