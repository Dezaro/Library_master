<%@ page import="library.items.Book; library.items.BookItem; library.items.ReaderCard" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'rentBook.label', default: 'RentBook')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<div class="container" style="width: 100%;">
    <div class="row">
        <div class="col-sm-8" style="float: right; display: inline-block;">
            <div class="btn-group" style="float: right; display: inline-block;">
                <a href="/rentBook/index" type="button"
                   class="btn btn-primary ${actionName == 'index' ? 'active' : ''}">All Given</a>
                <a href="/rentBook/showAllNotReturned"
                   class="btn btn-danger ${actionName == 'showAllNotReturned' ? 'active' : ''}">Not Returned</a>
            </div>
        </div>
    </div>

    <hr/>

    <div class="table-wrapper" style="width: 100%;">

        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2>Rent books <b>Management</b></h2>
                </div>

                <div class="col-sm-7">
                    %{--<g:link class="btn btn-primary" action="create"><i--}%
                            %{--class="material-icons">&#xE147;</i><span><g:message code="default.new.label"--}%
                                                                                %{--args="[entityName]"/></span></g:link>--}%
                </div>
            </div>
        </div>
        <table class="table table-condensed table-striped table-hover">
            <thead>
            <tr>
                <th>Reader card</th>
                <th>Book</th>
                <th>Book serial number</th>
                <th>Given on date</th>
                <th>Return before date</th>
                <th>Return date</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="rentBook" in="${rentBookList}">
                <tr>
                    <td><g:link controller="readerCard" action="show" id="${rentBook.readerCard.id}"><img
                            src="/assets/card_reader.png"
                            height="45" width="45" class="avatar"
                            alt="avatar"/> ${library.items.ReaderCard.findById(rentBook.readerCard.id).cardNumber} - ${library.items.ReaderCard.findById(rentBook.readerCard.id).readerNames}</g:link>
                    </td>
                    <td>${library.items.Book.findById(BookItem.findById(rentBook.bookItem.id).book.id).title}</td>
                    <td>${library.items.BookItem.findById(rentBook.bookItem.id).bookSerialNumber}</td>
                    <td><g:formatDate date="${rentBook.rentDate}" type="date" style="MEDIUM"/></td>
                    <td><g:formatDate date="${rentBook.returnBeforeDate}" type="date" style="MEDIUM"/></td>
                    <td><g:formatDate date="${rentBook.returnDate}" type="date" style="MEDIUM"/></td>
                    <td style="padding: 0 !important;"><span
                            class="status ${rentBook.isReturn ? 'text-success' : 'text-danger'}">&bull;</span> ${rentBook.isReturn ? 'Returned' : 'Not Returned'}
                    </td>
                    <td>

                        <g:link action="edit" id="${rentBook.id}" class="settings" title="Settings"
                                data-toggle="tooltip"><i
                                class="material-icons">&#xE8B8;</i></g:link>

                        <a href="#deleteModal" data-toggle="modal" class=" delete" title="Delete"
                           data-rentBook-id="${rentBook.id}"><i
                                class="material-icons">&#xE5C9;</i></a>

                        <form id="form_${rentBook.id}" action="/rentBook/delete/${rentBook.id}" method="post">
                            <input type="hidden" name="_method" value="DELETE" id="_method_${rentBook.id}">
                        </form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${rentBookCount ?: 0}"/>
        </div>
    </div>
</div>
<g:javascript library='jquery'>
    (function ($) {
        $(document).ready(function () {
            $('#deleteModal').on('show.bs.modal', function (e) {
                var rentBook_id = $(e.relatedTarget).data('rentBook-id');
                $(e.currentTarget).find('input[name="rentBook_id"]').val(rentBook_id);
            });
        });

    })(jQuery);
</g:javascript>
<script>
    function submitForm() {
        var rentBook_id = document.getElementsByName('rentBook_id')[0].value,
            rentBook_form = document.getElementById('form_' + rentBook_id);
        rentBook_form.submit();
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
                <g:hiddenField name="rentBook_id" value=""/>
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