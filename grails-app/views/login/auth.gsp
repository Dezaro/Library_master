<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>

</head>

<body>

<div class="container">
    <div class="row">
        %{--<div class="fheader"><g:message code='springSecurity.login.header'/></div>--}%

        %{--<g:if test='${flash.message}'>--}%
        %{--<div class="login_message">${flash.message}</div>--}%
        %{--</g:if>--}%

        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-heading"><strong class=""><g:message code='springSecurity.login.header'/></strong>

                </div>

                <div class="panel-body">
                    <form class="form-horizontal" role="form" action="${postUrl ?: '/login/authenticate'}" method="POST"
                          id="loginForm" class="cssform" autocomplete="off">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label"><g:message
                                    code='springSecurity.login.username.label'/>:</label>

                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="${usernameParameter ?: 'username'}"
                                       id="username" placeholder="User name" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="password" class="col-sm-3 control-label"><g:message
                                    code='springSecurity.login.password.label'/>:</label>

                            <div class="col-sm-9">
                                <input type="password" class="form-control" name="${passwordParameter ?: 'password'}"
                                       id="password" placeholder="Password" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-9">
                                <div class="checkbox">
                                    <label class="">
                                        <input type="checkbox" class="">Remember me</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group last">
                            <div class="col-sm-offset-3 col-sm-9">
                                <button type="submit" class="btn btn-success btn-sm">Sign in</button>
                                <button type="reset" class="btn btn-default btn-sm">Reset</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="panel-footer">Not Registered? <a href="#" class="">Register here</a>

                </div>
            </div>
        </div>
    </div>
</div>

%{--<div id="login">--}%
%{--<div class="inner">--}%
%{--<div class="fheader"><g:message code='springSecurity.login.header'/></div>--}%

%{--<g:if test='${flash.message}'>--}%
%{--<div class="login_message">${flash.message}</div>--}%
%{--</g:if>--}%

%{--<form action="${postUrl ?: '/login/authenticate'}" method="POST" id="loginForm" class="cssform" autocomplete="off">--}%
%{--<p>--}%
%{--<label for="username"><g:message code='springSecurity.login.username.label'/>:</label>--}%
%{--<input type="text" class="text_" name="${usernameParameter ?: 'username'}" id="username"/>--}%
%{--</p>--}%

%{--<p>--}%
%{--<label for="password"><g:message code='springSecurity.login.password.label'/>:</label>--}%
%{--<input type="password" class="text_" name="${passwordParameter ?: 'password'}" id="password"/>--}%
%{--</p>--}%

%{--<p>--}%
%{--<label for="coordinateValue">${position}</label>--}%
%{--<input type="hidden" name="coordinatePosition" id="coordinatePosition" value="${position}"/>--}%
%{--<input type="text" class="text_" name="coordinateValue" id="coordinateValue"/>--}%
%{--</p>--}%

%{--<p id="remember_me_holder">--}%
%{--<input type="checkbox" class="chk" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if>/>--}%
%{--<label for="remember_me"><g:message code='springSecurity.login.remember.me.label'/></label>--}%
%{--</p>--}%

%{--<p>--}%
%{--<input type="submit" id="submit" value="${message(code: 'springSecurity.login.button')}"/>--}%
%{--<input type="submit" id="submit" value="delo"/>--}%
%{--</p>--}%
%{--</form>--}%
%{--</div>--}%
%{--</div>--}%
<script>
    (function () {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>