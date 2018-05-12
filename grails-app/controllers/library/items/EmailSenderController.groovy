package library.items

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class EmailSenderController {

//    EmailSenderService emailSenderService

    def index() {}

    def send() {
        sendMail {
            to params.email
            subject "Remind to return book"
            html "<p>Hello " + params.name + ",</p> <p>we remind you that you have to return the book <span style='color:#ff0000; font-weight: bold'>'" + params.book + "'</span> to date <span style='color:#ff0000; font-weight: bold'>" + params.returnBeforeDate + "</span>.</p> <p>Best regards,</p> <p> Library</p>"
        }
        respond([message: "Message sent at " + new Date()], formats: ['json'])
    }

    def sendResetPasswordEmail(User user, Token token) {
        sendMail {
            async true
            to user?.email
            subject "Password reset on Mobile Career Index"
            html "Test" + token
//            html  groovyPageRenderer.render(template: '/mail/resetPassword', model: [user: user,token:token])
        }
    }
}
