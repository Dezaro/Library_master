<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--<g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>--}%
    %{--<title><g:message code="category.list.label"/></title>--}%
</head>

<body>

<div class="container bootstrap snippet">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-6 col-md-offset-2">
            <div class="panel panel-info">

                <div class="panel-heading">
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-th"></span>
                        <g:message code="change.password.for.user.label"/> [ <span style="color: orange">${user.username}</span> ]
                    </h3>
                </div>

            <div class="panel-body">
                <g:if test="${flash.message}">
                    <div class="alert alert-info" role="status">${flash.message}</div>
                </g:if>
                <g:if test="${flash.error}">
                    <div class="alert alert-danger" role="alert">${flash.error}</div>
                </g:if>
                <g:form action="updatePassword" method="POST">
                    <div class="row">
                        <input type="hidden" name="token" value="${token}">

                        <div class="col-xs-12 col-sm-12 col-md-12 login-box">
                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span>
                                    </div>
                                    <input class="form-control" name="password" type="password" placeholder="${g.message(code: 'password.placeholder', default: 'Password')}">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="input-group">
                                    <div class="input-group-addon"><span class="glyphicon glyphicon-log-in"></span>
                                    </div>
                                    <input class="form-control" name="password_confirm" type="password" placeholder="${g.message(code: 'confirm.password.placeholder', default: 'Confirm password')}">
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>

                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-xs-12 text-center">
                                <button type="submit" name="_action_updatePassword"
                                        class="btn icon-btn-save btn-success">
                                    <span class="btn-save-label"><i class="glyphicon glyphicon-floppy-disk"></i>
                                    </span><g:message code="save.label"/>
                                </button>
                            </div>
                        </div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>