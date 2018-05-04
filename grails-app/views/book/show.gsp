<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="book.overview.label"/></title>
</head>

<body>
%{--<a href="#show-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
<div id="show-book" role="main" class="text-color-blues">
    <div class="text-color-blues">
        <h1><g:message code="book.overview.label"/></h1>
        <hr/>
    </div>

    <div class="col-sm-4">
        <img class="poster fade1-show lazyloaded"
             src="${book.pictureUrl == null ? '/assets/no-photo-6.jpg' : book.pictureUrl.toString()}">
    </div>

    <div class="col-sm-8">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:display bean="book"/>
        <g:form resource="${this.book}" method="DELETE">
        %{--<fieldset class="buttons">--}%
        %{--<g:link class="edit" action="edit" resource="${this.book}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
        %{--<input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
        %{--</fieldset>--}%
        </g:form>
    </div>
</div>
</body>
</html>
