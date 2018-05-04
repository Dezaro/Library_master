<%@ page import="library.items.Book" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'bookItem.label', default: 'BookItem')}"/>
<title><g:message code="book.list.label"/></title>
</head>
<div class="container" style="width: 100%;">
    <div class="table-wrapper" style="width: 100%;">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2><b><g:message code="bookItem.management.label"/></b></h2>
                </div>

                <div class="col-sm-7">
                    <a data-toggle="modal" href="#createBookItem" type="button" name="new_book_item" class="btn btn-warning"
                       style="cursor: pointer;"><i class="material-icons">&#xE147;</i> <g:message code="bookItem.new.label"/></a>
                    %{--<g:link class="btn btn-primary" id="create_book_item_id" action="create"><i--}%
                    %{--class="material-icons">&#xE147;</i><span><g:message code="default.new.label"--}%
                    %{--args="[entityName]"/></span></a></g:link>--}%
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><g:message code="book.label"/></th>
                <th><g:message code="author.label"/></th>
                <th><g:message code="book.category.label"/></th>
                <th><g:message code="bookItem.serial.number.label"/></th>
                <th><g:message code="status.label"/></th>
                <th><g:message code="action.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each var="bookItem" in="${bookItemList}">
                <tr>
                    <td><g:link controller="book" action="show" id="${bookItem.book.id}"><img
                            src="${library.items.Book.findById(bookItem.book.id).pictureUrl == null ? '/assets/no-photo-6.jpg' : library.items.Book.findById(bookItem.book.id).pictureUrl.toString()}"
                            height="45" width="45" class="avatar"
                            alt="Avatar"/>${library.items.Book.findById(bookItem.book.id).title}</g:link></td>
                    <td>${Book.findById(bookItem.book.id).author}</td>
                    <td>${Book.findById(bookItem.book.id).category}</td>
                    <td>${bookItem.bookSerialNumber}</td>
                    <td style="padding: 0 !important;"><span
                            class="status ${bookItem.isAvailable ? 'text-success' : 'text-danger'}">&bull;</span> ${bookItem.isAvailable ? 'Available' : 'Not Available'}
                    </td>
                    <td>
                        <g:link action="edit" id="${bookItem.id}" class="settings" title="${g.message(code: 'edit', default: 'Edit...')}"
                                data-toggle="tooltip"><i
                                class="material-icons">&#xE8B8;</i></g:link>
                        <a href="#deleteModal" data-toggle="modal" class=" delete" title="${g.message(code: 'delete.button', default: 'Delete...')}"
                           data-bookitem-id="${bookItem.id}"><i
                                class="material-icons">&#xE5C9;</i></a>

                        <form id="form_${bookItem.id}" action="/bookItem/delete/${bookItem.id}" method="post">
                            <input type="hidden" name="_method" value="DELETE" id="_method_${bookItem.id}">
                        </form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${bookItemCount ?: 0}"/>
        </div>
    </div>
</div>

<g:javascript library='jquery'>
    (function ($) {
        $(document).ready(function () {
            $('#deleteModal').on('show.bs.modal', function (e) {
                var bookItem_id = $(e.relatedTarget).data('bookitem-id');
                $(e.currentTarget).find('input[name="bookItem_id"]').val(bookItem_id);
            });
        });

    })(jQuery);
</g:javascript>
<script>
    function submitForm() {
        var bookItem_id = document.getElementsByName('bookItem_id')[0].value,
            bookItem_form = document.getElementById('form_' + bookItem_id);
        bookItem_form.submit();
    }
</script>

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
                <g:hiddenField name="bookItem_id" value=""/>
            </g:form>
            <div class="modal-footer">
                <button id="#deleteBtn" type="button" onclick="submitForm()" class="btn btn-danger"><g:message code="delete.button"/></button>
                <button type="button" class="btn btn-info" data-dismiss="modal"><g:message code="cancel.button"/></button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade modal-backdrop1" id="createBookItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content modal-lg">
            <div class="modal-header modal-header-success">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                <h1><i class="fa fa-lg fa-book"></i> <g:message code="bookItem.create.label"/></h1>
            </div>

            <div class="modal-body" style="height: 350px;">
                <div class="col-sm-4">
                    <img height="300" width="250" id="info_picture_id" src="/assets/no-photo-6.jpg">
                </div>

                <div class="col-sm-8">
                    <div>
                        <label for="book_id" class="col-sm-4 control-label">
                            <g:message code="book.label"/> <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-12">

                            <select class="form-control" name="book" id="book_id" required>
                                <option value="default">-- <g:message code="bookItem.select.book.label"/> --</option>
                                <g:each var="book"
                                        in="${library.items.Book.getAll()}">
                                    <option value="${book.id}"
                                            data-book='{"title": "${book.title}",
                                                     "description": "${book.description}",
                                                     "publisher": "${book.publisher}",
                                                     "publishedDate": "${book.publishedDate}",
                                                     "pictureUrl": "${book.pictureUrl}"}'>${book.title} - ISBN: ${book.isbn}</option>
                                </g:each>
                            </select>
                        </div>

                        <label for="serial_number_id" class="col-sm-4 control-label">
                            <g:message code="bookItem.serial.number.label"/> <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-12">
                            <input type="text" class="form-control" name="serialNumber" id="serial_number_id" required/>

                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="text-color-blues col-sm-12"
                                         style="float:left;display: inline-block; margin-top: 20px;">
                                        <h1><g:message code="selected.book.label"/></h1>
                                    </div>
                                </div>
                                <hr/>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4"><g:message code="book.title.label"/></div>

                                    <div class="col-sm-8 text-warning1" id="give_title_id"></div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4"><g:message code="book.publisher.label"/></div>

                                    <div class="col-sm-8 text-warning1" id="give_publisher_id"></div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4"><g:message code="book.published.date.label"/></div>

                                    <div class="col-sm-8 text-warning1" id="give_published_date_id"></div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4"><g:message code="book.description.label"/></div>

                                    <div class="col-sm-8 text-warning1" id="give_description_id"
                                         style="max-height: 100px; overflow: auto;"></div>
                                </div>
                            </div>

                            <script>
                                $('body').on('click', '#create_btn_id', function () {
                                    var optionSelected = $('#book_id').find('option:selected'),
                                        serialNumber = $('#serial_number_id').val(),
                                        valueSelected = optionSelected.val(),
                                        book = optionSelected.data('book');
                                    console.log(serialNumber,valueSelected, book);
//                                    $("#give_title_id").text(book['title']);
                                });

                                $('#book_id').on('change', function (e) {
                                    var optionSelected = $('option:selected', this),
                                        serialNumber = $('#serial_number_id').val(),
                                        valueSelected = this.value,
                                        book = optionSelected.data('book');
                                    if (valueSelected !== 'default') {
                                        if(serialNumber !== '') {
                                            $("#create_btn_id").prop('disabled', false);
                                        }
                                        $("#book").val(valueSelected);
                                        $("#bookSerialNumber").val(serialNumber);
                                        $("#info_picture_id").attr('src', book['pictureUrl'] !== '' ? book['pictureUrl'] : '/assets/no-photo-6.jpg');
                                        $("#give_title_id").text(book['title']);
                                        $("#give_publisher_id").text(book['publisher']);
                                        $("#give_published_date_id").text(book['publishedDate']);
                                        $("#give_description_id").text(book['description']);
                                    } else {
                                        $("#create_btn_id").prop('disabled', true);
                                        $("#book").val(valueSelected);
                                        $("#bookSerialNumber").val(serialNumber);
                                        $("#info_picture_id").attr('src', '/assets/no-photo-6.jpg');
                                        $("#give_title_id").text('');
                                        $("#give_publisher_id").text('');
                                        $("#give_published_date_id").text('');
                                        $("#give_description_id").text('');
                                    }
                                });
                                $('#serial_number_id').on('keyup', function (e) {
                                    var selectedBook = $('#book_id').find('option:selected'),
                                        serialNumber = $('#serial_number_id').val();
                                    if (serialNumber !== '') {
                                        if(selectedBook.val() !== 'default') {
                                            $("#create_btn_id").prop('disabled', false);
                                        }
                                        $("#bookSerialNumber").val(serialNumber);
                                    } else {
                                        $("#create_btn_id").prop('disabled', true);
                                        $("#bookSerialNumber").val(serialNumber);
                                    }
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <form action="save" method="post">
                    <input type="hidden" name="book" id="book">
                    <input type="hidden" name="bookSerialNumber" id="bookSerialNumber">
                    <button type="submit" id="create_btn_id" class="btn btn-success" disabled><i
                            class="fa fa-lg fa-plus-circle"></i> <g:message code="create.button"/></button>
                    <button type="button" class="btn btn-default " data-dismiss="modal"><i
                            class="fa fa-lg fa-close"></i> <g:message code="cancel.button"/></button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>