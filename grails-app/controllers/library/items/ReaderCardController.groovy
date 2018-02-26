package library.items

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
class ReaderCardController {

    ReaderCardService readerCardService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond readerCardService.list(params), model:[readerCardCount: readerCardService.count()]
    }

    def show(Long id) {
        respond readerCardService.get(id)
    }

    def showAllNotReturnedBooks(Long id){
        def rentBookItems
        def readerCard
        readerCard = ReaderCard.findById(id)
        rentBookItems = RentBook.findAllByReaderCardAndIsReturn(readerCard, false)
        [rentBookItems: rentBookItems]
    }

    def showAllGivenBooks(Long id){
        def rentBookItems
        def readerCard
        readerCard = ReaderCard.findById(id)
        rentBookItems = RentBook.findAllByReaderCard(readerCard)
        [rentBookItems: rentBookItems]
    }

    def create() {
        respond new ReaderCard(params)
    }

    def save(ReaderCard readerCard) {
        if (readerCard == null) {
            notFound()
            return
        }

        try {
            readerCardService.save(readerCard)
        } catch (ValidationException e) {
            respond readerCard.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'readerCard.label', default: 'ReaderCard'), readerCard.id])
                redirect readerCard
            }
            '*' { respond readerCard, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond readerCardService.get(id)
    }

    def update(ReaderCard readerCard) {
        if (readerCard == null) {
            notFound()
            return
        }

        try {
            readerCardService.save(readerCard)
        } catch (ValidationException e) {
            respond readerCard.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'readerCard.label', default: 'ReaderCard'), readerCard.id])
                redirect readerCard
            }
            '*'{ respond readerCard, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        readerCardService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'readerCard.label', default: 'ReaderCard'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'readerCard.label', default: 'ReaderCard'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
