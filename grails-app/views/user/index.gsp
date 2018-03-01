<%@ page import="library.items.UserSecurityRole" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="container" style="width: 100%;">
        <div class="table-wrapper" style="width: 100%;">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-5">
                        <h2>Users <b>Management</b></h2>
                    </div>

                    <div class="col-sm-7">
                        <g:link class="btn btn-primary" action="create"><i
                                class="material-icons">&#xE147;</i><span><g:message code="default.new.label"
                                                                                    args="[entityName]"/></span></a></g:link>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Password expired</th>
                    <th>Account locked</th>
                    <th>Account expired</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <g:each var="user" in="${userList}">
                    <tr>
                        <td><g:link action="show" id="${user.id}">${user.username}</g:link></td>
                        <td>${library.items.SecurityRole.findById(library.items.UserSecurityRole.findByUser(user).securityRole.id).authority}</td>
                        <td>${user.passwordExpired}</td>
                        <td>${user.accountLocked}</td>
                        <td>${user.accountExpired}</td>
                        <td style="padding: 0 !important;"><span
                                class="status ${user.enabled ? 'text-success' : 'text-danger'}">&bull;</span> ${user.enabled ? 'Enabled' : 'Disabled'}
                        </td>
                        <td>
                            <g:link action="edit" id="${user.id}" class="settings" title="Settings" data-toggle="tooltip"><i
                                    class="material-icons">&#xE8B8;</i></g:link>
                            <a href="#deleteModal" data-toggle="modal" class=" delete" title="Delete"
                               data-user-id="${user.id}"><i
                                    class="material-icons">&#xE5C9;</i></a>

                            <form id="form_${user.id}" action="/user/delete/${user.id}" method="post">
                                <input type="hidden" name="_method" value="DELETE" id="_method_${user.id}">
                            </form>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${userCount ?: 0}"/>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#deleteModal').on('show.bs.modal', function (e) {
                var user_id = $(e.relatedTarget).data('user-id');
                $(e.currentTarget).find('input[name="user_id"]').val(user_id);
            });
        });
        function submitForm() {
            var user_id = document.getElementsByName('user_id')[0].value,
                user_form = document.getElementById('form_' + user_id);
            user_form.submit();
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
                    <p>Do you really want to delete these record? This process cannot be undone.</p>
                </div>
                <g:form id="#deleteForm" resource="" method="POST">
                    <g:hiddenField name="user_id" value=""/>
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