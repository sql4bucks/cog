class MyFilters
{
    // Set these to your HTTP/HTTPS ports
    def defaultPortHTTP = 80
    defaultPortHTTPS = 443

    def filters =
    {
        sslFilter(controller:"*",action:"*")
        {
            before =
            {
                def controller = controllerName
                def action = actionName
                log.debug("SSLFilter:
${params?.controller}.${params?.action}")
                def url = null

                // SSL off by default
                def useSSL = false

                // User actions use SSL
                if(controller == "user")
                {
                    // Exclude some user actions
                    def notSSL = ['action1','action2' ]
                    useSSL = !notSSL.contains(action)
                }

                log.debug("${controller}.${action}, useSSL:$useSSL")

                // Get redirected url
                url = getRedirectURL(request,params,useSSL);

                // If redirect url returned, redirect to it
                if(url)
                {
                    redirect(url:url)
                    return false;
                }

                return true;
            }
        }
    }

    def getRedirectURL =
    { request,params,ssl->
        log.debug("getRedirectURL: $ssl")

        // Are we there already?
        if(request.isSecure() == ssl)
            return null;

        def protocol
        def port

        // Otherwise we need to flip
        if(ssl)
        {
            protocol = 'https'

            // If using the standard ports, don't include them on the URL
            port = defaultPortHTTPS
            if(port == "443")
                port = ""
            else
                port = ":${port}"
        }
        else
        {
            protocol = 'http'
            // If using the standard ports, don't include them on the URL
            port = defaultPortHTTP
            if(port == "80")
                port = ""
            else
                port = ":${port}"
        }

        log.debug("Flip protocol to $protocol")

        def url = request.forwardURI
        def server = request.serverName
        def args = paramsAsUrl(params)
        url = "$protocol://$server$port$url$args"

        log.debug("getRedirectURL - redirect to $url")

        return url;
    }

    def paramsAsUrl =
    { params ->
        int ii=0
        String args=""
        params.each
        { k,v ->
            if(['controller','action','id'].find{k==it})
                return;

            if(ii)
                args += "&"
            else
                args += "?"

            args += "$k=$v"
            ii++
        }

        return args

    }
}
