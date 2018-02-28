package library.items

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import groovy.time.TimeCategory

@Secured(['ROLE_ADMIN'])
class RentBookController {

    RentBookService rentBookService
    BookItemService bookItemService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        //   respond rentBookService.list(params), formats: ['json']
        respond rentBookService.list(params), model: [rentBookCount: rentBookService.count()]
    }

    def show(Long id) {
        respond rentBookService.get(id)
    }

    def showAllNotReturned(Integer max) {
        def notReturnedList
        notReturnedList = RentBook.findAllByIsReturn(false, [sort: "returnBeforeDate", order: "asc"]);
//        [rentBookList: notReturnedList]
        respond(view: 'index', [rentBookList: notReturnedList])
    }

    def giveBook() {
        def rentBook
        def readerCard
        def bookItem
        rentBook = new RentBook()
        readerCard = ReaderCard.findById(params.readerCardId.toLong())
        bookItem = BookItem.findById(params.bookItemId.toLong())
        rentBook.setReaderCard(readerCard)
        rentBook.setBookItem(bookItem)
        rentBook.setRentDate(new Date())
        rentBook.setIsReturn(false)
        use(TimeCategory) {
            rentBook.setReturnBeforeDate(new Date() + 2.month)
        }
        rentBookService.save(rentBook)
        changeAvailability(rentBook)
        redirect(controller: "readerCard", action: "show", id: params.readerCardId)
    }

    def returnBook(Long id) {
        def rentBook
        rentBook = RentBook.findById(id)
        rentBook.isReturn = Boolean.TRUE
        rentBook.returnDate = new Date()
        rentBookService.save(rentBook)
        changeAvailability(rentBook)
        if (params.view == 'rent') {
            redirect(action: "index")
        } else {
            redirect(controller: "readerCard", action: "show", id: rentBook.readerCard.id)
        }
    }

    void changeAvailability(RentBook rentBook) {
        def bookItem
        bookItem = BookItem.findById(rentBook.bookItem.id)
        if (rentBook.isReturn) {
            bookItem.isAvailable = Boolean.TRUE
        } else {
            bookItem.isAvailable = Boolean.FALSE
        }
        bookItemService.save(bookItem)
    }

    def create() {
        respond new RentBook(params)
    }

    def save(RentBook rentBook) {
        if (rentBook == null) {
            notFound()
            return
        }

        try {
            rentBookService.save(rentBook)
            changeAvailability(rentBook)
        } catch (ValidationException e) {
            respond rentBook.errors, view: 'create'
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
            changeAvailability(rentBook)
        } catch (ValidationException e) {
            respond rentBook.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'rentBook.label', default: 'RentBook'), rentBook.id])
                redirect rentBook
            }
            '*' { respond rentBook, [status: OK] }
        }
    }

    def delete(Long id) {
        def rentBook

        if (id == null) {
            notFound()
            return
        }

        rentBook = RentBook.findById(id)
        rentBook.setIsReturn(true)
        rentBookService.save(rentBook)
        changeAvailability(rentBook)

        rentBookService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'rentBook.label', default: 'RentBook'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'rentBook.label', default: 'RentBook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
