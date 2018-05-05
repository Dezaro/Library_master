<%@ page import="library.items.Book; library.items.BookItem; library.items.ReaderCard" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'rentBook.label', default: 'RentBook')}"/>
    <title><g:message code="rentBook.list.label"/></title>
</head>

<body>
<div class="container" style="width: 100%;">
    <div class="row">
        <div class="col-sm-8" style="float: right; display: inline-block;">
            <div class="btn-group" style="float: right; display: inline-block;">
                <a href="/rentBook/index" type="button"
                   class="btn btn-primary ${actionName == 'index' ? 'active' : ''}"><g:message code="readerCard.allGiven.label"/></a>
                <a href="/rentBook/showAllNotReturned"
                   class="btn btn-danger ${actionName == 'showAllNotReturned' ? 'active' : ''}"><g:message code="readerCard.notReturned.label"/></a>
            </div>
        </div>
    </div>

    <hr/>

    <div class="table-wrapper" style="width: 100%;">

        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2><b><g:message code="rentBook.management.label"/></b></h2>
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
                <th><g:message code="readerCard.label"/></th>
                <th><g:message code="book.label"/></th>
                <th><g:message code="bookItem.serial.number.label"/></th>
                <th><g:message code="book.rent.date.label"/></th>
                <th><g:message code="book.return.before.date.label"/></th>
                <th><g:message code="book.returnDate.label"/></th>
                <th><g:message code="status.label"/></th>
                <th><g:message code="action.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each var="rentBook" in="${rentBookList}">
                <tr>
                    <td><g:link controller="readerCard" action="show" id="${rentBook.readerCard.id}"><img
                            src="${library.items.Book.findById(BookItem.findById(rentBook.bookItem.id).book.id).pictureUrl == null ? '/assets/no-photo-6.jpg' : library.items.Book.findById(BookItem.findById(rentBook.bookItem.id).book.id).pictureUrl}"
                            height="45" width="45" class="avatar"
                            alt="avatar"/> ${library.items.ReaderCard.findById(rentBook.readerCard.id).cardNumber} - ${library.items.ReaderCard.findById(rentBook.readerCard.id).readerNames}</g:link>
                    </td>
                    <td>${library.items.Book.findById(BookItem.findById(rentBook.bookItem.id).book.id).title}</td>
                    <td>${library.items.BookItem.findById(rentBook.bookItem.id).bookSerialNumber}</td>
                    <td>
                        <g:formatDate value="${rentBook.rentDate}" type="date" style="MEDIUM"/>
                    </td>
                    <td><g:formatDate date="${rentBook.returnBeforeDate}" type="date" style="MEDIUM"/></td>
                    <td><g:formatDate date="${rentBook.returnDate}" type="date" style="MEDIUM"/></td>
                    <td style="padding: 0 !important;"><span
                            class="status ${rentBook.isReturn ? 'text-success' : 'text-danger'}">&bull;</span> ${rentBook.isReturn ? 'Returned' : 'Not Returned'}
                    </td>
                    <td>
                        <g:if test="${rentBook.isReturn}">
                            <span title="${g.message(code: 'book.mask.as.returned.label', default: 'Mask as returned')}" style="cursor: pointer;" disabled readonly><i
                                    class="material-icons" style="">&#xE065;</i></span>
                            <span title="${g.message(code: 'book.send.mail.label', default: 'Send remind email')}" style="cursor: pointer;" disabled readonly><i
                                    class="material-icons ">&#xE554;</i></span>
                        </g:if>
                        <g:else>
                            <a href="/rentBook/returnBook/${rentBook.id}?view=rent" title="${g.message(code: 'book.mask.as.returned.label', default: 'Mask as returned')}"
                               style="cursor: pointer;"><i
                                    class="material-icons hover-success">&#xE065;</i></a>
                            <a onclick="onSendMail({
                                email: '${library.items.ReaderCard.findById(rentBook.readerCard.id).email}',
                                book: '${library.items.Book.findById(BookItem.findById(rentBook.bookItem.id).book.id).title}',
                                returnBeforeDate: '${rentBook.returnBeforeDate}',
                                name: '${library.items.ReaderCard.findById(rentBook.readerCard.id).readerNames}'
                            });" title="${g.message(code: 'book.send.mail.label', default: 'Send remind email')}" style="cursor: pointer;"><i
                                    class="material-icons ">&#xE554;</i></a>
                        </g:else>
                        <g:link action="edit" id="${rentBook.id}" class="settings" title="${g.message(code: 'settings', default: 'Settings...')}"
                                data-toggle="tooltip"><i
                                class="material-icons">&#xE8B8;</i></g:link>

                        <a href="#deleteModal" data-toggle="modal" class=" delete" title="${g.message(code: 'delete.button', default: 'Delete...')}"
                           data-rentBook-id="${rentBook.id}"><i
                                class="material-icons">&#xE5C9;</i></a>

                        <form id="form_${rentBook.id}" action="/rentBook/delete/${rentBook.id}" method="POST">
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

<div class="modal fade" id="sendMailInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-info" id="modal_header_id">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                <h1><i class="fa fa-lg fa-info-circle"></i> <g:message code="mail.info.label"/></h1>
            </div>

            <div class="modal-body">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-info center-block" data-dismiss="modal"
                        id="modal_btn_id"><i
                        class="fa fa-lg fa-info-circle"></i> <g:message code="accept.label"/></button>
            </div>
        </div>
    </div>
</div>

<div id="deleteModal" class="modal fade">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header">
                <div class="icon-box">
                    <i class="material-icons">&#xE92B;</i>
                </div>
                <h4 class="modal-title"><g:message code="sure.question"/></h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>

            <div class="modal-body">
                <p><g:message code="delete.question"/></p>
            </div>
            <g:form id="#deleteForm" resource="" method="POST">
                <g:hiddenField name="rentBook_id" value=""/>
            </g:form>
            <div class="modal-footer">
                <button id="#deleteBtn" type="button" onclick="submitForm()" class="btn btn-danger"><g:message code="delete.button"/></button>
                <button type="button" class="btn btn-info" data-dismiss="modal"><g:message code="cancel.button"/></button>
            </div>
        </div>
    </div>
</div>
<script>
    $('#deleteModal').on('show.bs.modal', function (e) {
        var rentBook_id = $(e.relatedTarget).data('rentbook-id');
        $(e.currentTarget).find('input[name="rentBook_id"]').val(rentBook_id);
    });
    function ajaxInfoModal(valid) {
        var header = $("#modal_header_id"),
            btn = $("#modal_btn_id"),
            header_info_cls = 'modal-header-info',
            header_danger_cls = 'modal-header-danger',
            btn_info_cls = 'btn-info',
            btn_danger_cls = 'btn-danger';
        if (valid) {
            header.removeClass(header_danger_cls);
            header.addClass(header_info_cls);
            btn.removeClass(btn_danger_cls);
            btn.addClass(btn_info_cls);
        } else {
            header.removeClass(header_info_cls);
            header.addClass(header_danger_cls);
            btn.removeClass(btn_info_cls);
            btn.addClass(btn_danger_cls);
        }
    }
    function onSendMail(params) {
        $('body').preloader();
        $.ajax({
            method: 'POST',
            url: '/emailSender/send',
            data: params
        }).done(function (response) {
            $('body').preloader('remove');
            $('#sendMailInfo').modal('show');
            ajaxInfoModal(true);
            $('.modal-body').text(response.message);
        }).fail(function () {
            $('body').preloader('remove');
            $('#sendMailInfo').modal('show');
            ajaxInfoModal(false);
            $('.modal-body').text('Something went wrong!');
        })
    }
    function submitForm() {
        var rentBook_id = document.getElementsByName('rentBook_id')[0].value,
            rentBook_form = document.getElementById('form_' + rentBook_id);
        rentBook_form.submit();
    }
</script>
</body>
</html>