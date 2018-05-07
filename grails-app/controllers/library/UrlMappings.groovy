package library

class UrlMappings {

    static mappings = {

        "/j_spring_security_facebook_redirect" (controller: 'home', action: 'index')

        "/j_spring_security_facebook_check" (view:"/index")

        "/oauth2/google/success" (controller: 'home', action: 'index')

        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"/index")
        "/"(controller: 'home', action: 'index')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
