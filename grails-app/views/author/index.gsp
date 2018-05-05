<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'author.label', default: 'Author')}"/>
    <title><g:message code="author.list.label"/></title>
</head>

<body>
%{--<a href="#list-author" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--<div id="list-author" class="content scaffold-list" role="main">--}%
%{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
%{--<g:if test="${flash.message}">--}%
%{--<div class="message" role="status">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<f:table collection="${authorList}" />--}%

%{--<div class="pagination">--}%
%{--<g:paginate total="${authorCount ?: 0}" />--}%
%{--</div>--}%
%{--</div>--}%



<div class="container" style="width: 100%;">
    <div class="table-wrapper" style="width: 100%;">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2><b><g:message code="authors.management"/></b></h2>
                </div>

                <div class="col-sm-7">
                    <g:link class="btn btn-primary" action="create" name="new_author_id"><i
                            class="material-icons">&#xE147;</i><g:message code="new.author.label"/></g:link>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th><g:message code="author.name.label"/></th>
                <th><g:message code="action.label"/></th>
            </tr>
            </thead>
            <tbody>
            <g:each var="author" in="${authorList}">
                <tr>
                    <td><g:link action="show" id="${author.id}">${author.authorName}</g:link></td>
                    <td>
                        <g:link action="edit" id="${author.id}" class="settings" title="${g.message(code: 'edit', default: 'Edit...')}"
                                data-toggle="tooltip"><i
                                class="material-icons">&#xE8B8;</i></g:link>
                        <a href="#deleteModal" data-toggle="modal" class=" delete" title="${g.message(code: 'delete.button', default: 'Delete...')}"
                           data-author-id="${author.id}"><i
                                class="material-icons">&#xE5C9;</i></a>

                        <form id="form_${author.id}" action="/author/delete/${author.id}" method="post">
                            <input type="hidden" name="_method" value="DELETE" id="_method_${author.id}">
                        </form>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>

        <div class="pagination">
            <g:paginate total="${authorCount ?: 0}"/>
        </div>
    </div>
</div>


<g:javascript library='jquery'>
    (function ($) {
        $(document).ready(function () {
            // $('#deleteModal').modal('show');
            $('#deleteModal').on('show.bs.modal', function (e) {
                var author_id = $(e.relatedTarget).data('author-id');
                $(e.currentTarget).find('input[name="author_id"]').val(author_id);
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
        var author_id = document.getElementsByName('author_id')[0].value,
            author_form = document.getElementById('form_' + author_id);
        author_form.submit();
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
                <g:hiddenField name="author_id" value=""/>
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