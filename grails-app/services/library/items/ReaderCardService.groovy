package library.items

import grails.gorm.services.Service

@Service(ReaderCard)
interface ReaderCardService {

    ReaderCard get(Serializable id)

    List<ReaderCard> list(Map args)

    Long count()

    void delete(Serializable id)

    ReaderCard save(ReaderCard readerCard)

}