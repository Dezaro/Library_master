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
                %{--<button type="button" class="btn btn-success">Samsung</button>--}%
                <a href="/readerCard/show/${readerCard.id}" type="button"
                   class="btn btn-primary ${actionName == 'show' ? 'active' : ''}">All Given</a>
                <a href="/readerCard/showAllNotReturnedBooks/${readerCard.id}"
                   class="btn btn-danger ${actionName == 'showAllNotReturnedBooks' ? 'active' : ''}">Not Returned</a>
            </div>
        </div>
    </div>

    <hr/>

    <div class="col-sm-4">
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
    %{--<f:display bean="readerCard" style="float: right;"/>--}%
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
        <script>
            $('#given_books_table_id').on('click', 'tbody tr', function (event) {
                console.log('asdasd');
//                if($(this).hasClass('active')){
//                    $(this).removeClass('active');
//                } else {
//                    $(this).addClass('active').siblings().removeClass('active');
//                }
            });
        </script>
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
                        <a onclick="onSendMail({
                            email: '${readerCard.email}',
                            book: '${rentBook.title}',
                            returnBeforeDate: '${rentBook.returnBeforeDate}',
                            name: '${readerCard.readerNames}'
                        });" title="Send remind email"><i class="fa fa-lg fa-envelope-o text-info"></i></a>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <script>
            function onSendMail(params) {
                $('body').preloader();
                $.ajax({
                    method: 'POST',
                    url: '/emailSender/send',
                    data: params
                }).done(function (response) {
                    $('body').preloader('remove')
                    $('#sendMailInfo').modal('show');
                    $('.modal-body').text(response.message);
                }).fail(function () {
                    console.log("Something went wrong!");
                }).always(function () {

                });
            }
        </script>

        <div class="modal fade" id="sendMailInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header modal-header-info">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                        <h1><i class="fa fa-lg fa-info-circle"></i> Info Modal</h1>
                    </div>

                    <div class="modal-body">
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-info pull-left" data-dismiss="modal"><i
                                class="fa fa-lg fa-info-circle"></i> Accept</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

    </div>
</div>
</div>

</body>
</html>
