package library.items

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@GrailsCompileStatic
@ToString
@EqualsAndHashCode
class Category {

    Long id
    String categoryName

    static constraints = {
        categoryName nullable: false, blank: false
    }

    @Override
    String toString() {
        return categoryName
    }

    static mapping = {
        version false
    }
}
