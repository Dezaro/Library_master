package library.items

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@GrailsCompileStatic
@ToString
@EqualsAndHashCode
class ReaderCard {

    Long id
    Long cardNumber
    String readerNames
    String personNumber
    String address
    String phone
    Date registerDate
    String email
    boolean isActive = Boolean.TRUE

    static constraints = {
        cardNumber nullable: false, unique: true
        readerNames nullable: false
        personNumber nullable: true, minSize: 10, maxSize: 10
        phone nullable: false
        registerDate nullable: false, defaultValue: "now()"
        email email: true
        address nullable: true
    }

    @Override
    String toString() {
        return readerNames
    }

    static mapping = {
        version false
    }
}
