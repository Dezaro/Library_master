<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'readerCard.label', default: 'ReaderCard')}"/>
    <title><g:message code="readerCard.overview.label"/></title>
</head>

<body>
<div id="show-book" role="main" class="text-color-blues">
    <div class="row">
        <div class="text-color-blues col-sm-4" style="float:left;display: inline-block;">
            <h1><g:message code="readerCard.overview.label"/></h1>
        </div>

        <div class="col-sm-8" style="float: right; display: inline-block;">
            <div class="btn-group">
                %{--<button type="button" class="btn btn-default">Apple</button>--}%
                <a href="/readerCard/show/${readerCard.id}" type="button"
                   class="btn btn-primary ${actionName == 'show' ? 'active' : ''}"><g:message
                        code="readerCard.allGiven.label"/></a>
                <a href="/readerCard/showAllNotReturnedBooks/${readerCard.id}"
                   class="btn btn-danger ${actionName == 'showAllNotReturnedBooks' ? 'active' : ''}"><g:message
                        code="readerCard.notReturned.label"/></a>
                <a data-toggle="modal" href="#giveBookItem" type="button" class="btn btn-warning" name="give_book"
                   style="cursor: pointer;"><i class="fa fa-lg fa-book"></i> <g:message
                        code="readerCard.give.book.label"/></a>
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
                <div style="margin-top: 15px;"><g:message code="readerCard.number.label"/></div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.cardNumber}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;"><g:message code="readerCard.reader.names.label"/></div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.readerNames}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;"><g:message code="readerCard.person.number.label"/></div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.personNumber}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;"><g:message code="readerCard.phone.label"/></div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.phone}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;"><g:message code="readerCard.register.date.label"/></div>
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
                <div style="margin-top: 15px;"><g:message code="readerCard.address.label"/></div>
            </div>

            <div class="col-sm-6">
                <div style="margin-top: 15px;">${readerCard.address}</div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div style="margin-top: 15px;"><g:message code="readerCard.isActive.label"/></div>
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
                <th><g:message code="status.label"/></th>
                <th><g:message code="bookItem.serial.number.label"/></th>
                <th><g:message code="book.title.label"/></th>
                <th><g:message code="book.rent.date.label"/></th>
                <th><g:message code="book.return.before.date.label"/></th>
                <th><g:message code="action.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:set var="nameAsId"
                   value="0"></g:set>
            <g:each var="rentBook" in="${bookList}">
                <tr class='clickable-row'>
                    <td style="padding: 0 !important;"><span
                            class="status ${rentBook.isReturn ? 'text-success' : 'text-danger'}">&bull;</span> ${rentBook.isReturn ? "${message(code: 'returned.book.label', default: 'returned')}" : "${message(code: 'notReturned.book.label', default: 'not returned')}"}
                    </td>
                    <td>${rentBook.bookSerialNumber}</td>
                    <td>${rentBook.title}</td>
                    <td>${rentBook.rentDate}</td>
                    <td>${rentBook.returnBeforeDate}</td>
                    <td>
                        <g:if test="${rentBook.isReturn}">
                            <span title="${g.message(code: 'book.mask.as.returned.label', default: 'Mask as returned')}"
                                  style="cursor: pointer;" disabled readonly><i
                                    class="material-icons" style="">&#xE065;</i></span>
                            <span title="${g.message(code: 'book.send.mail.label', default: 'Send remind email')}"
                                  style="cursor: pointer;" disabled readonly><i
                                    class="material-icons ">&#xE554;</i></span>
                        </g:if>
                        <g:else>
                            <g:set var="nameAsId"
                                   value="${nameAsId.toInteger() + 1}"></g:set>
                            <a href="/rentBook/returnBook/${rentBook.rentBookId}" name="return_${nameAsId}"
                               title="${g.message(code: 'book.mask.as.returned.label', default: 'Mask as returned')}"
                               style="cursor: pointer;"><i
                                    class="material-icons hover-success">&#xE065;</i></a>
                            <a name="name_${nameAsId}" onclick="onSendMail({
                                email: '${readerCard.email}',
                                book: '${rentBook.title}',
                                returnBeforeDate: '${rentBook.returnBeforeDate}',
                                name: '${readerCard.readerNames}'
                                %{--});" title="Send remind email"><i class="fa fa-lg fa-envelope-o text-info"></i></a>--}%
                            });" title="${g.message(code: 'book.send.mail.label', default: 'Send remind email')}"
                               style="cursor: pointer;"><i
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
                    $('#modal_body_info').text("<g:message code="email.sent.success.msg"/>");
                }).fail(function () {
                    $('body').preloader('remove');
                    $('#sendMailInfo').modal('show');
                    ajaxInfoModal(false);
                    $('#modal_body_info').text("<g:message code="email.sent.fail.label"/>");
                })
            }
        </script>

        <div class="modal fade" id="sendMailInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header modal-header-info" id="modal_header_id">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                        <h1><i class="fa fa-lg fa-info-circle"></i> <g:message code="mail.info.label"/></h1>
                    </div>

                    <div class="modal-body" id="modal_body_info">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info center-block" data-dismiss="modal"
                                id="modal_btn_id"><i
                                class="fa fa-lg fa-info-circle"></i> <g:message code="accept.label"/></button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<div class="modal fade" id="giveBookItem" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content modal-lg">
            <div class="modal-header modal-header-warning">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                <h1><i class="fa fa-lg fa-book"></i> <g:message code="give.new.book.label"/></h1>
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
                            <g:message code="bookItem.label"/> <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-12">
                            <input class="form-control" name="bookItem" id="give_book_id" required/>
                            <script>
                                var data = null, options = {
                                    url: function (phrase) {
                                        return "http://localhost:8080/bookItem/search";
                                    },

                                    getValue: function (element) {
                                        data = element;
                                        return element.title;
                                    },

                                    ajaxSettings: {
                                        dataType: "json",
                                        method: "GET",
                                        data: {
                                            dataType: "json"
                                        }
                                    },

                                    preparePostData: function (data) {
                                        data.phrase = $("#give_book_id").val();
                                        return data;
                                    },

                                    template: {
                                        type: "description",
                                        fields: {
                                            description: 'bookSerialNumber'
                                        }
                                    },

                                    requestDelay: 400,

                                    theme: "plate-dark"
                                };

                                $("#give_book_id").easyAutocomplete(options);

                                $('div.easy-autocomplete').removeAttr('style');
                            </script>

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
                                    <div class="col-sm-4"><g:message code="book.publishedDate.label"/></div>

                                    <div class="col-sm-8 text-warning1" id="give_published_date_id"></div>
                                </div>

                                <div class="row" style="margin-top: 10px;">
                                    <div class="col-sm-4"><g:message code="book.description.label"/></div>

                                    <div class="col-sm-8 text-warning1" id="give_description_id"
                                         style="max-height: 100px; overflow: auto;"></div>
                                </div>
                            </div>

                            <script>
                                // var input = $('#book_item_id');
                                $('#give_book_id').on('change', function (e) {
                                    var valueSelected = this.value,
                                        book = data;
                                    if (valueSelected !== 'default') {
                                        $("#give_btn_id").prop('disabled', false);
                                        $("#book_item_id").val(book['bookItemId']);
                                        $("#info_picture_id").attr('src', book['pictureUrl'] !== null ? book['pictureUrl'] : '/assets/no-photo-6.jpg');
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
                                    // input.val(parseInt(book['bookItemId']));
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
                            class="fa fa-lg fa-book"></i> <g:message code="give.label"/></button>
                    <button type="button" class="btn btn-default " data-dismiss="modal"><i
                            class="fa fa-lg fa-close"></i> <g:message code="cancel.button"/></button>
                    %{--</div>--}%
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>
