<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}" />
        <title><g:message code="show.author.label" /></title>
    </head>
    <body>

    <div id="show-author" role="main" class="text-color-blues">
        <div class="text-color-blues">
            <h1><g:message code="author.overview.label" /></h1>
            <hr/>
        </div>

        <div class="col-sm-4">
            %{--<img class="poster fade1-show lazyloaded"--}%
                 %{--src="${book.pictureUrl == null ? '/assets/no-photo-6.jpg' : book.pictureUrl.toString()}">--}%
        </div>

        <div class="col-sm-8">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <f:display bean="author"/>
        </div>
    </div>
    </body>
</html>
