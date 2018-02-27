package library.items

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class EmailSenderController {

    def index() {}

    def send() {
        sendMail {
            to params.email
            subject "Remind to return book"
            html "<p>Hello " + params.name + ",</p> <p>we remind you that you have to return the book <span style='color:#ff0000; font-weight: bold'>'" + params.book + "'</span> to date <span style='color:#ff0000; font-weight: bold'>" + params.returnBeforeDate + "</span>.</p> <p>Best regards,</p> <p> Library</p>"
        }
        respond([message: "Message sent at " + new Date()], formats: ['json'])
    }
}
