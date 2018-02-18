package library.items

import grails.testing.gorm.DomainUnitTest
import grails.testing.web.controllers.ControllerUnitTest
import grails.validation.ValidationException
import spock.lang.*

class ReaderCardControllerSpec extends Specification implements ControllerUnitTest<ReaderCardController>, DomainUnitTest<ReaderCard> {

    def populateValidParams(params) {
        assert params != null

        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
        assert false, "TODO: Provide a populateValidParams() implementation for this generated test suite"
    }

    void "Test the index action returns the correct model"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * list(_) >> []
            1 * count() >> 0
        }

        when:"The index action is executed"
        controller.index()

        then:"The model is correct"
        !model.readerCardList
        model.readerCardCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
        controller.create()

        then:"The model is correctly created"
        model.readerCard!= null
    }

    void "Test the save action with a null instance"() {
        when:"Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        controller.save(null)

        then:"A 404 error is returned"
        response.redirectedUrl == '/readerCard/index'
        flash.message != null
    }

    void "Test the save action correctly persists"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * save(_ as ReaderCard)
        }

        when:"The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        populateValidParams(params)
        def readerCard = new ReaderCard(params)
        readerCard.id = 1

        controller.save(readerCard)

        then:"A redirect is issued to the show action"
        response.redirectedUrl == '/readerCard/show/1'
        controller.flash.message != null
    }

    void "Test the save action with an invalid instance"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * save(_ as ReaderCard) >> { ReaderCard readerCard ->
                throw new ValidationException("Invalid instance", readerCard.errors)
            }
        }

        when:"The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def readerCard = new ReaderCard()
        controller.save(readerCard)

        then:"The create view is rendered again with the correct model"
        model.readerCard != null
        view == 'create'
    }

    void "Test the show action with a null id"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * get(null) >> null
        }

        when:"The show action is executed with a null domain"
        controller.show(null)

        then:"A 404 error is returned"
        response.status == 404
    }

    void "Test the show action with a valid id"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * get(2) >> new ReaderCard()
        }

        when:"A domain instance is passed to the show action"
        controller.show(2)

        then:"A model is populated containing the domain instance"
        model.readerCard instanceof ReaderCard
    }

    void "Test the edit action with a null id"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * get(null) >> null
        }

        when:"The show action is executed with a null domain"
        controller.edit(null)

        then:"A 404 error is returned"
        response.status == 404
    }

    void "Test the edit action with a valid id"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * get(2) >> new ReaderCard()
        }

        when:"A domain instance is passed to the show action"
        controller.edit(2)

        then:"A model is populated containing the domain instance"
        model.readerCard instanceof ReaderCard
    }


    void "Test the update action with a null instance"() {
        when:"Save is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then:"A 404 error is returned"
        response.redirectedUrl == '/readerCard/index'
        flash.message != null
    }

    void "Test the update action correctly persists"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * save(_ as ReaderCard)
        }

        when:"The save action is executed with a valid instance"
        response.reset()
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        populateValidParams(params)
        def readerCard = new ReaderCard(params)
        readerCard.id = 1

        controller.update(readerCard)

        then:"A redirect is issued to the show action"
        response.redirectedUrl == '/readerCard/show/1'
        controller.flash.message != null
    }

    void "Test the update action with an invalid instance"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * save(_ as ReaderCard) >> { ReaderCard readerCard ->
                throw new ValidationException("Invalid instance", readerCard.errors)
            }
        }

        when:"The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(new ReaderCard())

        then:"The edit view is rendered again with the correct model"
        model.readerCard != null
        view == 'edit'
    }

    void "Test the delete action with a null instance"() {
        when:"The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then:"A 404 is returned"
        response.redirectedUrl == '/readerCard/index'
        flash.message != null
    }

    void "Test the delete action with an instance"() {
        given:
        controller.readerCardService = Mock(ReaderCardService) {
            1 * delete(2)
        }

        when:"The domain instance is passed to the delete action"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(2)

        then:"The user is redirected to index"
        response.redirectedUrl == '/readerCard/index'
        flash.message != null
    }
}






