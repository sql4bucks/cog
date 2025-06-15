package SecurityFilters

import grails.plugin.springsecurity.SpringSecurityUtils

class GroovyFilters {
    def springSecurityService

    def filters =
        {
            preventActions(controller: '*', action: '(update|save)')
                    {
                        before = {

                            def principal = springSecurityService.getPrincipal()
                            if (principal == "anonymousUser") {
                                redirect(controller: "login", action: "auth", params: [cName: controllerName, aName: actionName, id: params.id])
                                return false
                            } else {
                                if (SpringSecurityUtils.ifNotGranted("ROLE_ADMIN,ROLE_SUPER,ROLE_SUGGEST")) {
                                    return false
                                }

                            }
                        }
                    }
            preventActions(controller: '*', action: '(delete)')
                    {
                        before = {

                            def principal = springSecurityService.getPrincipal()
                            if (principal == "anonymousUser") {
                                redirect(controller: "login", action: "auth", params: [cName: controllerName, aName: actionName, id: params.id])
                                return false
                            } else {
                                if (SpringSecurityUtils.ifNotGranted("ROLE_ADMIN,ROLE_SUPER")) {
                                    return false
                                }

                            }
                        }
                    }
        }

}		
