package library.items

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@GrailsCompileStatic
@ToString
@EqualsAndHashCode
class Author {

    static hasMany = [books:Book]
    String authorName

    static constraints = {
        authorName nullable: false, blank: false
    }
}
