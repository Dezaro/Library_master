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
    int availability
    String cover

    static belongsTo = [author: Author, category: Category]

    static constraints = {
        title nullable: false, blank: false
        isbn nullable: false, minSize: 13, maxSize: 13, matches: "[0-9]+"
        pageNumber nullable: false, blank: false
        publishedDate nullable:  true, defaultValue: "now()"
        description nullable: true
        publisher nullable: true
        availability nullable: false
        cover inList: ["Mека", "Tвърда"]
    }

    @Override
    String toString() {
        return title
//        return title + ', ' + Author.findById(authorId).getAuthorName()
    }

    static mapping = {
        version false
    }
}
