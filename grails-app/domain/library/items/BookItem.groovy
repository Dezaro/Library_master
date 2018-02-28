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
    boolean isAvailable = Boolean.TRUE

    static belongsTo = [book: Book]

    static constraints = {
        bookSerialNumber nullable: false, blank: false, unique: true
    }

    @Override
    String toString() {
        return bookSerialNumber
    }

    static mapping = {
        version false
    }
}
