package library.items

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityUtils


@Secured(['ROLE_ADMIN'])
class AboutController {

    def index() {
        [bookList: Book.getAll()]
    }
}
