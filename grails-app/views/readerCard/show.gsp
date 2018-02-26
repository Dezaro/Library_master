<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'readerCard.label', default: 'ReaderCard')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

%{--<a href="#show-readerCard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--<div id="show-readerCard" class="content scaffold-show" role="main">--}%
%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
%{--<g:if test="${flash.message}">--}%
%{--<div class="message" role="status">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<f:display bean="readerCard" />--}%
%{--<g:form resource="${this.readerCard}" method="DELETE">--}%
%{--<fieldset class="buttons">--}%
%{--<g:link class="edit" action="edit" resource="${this.readerCard}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
%{--<input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
%{--</fieldset>--}%
%{--</g:form>--}%
%{--</div>--}%

<div id="show-book" role="main" class="text-color-blues">
    <div class="row">
        <div class="text-color-blues col-sm-4" style="float:left;display: inline-block;">
            <h1>Book Overview</h1>
        </div>

        <div class="col-sm-8" style="float: right; display: inline-block;">
            <div class="btn-group">
                <button type="button" class="btn btn-default">Apple</button>
                <button type="button" class="btn btn-success">Samsung</button>
                <button type="button" class="btn btn-primary">Samsung</button>
                <button type="button" class="btn btn-danger">Sony</button>
            </div>
        </div>
    </div>

    <hr/>

    <div class="col-sm-4">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <f:display bean="readerCard"/>
    </div>

    <div class="col-sm-8">
        <table class="table">
            <thead>
            <tr>
                <th>Book Serial Number</th>
                <th>Title</th>
                <th>Rent Date</th>
                <th>Return Before Date</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <g:each var="rentBook" in="${bookList}">
                    <td>${rentBook.bookSerialNumber}</td>
                    <td>${rentBook.title}</td>
                    <td>${rentBook.rentDate}</td>
                    <td>${rentBook.returnBeforeDate}</td>
                </g:each>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
