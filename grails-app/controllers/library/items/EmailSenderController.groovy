package library.items

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class EmailSenderController {

    def send() {
        sendMail {
            to params.email
            subject 'Remind to return book'
            html '<p>Hello ' + params.name + ',</p> <p>we remind you that you have to return the book <span style="color:#ff0000; font-weight: bold">' + params.book + '</span> to date <span style="color:#ff0000; font-weight: bold">' + params.returnBeforeDate + '</span>.</p> <p>Best regards,</p> <p> Library</p>'
        }
        respond([message: 'Message sent at ' + new Date()], formats: ['json'])
    }

    def sendResetPasswordEmail(String userName) {
        def user = User.findByUsername(userName)
        def token = Token.findByEmail(user.email)
        if(!token) {
            token = new Token(email: user.email)
            token.save(flush: true);
        }
        sendMail {
            async true
            to  user?.email
            subject 'Library Forgot Password '
            html 'Hello user '  + user.username + '! Click <a href="http://localhost:8080/user/resetPassword?token=' + token.value + '" target="_blank"> here </a> to reset password.'
        }
        respond([message: 'Message sent at ' + new Date()], formats: ['json'])
    }
}
