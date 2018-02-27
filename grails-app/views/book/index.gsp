<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container" style="width: 100%;">
    <div class="table-wrapper" style="width: 100%;">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2>Books <b>Management</b></h2>
                </div>

                <div class="col-sm-7">
                    <g:link class="btn btn-primary" action="create"><i
                            class="material-icons">&#xE147;</i><span><g:message code="default.new.label"
                                                                                args="[entityName]"/></span></a></g:link>
                %{--<a href="${createLink(uri: '/')}" class="btn btn-primary"><i--}%
                %{--class="material-icons">&#xE88A;</i> <span><g:message code="default.home.label"/></span></a>--}%
                </div>
            </div>
        </div>
        %{--<g:render template="bookList" var="book" collection="${bookList}" />--}%
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Title</th>
                <th>Published date</th>
                <th>ISBN</th>
                <th>Author</th>
                <th>Category</th>
                <th>Description</th>
                <th>Publisher</th>
                <th>Page number</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="book" in="${bookList}">
                <tr>
                    <td><g:link action="show" id="${book.id}"><img
                            src="${book.pictureUrl == null ? '/assets/no-photo-6.jpg' : book.pictureUrl.toString()}"
                            height="45" width="45" class="avatar"
                            alt="Avatar"/> ${book.title}</g:link></td>
                    <td><g:formatDate date="${book.publishedDate}" type="date" style="MEDIUM"/></td>
                    <td>${book.isbn}</td>
                    <td>${book.author.authorName}</td>
                    <td>${book.category.categoryName}</td>
                    <td>${book.description}</td>
                    <td>${book.publisher}</td>
                    <td>${book.pageNumber}</td>
                    <td>
                        <g:if test="${book.availability > 0}">
                        <span class="status text-success">&bull;</span> Available
                        </g:if>
                        <g:else>
                            <span class="status text-danger">&bull;</span> Not Available
                        </g:else>
                    </td>
                    <td>
                        <g:link action="edit" id="${book.id}" class="settings" title="Settings" data-toggle="tooltip"><i
                                class="material-icons">&#xE8B8;</i></g:link>
                        <a href="#deleteModal" data-toggle="modal" class=" delete" title="Delete"
                           data-book-id="${book.id}"><i
                                class="material-icons">&#xE5C9;</i></a>

                        <form id="form_${book.id}" action="/book/delete/${book.id}" method="post">
                            <input type="hidden" name="_method" value="DELETE" id="_method_${book.id}">
                        </form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${categoryCount ?: 0}"/>
        </div>
    </div>
</div>

<asset:javascript src="application.js"/>
<g:javascript library='jquery'>
    (function ($) {
        $(document).ready(function () {
            // $('#deleteModal').modal('show');
            $('#deleteModal').on('show.bs.modal', function (e) {
                var book_id = $(e.relatedTarget).data('book-id');
                $(e.currentTarget).find('input[name="book_id"]').val(book_id);
                // $('#deleteBtn').on('click', function (evt) {
                //     evt.stopPropagation();
                //     console.log("click bound to document listening for #test-element");
                // });
            });
        });

    })(jQuery);
</g:javascript>
<script>
    function submitForm() {
        var book_id = document.getElementsByName('book_id')[0].value,
            book_form = document.getElementById('form_' + book_id);
        book_form.submit();
    }
</script>

<div id="deleteModal" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header">
                <div class="icon-box">
                    <i class="material-icons">&#xE92B;</i>
                </div>
                <h4 class="modal-title">Are you sure?</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>

            <div class="modal-body">
                <p>Do you really want to delete these records? This process cannot be undone.</p>
            </div>
            <g:form id="#deleteForm" resource="" method="POST">
                <g:hiddenField name="book_id" value=""/>
            </g:form>
            <div class="modal-footer">
                <button id="#deleteBtn" type="button" onclick="submitForm()" class="btn btn-danger">Delete</button>
                <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>