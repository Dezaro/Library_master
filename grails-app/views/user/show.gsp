<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="user.show.label"/></title>
    </head>
    <body>
        <a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="navbar.home"/></a></li>
                <li><g:link class="list" action="index"><g:message code="users.list.label" /></g:link></li>
                <li><g:link class="create" action="create"><g:message code="user.new.label" /></g:link></li>
            </ul>
        </div>
        <div id="show-user" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="user" />
            <g:form resource="${this.user}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.user}"><g:message code="edit" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'delete.button', default: 'Delete')}" onclick="return confirm('${message(code: 'sure.question', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
