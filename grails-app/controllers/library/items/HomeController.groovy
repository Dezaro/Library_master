package library.items

import grails.plugin.springsecurity.annotation.Secured

//@Secured(['ROLE_ADMIN'])
class HomeController {

    def index() {

        [bookList: Book.getAll()]
//        respond Book.getAll(), Category.getAll()
    }

    def search(Integer max) {
        def bookList
        BookController bookController = new BookController()
        bookList = bookController.search(max)
        respond bookList, view: 'index'
    }


    def filter(Integer max) {
        def bookList
        def category
        def author
        params.max = Math.min(max ?: 3, 6)

        if (params.category == "null" && params.author == "null") {
            bookList = Book.getAll()
        } else {
            if(params.category != "null" && params.author != "null") {
                category = Category.findById(params.category)
                author = Author.findById(params.author)
                bookList = Book.findAllByAuthorAndCategory(author, category)
            } else if (params.category != "null"){
                category = Category.findById(params.category)
                bookList = Book.findAllByCategory(category)
            } else {
                author = Author.findById(params.author)
                bookList = Book.findAllByAuthor(author)
            }
        }

        render(view: 'index', model: [bookList: bookList])
    }
}
