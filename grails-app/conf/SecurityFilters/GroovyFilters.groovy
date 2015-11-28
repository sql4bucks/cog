package SecurityFilters

import grails.plugin.springsecurity.SpringSecurityUtils

class GroovyFilters {
    def springSecurityService

    def filters =
        {
            preventActions(controller: '*', action: '(update|save|delete)')
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
