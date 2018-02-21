package library.items

import grails.gorm.services.Service

@Service(BookItem)
interface BookItemService {

    BookItem get(Serializable id)

    List<BookItem> list(Map args)

    Long count()

    void delete(Serializable id)

    BookItem save(BookItem bookItem)

}