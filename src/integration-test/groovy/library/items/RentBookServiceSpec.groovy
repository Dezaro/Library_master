package library.items

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class RentBookServiceSpec extends Specification {

    RentBookService rentBookService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new RentBook(...).save(flush: true, failOnError: true)
        //new RentBook(...).save(flush: true, failOnError: true)
        //RentBook rentBook = new RentBook(...).save(flush: true, failOnError: true)
        //new RentBook(...).save(flush: true, failOnError: true)
        //new RentBook(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //rentBook.id
    }

    void "test get"() {
        setupData()

        expect:
        rentBookService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<RentBook> rentBookList = rentBookService.list(max: 2, offset: 2)

        then:
        rentBookList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        rentBookService.count() == 5
    }

    void "test delete"() {
        Long rentBookId = setupData()

        expect:
        rentBookService.count() == 5

        when:
        rentBookService.delete(rentBookId)
        sessionFactory.currentSession.flush()

        then:
        rentBookService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        RentBook rentBook = new RentBook()
        rentBookService.save(rentBook)

        then:
        rentBook.id != null
    }
}
