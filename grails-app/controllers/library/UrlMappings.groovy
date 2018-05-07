package library

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/j_spring_security_facebook_redirect" (controller: 'home', action: 'index')

//        "/"(view:"/index")
        "/"(controller: 'home', action: 'index')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
