package library.items

import grails.compiler.GrailsCompileStatic
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString


@GrailsCompileStatic
@ToString
@EqualsAndHashCode
class Book {

    Long id
    String title
    Date publishedDate
    String isbn
    String description
    String publisher
    int pageNumber
    boolean isAvailable = Boolean.TRUE

    static belongsTo = [author: Author, category: Category]

    static constraints = {
        title nullable: false, blank: false
        isbn unique: true, nullable: false
        pageNumber nullable: false, blank: false
    }

    @Override
    String toString() {
        return title
//        return title + ', ' + Author.findById(authorId).getAuthorName()
    }
}
