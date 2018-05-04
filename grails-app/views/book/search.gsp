<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="book.list.label"/></title>
</head>

<body>
<div class="container">
    <div id="list-book" class="content scaffold-list" role="main">

        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>

        <fieldset class="form">
            <g:form action="search" method="GET">
                <div class="fieldcontain">
                    <label for="title"><g:message code="book.search.for.label"/>:</label>
                    <g:textField name="title" value="${params.title}"/>
                    <input class="search" type="submit" value="${g.message(code: 'search.label', default: 'Search...')}" />
                </div>
            </g:form>
        </fieldset>

<g:each var="book" in="${bookList}">
        <g:render template="/book/bookList" collection="${book}" />
</g:each>
        %{--<table class="table table-striped table-hover">--}%
            %{--<thead>--}%
            %{--<tr>--}%
                %{--<th>Title</th>--}%
                %{--<th>Published date</th>--}%
                %{--<th>ISBN</th>--}%
                %{--<th>Description</th>--}%
                %{--<th>Publisher</th>--}%
                %{--<th>Page number</th>--}%
                %{--<th>Status</th>--}%
                %{--<th>Action</th>--}%
            %{--</tr>--}%
            %{--</thead>--}%
            %{--<tbody>--}%
            %{--<g:each var="book" in="${bookList}">--}%
                %{--<tr>--}%
                    %{--<td><g:link action="show" id="${book.id}"><g:img dir="images" file="icon3.png" class="avatar"--}%
                                                                     %{--alt="Avatar"/> ${book.title}</g:link></td>--}%
                    %{--<td>${book.publishedDate}</td>--}%
                    %{--<td>${book.isbn}</td>--}%
                    %{--<td>${book.description}</td>--}%
                    %{--<td>${book.publisher}</td>--}%
                    %{--<td>${book.pageNumber}</td>--}%
                    %{--<td><span class="status text-success">&bull;</span> Active</td>--}%
                    %{--<td>--}%
                        %{--<g:link action="edit" id="${book.id}" class="settings" title="Settings" data-toggle="tooltip"><i--}%
                                %{--class="material-icons">&#xE8B8;</i></g:link>--}%
                        %{--<a href="#deleteModal" data-toggle="modal" class=" delete" title="Delete"--}%
                           %{--data-book-id="${book.id}"><i--}%
                                %{--class="material-icons">&#xE5C9;</i></a>--}%

                        %{--<form id="form_${book.id}" action="/book/delete/${book.id}" method="post">--}%
                            %{--<input type="hidden" name="_method" value="DELETE" id="_method_${book.id}">--}%
                        %{--</form>--}%
                    %{--</td>--}%
                %{--</tr>--}%
            %{--</g:each>--}%
            %{--</tbody>--}%
        %{--</table>--}%

        <div class="pagination">
            <g:paginate total="${bookTotal}" action="search" params="${params}"/>
        </div>
    </div>
</div>

<asset:javascript src="application.js"/>

%{--<script>--}%
    %{--function submitForm() {--}%
        %{--var book_id = document.getElementsByName('book_id')[0].value,--}%
            %{--book_form = document.getElementById('form_' + book_id);--}%
        %{--book_form.submit();--}%
    %{--}--}%
%{--</script>--}%

</body>
</html>