package library.items

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class UserSecurityRoleServiceSpec extends Specification {

    UserSecurityRoleService userSecurityRoleService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new UserSecurityRole(...).save(flush: true, failOnError: true)
        //new UserSecurityRole(...).save(flush: true, failOnError: true)
        //UserSecurityRole userSecurityRole = new UserSecurityRole(...).save(flush: true, failOnError: true)
        //new UserSecurityRole(...).save(flush: true, failOnError: true)
        //new UserSecurityRole(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //userSecurityRole.id
    }

    void "test get"() {
        setupData()

        expect:
        userSecurityRoleService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<UserSecurityRole> userSecurityRoleList = userSecurityRoleService.list(max: 2, offset: 2)

        then:
        userSecurityRoleList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        userSecurityRoleService.count() == 5
    }

    void "test delete"() {
        Long userSecurityRoleId = setupData()

        expect:
        userSecurityRoleService.count() == 5

        when:
        userSecurityRoleService.delete(userSecurityRoleId)
        sessionFactory.currentSession.flush()

        then:
        userSecurityRoleService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        UserSecurityRole userSecurityRole = new UserSecurityRole()
        userSecurityRoleService.save(userSecurityRole)

        then:
        userSecurityRole.id != null
    }
}
