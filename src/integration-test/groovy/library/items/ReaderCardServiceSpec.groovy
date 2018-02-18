package library.items

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ReaderCardServiceSpec extends Specification {

    ReaderCardService readerCardService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new ReaderCard(...).save(flush: true, failOnError: true)
        //new ReaderCard(...).save(flush: true, failOnError: true)
        //ReaderCard readerCard = new ReaderCard(...).save(flush: true, failOnError: true)
        //new ReaderCard(...).save(flush: true, failOnError: true)
        //new ReaderCard(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //readerCard.id
    }

    void "test get"() {
        setupData()

        expect:
        readerCardService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<ReaderCard> readerCardList = readerCardService.list(max: 2, offset: 2)

        then:
        readerCardList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        readerCardService.count() == 5
    }

    void "test delete"() {
        Long readerCardId = setupData()

        expect:
        readerCardService.count() == 5

        when:
        readerCardService.delete(readerCardId)
        sessionFactory.currentSession.flush()

        then:
        readerCardService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        ReaderCard readerCard = new ReaderCard()
        readerCardService.save(readerCard)

        then:
        readerCard.id != null
    }
}
