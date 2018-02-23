package library.items

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class HomeController {

    def index() {

        [bookList: Book.getAll(), categoryList: Category.getAll()]
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
        params.max = Math.min(max ?: 3, 6)

        if (params.category == null) {
            bookList = Book.list(params)
        } else {
            category = Category.findById(params.category)
            bookList = Book.findAllByCategory(category)
        }
//        respond bookList , formats: ['json']

//        [bookList: bookList, categoryList: Category.getAll()]
//        render(template: '/book/list', model:  [bookList: bookList])
        render(view: 'index', model: [bookList: bookList, categoryList: Category.getAll()])
//        respond bookList, view: 'index'
    }
}
