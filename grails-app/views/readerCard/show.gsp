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
                <a data-toggle="modal" href="#giveBookItem" type="button" class="btn btn-warning"
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
                            <a href="/rentBook/returnBook/${rentBook.rentBookId}" title="Mark as returned"
                               style="cursor: pointer;"><i
                                    class="material-icons hover-success">&#xE065;</i></a>
                            <a onclick="onSendMail({
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
                    $('.modal-body').text(response.message);
                }).fail(function () {
                    $('body').preloader('remove');
                    $('#sendMailInfo').modal('show');
                    ajaxInfoModal(false);
                    $('.modal-body').text('Something went wrong!');
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

                    <div class="modal-body">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info center-block" data-dismiss="modal"
                                id="modal_btn_id"><i
                                class="fa fa-lg fa-info-circle"></i> Accept</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="giveBookItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered ">
                <div class="modal-content modal-lg">
                    <div class="modal-header modal-header-warning">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                        <h1><i class="fa fa-lg fa-book"></i> Give New Book</h1>
                    </div>

                    <div class="modal-body" style="height: 300px;">
                        <div class="col-sm-4">
                            %{--<img class="poster fade1-show lazyloaded" src="${book.pictureUrl == null ? '/assets/no-photo-6.jpg' : book.pictureUrl.toString()}">--}%
                            <img height="250" width="200" id="info_picture_id" src="">
                        </div>

                        <div class="col-sm-8">
                            %{--<g:each var="book" in="${bookList}"></g:each>--}%
                            <div class="form-group">
                                <label for="give_book_id" class="col-sm-4 control-label">
                                    Book Item <span class="red-star">*</span>
                                </label>

                                <div class="col-sm-10">
                                    <select class="form-control" name="bookItem" id="give_book_id" required>
                                        <g:each var="bookItem"
                                                in="${library.items.BookItem.findAllByIsAvailable(true)}">
                                            <g:set var="book"
                                                   value="${library.items.Book.findById(bookItem.book.id)}"></g:set>
                                            <option value="${bookItem.id}"
                                                    data-book='{"pictureUrl": "${book.pictureUrl}", "description": "${book.description}"}'
                                                    data-description="${book.description}"
                                                    data-publisher="${book.publisher}"
                                                    data-publishedDate="${book.publishedDate}"
                                                    data-pictureUrl="${book.pictureUrl}">${book.title}</option>
                                        </g:each>
                                        <script>
                                            $('#give_book_id').on('change', function (e) {
                                                var optionSelected = $('option:selected', this),
                                                    valueSelected = this.value,
//                                                    book = JSON.parse(optionSelected.data('book')),
                                                    text = optionSelected.text();
//                                                $("#info_picture_id").attr('src', optionSelected.data('pictureUrl'));
//                                                console.log(book);
                                                console.log(optionSelected.data('book').pictureUrl);
                                            });
                                        </script>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning center-block" data-dismiss="modal"><i
                                class="fa fa-lg fa-book"></i> Give</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>

</body>
</html>
