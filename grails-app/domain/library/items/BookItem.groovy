package library.items

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@GrailsCompileStatic
@ToString
@EqualsAndHashCode
class BookItem {

    Long id
    String bookSerialNumber
    float price
    boolean isAvailable = Boolean.TRUE

    static belongsTo = [book: Book]

    static constraints = {
        bookSerialNumber nullable: false, blank: false, unique: true
        price nullable: false
    }

    @Override
    String toString() {
        return book.getTitle() + ' - ' +  bookSerialNumber
//        return title + ', ' + Author.findById(authorId).getAuthorName()
    }

    static mapping = {
        version false
    }
}
