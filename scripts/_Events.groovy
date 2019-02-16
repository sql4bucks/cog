import org.apache.catalina.loader.WebappLoader

eventConfigureTomcat = { tomcat ->
    def mediaContext = tomcat.addWebapp("/media", "/Users/andylewis/data/media")
    mediaContext.reloadable = false
    def loader = new WebappLoader(tomcat.class.classLoader)
    loader.container = mediaContext
    mediaContext.loader = loader

    //bonus answer - gzip json response
    //tomcat.connector.setAttribute("compression", "on")
    //tomcat.connector.setAttribute("compressableMimeType", "applicatio/json")
}
