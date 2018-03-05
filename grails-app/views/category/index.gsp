<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
%{--<a href="#list-category" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
                                                               %{--default="Skip to content&hellip;"/></a>--}%

%{--<div class="nav" role="navigation">--}%
    %{--<ul>--}%
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
                                                              %{--args="[entityName]"/></g:link></li>--}%
    %{--</ul>--}%
%{--</div>--}%

%{--<div id="list-category" class="content scaffold-list" role="main">--}%
    %{--<h1><g:message code="default.list.label" args="[entityName]"/></h1>--}%
    %{--<g:if test="${flash.message}">--}%
        %{--<div class="message" role="status">${flash.message}</div>--}%
    %{--</g:if>--}%
    %{--<f:table collection="${categoryList}"/>--}%

<div class="container" style="width: 100%;">
    <div class="table-wrapper" style="width: 100%;">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2>Categories <b>Management</b></h2>
                </div>

                <div class="col-sm-7">
                    <g:link class="btn btn-primary" action="create" name="new_category"><i
                            class="material-icons">&#xE147;</i><g:message code="default.new.label"
                                                                                args="[entityName]"/></g:link>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>Category Name</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="category" in="${categoryList}">
                <tr>
                    <td><g:link action="show" id="${category.id}">${category.categoryName}</g:link></td>
                    <td>
                        <g:link action="edit" id="${category.id}" class="settings" title="Settings" data-toggle="tooltip"><i
                                class="material-icons">&#xE8B8;</i></g:link>
                        <a href="#deleteModal" data-toggle="modal" class=" delete" title="Delete"
                           data-category-id="${category.id}"><i
                                class="material-icons">&#xE5C9;</i></a>

                        <form id="form_${category.id}" action="/category/delete/${category.id}" method="post">
                            <input type="hidden" name="_method" value="DELETE" id="_method_${category.id}">
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

<g:javascript library='jquery'>
    (function ($) {
        $(document).ready(function () {
            $('#deleteModal').on('show.bs.modal', function (e) {
                var category_id = $(e.relatedTarget).data('category-id');
                $(e.currentTarget).find('input[name="category_id"]').val(category_id);
            });
        });

    })(jQuery);
</g:javascript>
<script>
    function submitForm() {
        var category_id = document.getElementsByName('category_id')[0].value,
            category_form = document.getElementById('form_' + category_id);
        category_form.submit();
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
                <g:hiddenField name="category_id" value=""/>
            </g:form>
            <div class="modal-footer">
                <button id="#deleteBtn" type="button" onclick="submitForm()" class="btn btn-danger">Delete</button>
                <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

</div>
</body>
</html>