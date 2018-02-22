package library.items

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

@SuppressWarnings(['FactoryMethodName', 'ReturnNullFromCatchBlock'])
@Secured(['ROLE_ADMIN'])
class BookController {

    BookService bookService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def search(Integer max) {
        def bookList
        def bookTotal
        params.max = Math.min(max ?: 3, 6)

        if (params.title == null) {
            bookList = Book.list(params)
            bookTotal = Book.count()
        } else {
            bookList = Book.findAllByTitleIlike('%' + params.title + '%', params)
            bookTotal = Book.findAllByTitleIlike('%' + params.title + '%').size()
        }
//        respond bookList, formats: ['json']

        [bookList: bookList, bookTotal: bookTotal, params: params]
//        respond bookList, bookTotal, params
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bookService.list(params), model: [bookCount: bookService.count()]
    }

    def show(Long id) {
        respond bookService.get(id)
    }

    def create() {
        respond new Book(params)
    }

    def save(Book book) {
        if (book == null) {
            notFound()
            return
        }

        try {
            bookService.save(book)
        } catch (ValidationException e) {
            respond book.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'book.label', default: 'Book'), book.id])
                redirect book
            }
            '*' { respond book, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond bookService.get(id)
    }

    def update(Book book) {
        if (book == null) {
            notFound()
            return
        }

        try {
            bookService.save(book)
        } catch (ValidationException e) {
            respond book.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'book.label', default: 'Book'), book.id])
                redirect book
            }
            '*' { respond book, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        bookService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'book.label', default: 'Book'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'book.label', default: 'Book'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
