package library.items

import grails.gorm.services.Service

@Service(UserSecurityRole)
interface UserSecurityRoleService {

    UserSecurityRole get(Serializable id)

    List<UserSecurityRole> list(Map args)

    Long count()

    void delete(Serializable id)

    UserSecurityRole save(UserSecurityRole userSecurityRole)

}