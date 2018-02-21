package library.items

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class BookItemServiceSpec extends Specification {

    BookItemService bookItemService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new BookItem(...).save(flush: true, failOnError: true)
        //new BookItem(...).save(flush: true, failOnError: true)
        //BookItem bookItem = new BookItem(...).save(flush: true, failOnError: true)
        //new BookItem(...).save(flush: true, failOnError: true)
        //new BookItem(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //bookItem.id
    }

    void "test get"() {
        setupData()

        expect:
        bookItemService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<BookItem> bookItemList = bookItemService.list(max: 2, offset: 2)

        then:
        bookItemList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        bookItemService.count() == 5
    }

    void "test delete"() {
        Long bookItemId = setupData()

        expect:
        bookItemService.count() == 5

        when:
        bookItemService.delete(bookItemId)
        sessionFactory.currentSession.flush()

        then:
        bookItemService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        BookItem bookItem = new BookItem()
        bookItemService.save(bookItem)

        then:
        bookItem.id != null
    }
}
