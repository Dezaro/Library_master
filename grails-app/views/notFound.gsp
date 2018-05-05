<!doctype html>
<html>
    <head>
        <title><g:message code="page.not.found"/></title>
        <meta name="layout" content="main">
        <g:if env="development"><asset:stylesheet src="errors.css"/></g:if>
    </head>
    <body>
        <ul class="errors">
            <li><g:message code="error.page.not.found"/></li>
            <li><g:message code="path.label"/>: ${request.forwardURI}</li>
        </ul>
    </body>
</html>
