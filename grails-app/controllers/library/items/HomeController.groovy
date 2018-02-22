package library.items

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class HomeController {

    def index() {
        respond Book.getAll()
    }

    def search(Integer max) {
        def bookList
        BookController bookController = new BookController()
        bookList = bookController.search(max)
        respond bookList, view: 'index'
    }
}