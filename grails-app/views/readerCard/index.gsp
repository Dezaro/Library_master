<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'readerCard.label', default: 'ReaderCard')}"/>
    <title><g:message code="readerCard.list.label"/></title>
</head>

<body>
%{--<a href="#list-readerCard" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--<div id="list-readerCard" class="content scaffold-list" role="main">--}%
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
%{--<g:if test="${flash.message}">--}%
%{--<div class="message" role="status">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<f:table collection="${readerCardList}" />--}%
%{--</div>--}%




<div class="container" style="width: 100%;">
    <div class="table-wrapper" style="width: 100%;">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2><b><g:message code="readerCard.management.label"/></b></h2>
                </div>

                <div class="col-sm-7">
                    <g:link class="btn btn-primary" action="create" name="new_reader_card"><i
                            class="material-icons">&#xE147;</i><g:message code="readerCard.new.label"/></g:link>
                </div>
            </div>
        </div>
        <table class="table table-condensed table-striped table-hover">
            <thead>
            <tr>
                <th><g:message code="readerCard.number.label"/></th>
                <th><g:message code="readerCard.reader.names.label"/></th>
                <th><g:message code="readerCard.person.number.label"/></th>
                <th><g:message code="readerCard.address.label"/></th>
                <th><g:message code="readerCard.phone.label"/></th>
                <th><g:message code="readerCard.register.date.label"/></th>
                <th>Email</th>
                <th><g:message code="status.label"/></th>
                <th><g:message code="action.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each var="readerCard" in="${readerCardList}">
                <tr>
                    <td><g:link action="show" id="${readerCard.id}"><img
                            src="/assets/card_reader.png"
                            height="45" width="45" class="avatar"
                            alt="avatar"/> ${readerCard.cardNumber}</g:link></td>
                    <td>${readerCard.readerNames}</td>
                    <td>${readerCard.personNumber}</td>
                    <td>${readerCard.address}</td>
                    <td>${readerCard.phone}</td>
                    <td>${readerCard.registerDate}</td>
                    <td>${readerCard.email}</td>
                    <td><span class="status text-success">&bull;</span> <g:message code="active.label"/></td>
                    <td>
                        <g:link action="show" id="${readerCard.id}" title="${g.message(code: 'settings', default: 'Settings...')}"><i class="material-icons">&#xE3B1;</i></g:link>

                        <g:link action="edit" id="${readerCard.id}" class="settings" title="${g.message(code: 'edit', default: 'Edit...')}"
                                data-toggle="tooltip"><i
                                class="material-icons">&#xE8B8;</i></g:link>

                        <a href="#deleteModal" data-toggle="modal" class=" delete" title="${g.message(code: 'delete.button', default: 'Delete...')}"
                           data-readercard-id="${readerCard.id}"><i
                                class="material-icons">&#xE5C9;</i></a>

                        <form id="form_${readerCard.id}" action="/readerCard/delete/${readerCard.id}" method="post">
                            <input type="hidden" name="_method" value="DELETE" id="_method_${readerCard.id}">
                        </form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${readerCardCount ?: 0}"/>
        </div>
    </div>
</div>


<g:javascript library='jquery'>
    (function ($) {
        $(document).ready(function () {
            $('#deleteModal').on('show.bs.modal', function (e) {
                var readerCard_id = $(e.relatedTarget).data('readercard-id');
                $(e.currentTarget).find('input[name="readerCard_id"]').val(readerCard_id);
            });
        });

    })(jQuery);
</g:javascript>
<script>
    function submitForm() {
        var readerCard_id = document.getElementsByName('readerCard_id')[0].value,
            readerCard_form = document.getElementById('form_' + readerCard_id);
        readerCard_form.submit();
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
                <g:hiddenField name="readerCard_id" value=""/>
            </g:form>
            <div class="modal-footer">
                <button id="#deleteBtn" type="button" onclick="submitForm()" class="btn btn-danger"><g:message code="delete.button"/></button>
                <button type="button" class="btn btn-info" data-dismiss="modal"><g:message code="cancel.button"/></button>
            </div>
        </div>
    </div>
</div>
</body>
</html>