<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'readerCard.label', default: 'ReaderCard')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div id="show-book" role="main" class="text-color-blues">
    <div class="row">
        <div class="text-color-blues col-sm-4" style="float:left;display: inline-block;">
            <h1>Reader Card Overview</h1>
        </div>

        <div class="col-sm-8" style="float: right; display: inline-block;">
            <div class="btn-group">
                %{--<button type="button" class="btn btn-default">Apple</button>--}%
                <a href="/readerCard/show/${readerCard.id}" type="button"
                   class="btn btn-primary ${actionName == 'show' ? 'active' : ''}">All Given</a>
                <a href="/readerCard/showAllNotReturnedBooks/${readerCard.id}"
                   class="btn btn-danger ${actionName == 'showAllNotReturnedBooks' ? 'active' : ''}">Not Returned</a>
                <a data-toggle="modal" href="#giveBookItem" type="button" class="btn btn-warning" name="give_book"
                   style="cursor: pointer;"><i class="fa fa-lg fa-book"></i> Give Book</a>
            </div>
        </div>
    </div>

    <hr/>

    <div class="col-sm-4">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Card Number</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.cardNumber}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Reader Names</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.readerNames}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Person Number</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.personNumber}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Phone</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.phone}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Register Date</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.registerDate}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Email</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.email}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Address</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.address}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;">Is Active</div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.isActive}</div>
            </div>
        </div>
    </div>

    <div class="col-sm-8">
        <table class="table table-condensed table-striped table-hover" id="#given_books_table_id">
            <thead>
            <tr>
                <th>Status</th>
                <th>Book Serial Number</th>
                <th>Title</th>
                <th>Rent Date</th>
                <th>Return Before Date</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <g:set var="nameAsId"
                   value="0"></g:set>
            <g:each var="rentBook" in="${bookList}">
                <tr class='clickable-row'>
                    <td style="padding: 0 !important;"><span
                            class="status ${rentBook.isReturn ? 'text-success' : 'text-danger'}">&bull;</span> ${rentBook.isReturn ? 'returned' : 'not returned'}
                    </td>
                    <td>${rentBook.bookSerialNumber}</td>
                    <td>${rentBook.title}</td>
                    <td>${rentBook.rentDate}</td>
                    <td>${rentBook.returnBeforeDate}</td>
                    <td>
                        <g:if test="${rentBook.isReturn}">
                            <span title="Mark as returned" style="cursor: pointer;" disabled readonly><i
                                    class="material-icons" style="">&#xE065;</i></span>
                            <span title="Send remind email" style="cursor: pointer;" disabled readonly><i
                                    class="material-icons ">&#xE554;</i></span>
                        </g:if>
                        <g:else>
                            <g:set var="nameAsId"
                                   value="${nameAsId.toInteger() + 1}"></g:set>
                            <a href="/rentBook/returnBook/${rentBook.rentBookId}" name="return_${nameAsId}" title="Mark as returned"
                               style="cursor: pointer;"><i
                                    class="material-icons hover-success">&#xE065;</i></a>
                            <a name="name_${nameAsId}" onclick="onSendMail({
                                email: '${readerCard.email}',
                                book: '${rentBook.title}',
                                returnBeforeDate: '${rentBook.returnBeforeDate}',
                                name: '${readerCard.readerNames}'
                                %{--});" title="Send remind email"><i class="fa fa-lg fa-envelope-o text-info"></i></a>--}%
                            });" title="Send remind email" style="cursor: pointer;"><i
                                    class="material-icons ">&#xE554;</i></a>
                        </g:else>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <script>
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
                    $('#modal_body_info').text(response.message);
                }).fail(function () {
                    $('body').preloader('remove');
                    $('#sendMailInfo').modal('show');
                    ajaxInfoModal(false);
                    $('#modal_body_info').text('Something went wrong!');
                })
            }
        </script>

        <div class="modal fade" id="sendMailInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header modal-header-info" id="modal_header_id">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                        <h1><i class="fa fa-lg fa-info-circle"></i> Mail Info</h1>
                    </div>

                    <div class="modal-body" id="modal_body_info">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info center-block" data-dismiss="modal"
                                id="modal_btn_id"><i
                                class="fa fa-lg fa-info-circle"></i> Accept</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="modal fade modal-backdrop1" id="giveBookItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content modal-lg">
            <div class="modal-header modal-header-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                <h1><i class="fa fa-lg fa-book"></i> Give New Book</h1>
            </div>

            <div class="modal-body" style="height: 350px;">
                <div class="col-sm-4">
                    %{--<img class="poster fade1-show lazyloaded" src="${book.pictureUrl == null ? '/assets/no-photo-6.jpg' : book.pictureUrl.toString()}">--}%
                    <img height="300" width="250" id="info_picture_id" src="/assets/no-photo-6.jpg">
                </div>

                <div class="col-sm-8">
                    %{--<g:each var="book" in="${bookList}"></g:each>--}%
                    <div>
                        <label for="give_book_id" class="col-sm-4 control-label">
                            Book Item <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-12">
                            <select class="form-control" name="bookItem" id="give_book_id" required>
                                <option value="default">-- Select book to give --</option>
                                <g:each var="bookItem"
                                        in="${library.items.BookItem.findAllByIsAvailable(true)}">
                                    <g:set var="book"
                                           value="${library.items.Book.findById(bookItem.book.id)}"></g:set>
                                    <option value="${bookItem.id}"
                                            data-book='{"title": "${book.title}",
                                                     "description": "${book.description}",
                                                     "publisher": "${book.publisher}",
                                                     "publishedDate": "${book.publishedDate}",
                                                     "pictureUrl": "${book.pictureUrl}"}'>${book.title} - ${bookItem.bookSerialNumber}</option>
                                </g:each>
                            </select>

                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="text-color-blues col-sm-12"
                                         style="float:left;display: inline-block; margin-top: 20px;">
                                        <h1>Selected Book</h1>
                                    </div>
                                </div>
                                <hr/>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4">Title</div>

                                    <div class="col-sm-8 text-warning1" id="give_title_id"></div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4">Publisher</div>

                                    <div class="col-sm-8 text-warning1" id="give_publisher_id"></div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4">Published Date</div>

                                    <div class="col-sm-8 text-warning1" id="give_published_date_id"></div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4">Description</div>

                                    <div class="col-sm-8 text-warning1" id="give_description_id"
                                         style="max-height: 100px; overflow: auto;"></div>
                                </div>
                            </div>

                            <script>
                                //                                $('#giveBookItem').on('show.bs.modal', function (e) {
                                //                                    $('.modal-backdrop1').appendTo('body');
                                //                                });

                                $('body').on('click', '#give_btn_id', function () {
                                    var optionSelected = $('#give_book_id').find('option:selected'),
                                        valueSelected = optionSelected.val(),
                                        book = optionSelected.data('book');
                                    console.log(valueSelected, book);
//                                    $("#give_title_id").text(book['title']);
                                });

                                $('#give_book_id').on('change', function (e) {
                                    var optionSelected = $('option:selected', this),
                                        valueSelected = this.value,
                                        book = optionSelected.data('book');
                                    if (valueSelected !== 'default') {
                                        $("#give_btn_id").prop('disabled', false);
                                        $("#book_item_id").val(valueSelected);
                                        $("#info_picture_id").attr('src', book['pictureUrl'] !== '' ? book['pictureUrl'] : '/assets/no-photo-6.jpg');
                                        $("#give_title_id").text(book['title']);
                                        $("#give_publisher_id").text(book['publisher']);
                                        $("#give_published_date_id").text(book['publishedDate']);
                                        $("#give_description_id").text(book['description']);
                                    } else {
                                        $("#give_btn_id").prop('disabled', true);
                                        $("#book_item_id").val('');
                                        $("#info_picture_id").attr('src', '/assets/no-photo-6.jpg');
                                        $("#give_title_id").text('');
                                        $("#give_publisher_id").text('');
                                        $("#give_published_date_id").text('');
                                        $("#give_description_id").text('');
                                    }
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <form action="/rentBook/giveBook" method="post">
                    <input type="hidden" name="readerCardId" id="reader_card_id" value="${readerCard.id}">
                    <input type="hidden" name="bookItemId" id="book_item_id">

                    %{--<div class="form-group">--}%
                    <button type="submit" id="give_btn_id" class="btn btn-warning " disabled><i
                            class="fa fa-lg fa-book"></i> Give</button>
                    <button type="button" class="btn btn-default " data-dismiss="modal"><i
                            class="fa fa-lg fa-close"></i> Cancel</button>
                    %{--</div>--}%
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
