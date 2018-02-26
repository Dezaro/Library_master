package library.items

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@GrailsCompileStatic
@ToString
@EqualsAndHashCode
class RentBook {

    Long id
    Date rentDate
    Date returnBeforeDate
    Date returnDate
    boolean isReturn = Boolean.FALSE

    static belongsTo = [readerCard: ReaderCard, bookItem: BookItem]

    static constraints = {
        rentDate nullable: false, defaultValue: "now()"
        returnBeforeDate nullable: false, defaultValue: "now()"
        returnDate nullable: true
    }

    static mapping = {
        version false
    }
}
