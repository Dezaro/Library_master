package library

class UrlMappings {

    static mappings = {
        "/$lang/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

//        "/"(view:"/index")
        "/"(lang: 'en',controller: 'home', action: 'index')
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}
