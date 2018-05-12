package library

import library.items.*

class BootStrap {

    def init = { servletContext ->

        def authorities = ['ROLE_BOSS', 'ROLE_EMPLOYEE', 'ROLE_ADMIN']
        authorities.each { String authority ->
            if ( !SecurityRole.findByAuthority(authority) ) {
                new SecurityRole(authority: authority).save()
            }
        }

        if ( !User.findByUsername('sherlock') ) {
            def u = new User(username: 'sherlock', password: 'elementary', email: 'test@abv.bg')
            u.save()
            new UserSecurityRole(user: u, securityRole: SecurityRole.findByAuthority('ROLE_BOSS')).save()
        }

        if ( !User.findByUsername('watson') ) {
            def u = new User(username: 'watson', password: '221Bbakerstreet', email: 'test2@abv.bg')
            u.save()
            new UserSecurityRole(user: u, securityRole: SecurityRole.findByAuthority('ROLE_EMPLOYEE')).save()
        }

        if ( !User.findByUsername('lilyana') ) {
            def u = new User(username: 'lilyana', password: 'lilyanapass', email: 'lilyana.ihtimanska@gmail.com')
            u.save()
            new UserSecurityRole(user: u, securityRole: SecurityRole.findByAuthority('ROLE_ADMIN')).save()
        }

        if ( !User.findByUsername('delo') ) {
            def u = new User(username: 'delo', password: 'delo', email: 'delo_bran@abv.bg')
            u.save()
            new UserSecurityRole(user: u, securityRole: SecurityRole.findByAuthority('ROLE_ADMIN')).save()
        }
    }
    def destroy = {
    }
}
