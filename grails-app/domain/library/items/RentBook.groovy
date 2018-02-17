package library.items

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@GrailsCompileStatic
@ToString
@EqualsAndHashCode
class RentBook {

    static belongsTo = [readerCards: ReaderCard, books: Book]
    Long id
    Date rentDate
    Date returnBeforeDate
    Date returnDate
    boolean isReturn = Boolean.FALSE

    static constraints = {
        id nullable: false, unique: true
        rentDate nullable: false
        returnBeforeDate nullable: false
    }
}
