package library.items

import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

@Secured(['ROLE_ADMIN'])
class UserController {

    UserService userService
    EmailSenderController emailSender


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model: [userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
            UserSecurityRole.create(user, SecurityRole.findById(params.userRole.toLong()), true)
        } catch (ValidationException e) {
            respond user.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
            UserSecurityRole.create(user, SecurityRole.findById(params.userRole.toLong()), true)
        } catch (ValidationException e) {
            respond user.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action: "index", method: "GET"
            }
            '*' { respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        def user
        if (id == null) {
            notFound()
            return
        }
        user = User.findById(id)
        UserSecurityRole.removeAll(user)
        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def resetPassword(String token) {
        def email = Token.findByValue(token)
        if (!email) {
            response.sendError(404)
        }
        email = Token.findByValue(token).email
        def user = User.findByEmail(email)
//        respond([message: email], formats: ['json'])
        respond(user: user, token: token, view: 'resetPassword')
    }

    def updatePassword(){

        respond([message: email], formats: ['json'])
//        redirect(controller: "home")
        redirect(uri: "/")
    }

}
