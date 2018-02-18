package library.items

import grails.gorm.services.Service

@Service(RentBook)
interface RentBookService {

    RentBook get(Serializable id)

    List<RentBook> list(Map args)

    Long count()

    void delete(Serializable id)

    RentBook save(RentBook rentBook)

}