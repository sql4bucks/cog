package org.cog

import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_SUPER')
class SecureController {
    def index() { render 'Secure access only' }
}
