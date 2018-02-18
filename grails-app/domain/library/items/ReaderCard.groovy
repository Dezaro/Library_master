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
    Date dateOfBirth
    String address
    String phone
    Date registerDate
    String email
    boolean isActive = Boolean.TRUE

    static constraints = {
        id nullable: false
        cardNumber nullable: false, unique: true
        readerNames nullable: false
        dateOfBirth nullable: false
        phone nullable: false
        registerDate nullable: false
        email email: true
    }

    @Override
    String toString() {
        return readerNames
    }
}
