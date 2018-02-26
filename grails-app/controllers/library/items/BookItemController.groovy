package library.items

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
class BookItemController {

    BookItemService bookItemService
    BookService bookService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond bookItemService.list(params), model:[bookItemCount: bookItemService.count()]
    }

    def show(Long id) {
        respond bookItemService.get(id)
    }

    def create() {
        respond new BookItem(params)
    }

    def save(BookItem bookItem) {
        def book
        if (bookItem == null) {
            notFound()
            return
        }

        try {
            bookItemService.save(bookItem)
            book = Book.findById(bookItem.book.id)
            book.availability = book.availability + 1;
            bookService.save(book);
        } catch (ValidationException e) {
            respond bookItem.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'bookItem.label', default: 'BookItem'), bookItem.id])
                redirect bookItem
            }
            '*' { respond bookItem, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond bookItemService.get(id)
    }

    def update(BookItem bookItem) {
        if (bookItem == null) {
            notFound()
            return
        }

        try {
            bookItemService.save(bookItem)
        } catch (ValidationException e) {
            respond bookItem.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'bookItem.label', default: 'BookItem'), bookItem.id])
                redirect bookItem
            }
            '*'{ respond bookItem, [status: OK] }
        }
    }

    def delete(Long id) {
        def bookItem
        def book
        if (id == null) {
            notFound()
            return
        }

        bookItemService.delete(id)
        bookItem = BookItem.findById(id)
        book = Book.findById(bookItem.book.id)
        book.availability = book.availability - 1;
        if (book.availability < 0) {
            book.availability = 0;
        }
        bookService.save(book);

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'bookItem.label', default: 'BookItem'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'bookItem.label', default: 'BookItem'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
