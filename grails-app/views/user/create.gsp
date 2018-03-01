<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav text-color-blues" role="navigation">
        <h1>User Create</h1>
        <hr/>
    </div>

    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.user}">
        <ul class="alert alert-danger" role="alert" style="list-style-type: none;">
            <g:eachError bean="${this.user}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><span
                        class="glyphicon glyphicon-exclamation-sign"></span> <g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="container-fluid custom-form">
        <div class="row">
            <div class="col-md-2">
            </div>

            <div class="col-md-8">
                <g:form class="comment-form-left" name="createUserForm" resource="${this.user}" method="POST">
                    <div class="form-group">
                        <label for="username_id" class="col-sm-4 control-label">
                            Username <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" id="username_id" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password_id" class="col-sm-4 control-label">
                            Password <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="password" class="form-control" name="password" id="password_id" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="user_role_id" class="col-sm-4 control-label">
                            Role <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <select class="form-control" name="userRole" id="user_role_id" required>
                                <g:each var="securityRole" in="${library.items.SecurityRole.getAll()}">
                                    <option value="${securityRole.id}">${securityRole.authority}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="passwordExpired" class="col-sm-4 control-label">
                            Password expired
                        </label>

                        <div class="col-sm-10">
                            <g:checkBox name="passwordExpired" value="${false}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="accountExpired" class="col-sm-4 control-label">
                            Account expired
                        </label>

                        <div class="col-sm-10">
                            <g:checkBox name="accountExpired" value="${false}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="accountLocked" class="col-sm-4 control-label">
                            Account locked
                        </label>

                        <div class="col-sm-10">
                            <g:checkBox name="accountLocked" value="${false}" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="enabled" class="col-sm-4 control-label">
                            Enabled
                        </label>

                        <div class="col-sm-10">
                            <g:checkBox name="enabled" value="${true}" />
                        </div>
                    </div>


                    <div class="form-group" style="margin-top: 15px;">
                        <div class="col-sm-3"></div>

                        <div class="col-sm-4">
                            %{--<button type="submit" class="btn btn-primary" style="margin-top: 15px;margin-bottom: 15px;">--}%
                            %{--<span class="fa fa-lg fa-edit"></span> Update--}%
                            %{--</button>--}%
                            <button id="#createBtn" type="submit" class="btn btn-success"
                                    style="margin-top: 15px;margin-bottom: 15px;">
                                <span class="fa fa-lg fa-plus-circle"></span> Create</button>
                        </div>

                        <div class="col-sm-4"></div>
                    </div>
                </g:form>
            </div>

            %{--<div class="col-md-2">--}%
            %{--</div>--}%
        </div>
    </div>
    </body>
</html>
