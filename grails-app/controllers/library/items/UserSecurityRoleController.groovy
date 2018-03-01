package library.items

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

class UserSecurityRoleController {

    UserSecurityRoleService userSecurityRoleService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userSecurityRoleService.list(params), model:[userSecurityRoleCount: userSecurityRoleService.count()]
    }

    def show(Long id) {
        respond userSecurityRoleService.get(id)
    }

    def create() {
        respond new UserSecurityRole(params)
    }

    def save(UserSecurityRole userSecurityRole) {
        if (userSecurityRole == null) {
            notFound()
            return
        }

        try {
            userSecurityRoleService.save(userSecurityRole)
        } catch (ValidationException e) {
            respond userSecurityRole.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userSecurityRole.label', default: 'UserSecurityRole'), userSecurityRole.id])
                redirect userSecurityRole
            }
            '*' { respond userSecurityRole, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userSecurityRoleService.get(id)
    }

    def update(UserSecurityRole userSecurityRole) {
        if (userSecurityRole == null) {
            notFound()
            return
        }

        try {
            userSecurityRoleService.save(userSecurityRole)
        } catch (ValidationException e) {
            respond userSecurityRole.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'userSecurityRole.label', default: 'UserSecurityRole'), userSecurityRole.id])
                redirect userSecurityRole
            }
            '*'{ respond userSecurityRole, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        userSecurityRoleService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'userSecurityRole.label', default: 'UserSecurityRole'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userSecurityRole.label', default: 'UserSecurityRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
