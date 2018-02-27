package library.items

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
class RentBookController {

    RentBookService rentBookService
    BookItemService bookItemService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond rentBookService.list(params), model:[rentBookCount: rentBookService.count()]
    }

    def show(Long id) {
        respond rentBookService.get(id)
    }

    def showAllNotReturned(Integer max) {
        def notReturnedList
        notReturnedList = RentBook.findAllByIsReturn(false,[sort: "returnBeforeDate", order: "asc"]);
        [notReturnedList: notReturnedList]
    }

    def returnBook(Long id){
        def rentBook
        rentBook = RentBook.findById(id)
        rentBook.isReturn = Boolean.TRUE
        rentBook.returnDate = new Date()
        rentBookService.save(rentBook)
        redirect(controller: "readerCard", action: "show", id: rentBook.readerCard.id)
    }

    def create() {
        respond new RentBook(params)
    }

    def save(RentBook rentBook) {
        def bookItem
        if (rentBook == null) {
            notFound()
            return
        }

        try {
            rentBookService.save(rentBook)
            bookItem = BookItem.findById(rentBook.bookItem.id)
            if (rentBook.isReturn == Boolean.TRUE) {
                bookItem.isAvailable = Boolean.TRUE
            } else {
                bookItem.isAvailable = Boolean.FALSE
            }
            bookItemService.save(bookItem)
        } catch (ValidationException e) {
            respond rentBook.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'rentBook.label', default: 'RentBook'), rentBook.id])
                redirect rentBook
            }
            '*' { respond rentBook, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond rentBookService.get(id)
    }

    def update(RentBook rentBook) {
        if (rentBook == null) {
            notFound()
            return
        }

        try {
            rentBookService.save(rentBook)
        } catch (ValidationException e) {
            respond rentBook.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'rentBook.label', default: 'RentBook'), rentBook.id])
                redirect rentBook
            }
            '*'{ respond rentBook, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        rentBookService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'rentBook.label', default: 'RentBook'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rentBook.label', default: 'RentBook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
