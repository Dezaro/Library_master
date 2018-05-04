<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<div class="col-md-3"></div>

<div class="login-form col-md-6">
    <g:if test='${flash.message}'>
        <div class="alert alert-danger"><strong>${flash.message}</strong></div>
    </g:if>
    <form role="form" action="${postUrl ?: '/login/authenticate'}" method="POST"
          id="loginForm" autocomplete="off">
        <h2 class="text-center"><g:message code="sign.in"/></h2>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="${usernameParameter ?: 'username'}"
                       id="username" placeholder="${g.message(code: 'username.placeholder', default: 'Username...')}" required="required">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control"
                       name="${passwordParameter ?: 'password'}"
                       id="password" placeholder="${g.message(code: 'password.placeholder', default: 'Password...')}" required="required">
            </div>
        </div>

        <div class="form-group">
            <button type="submit" id="login_btn_id" class="btn btn-primary login-btn btn-block"><g:message code="sign.in"/></button>
        </div>

        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> <g:message code="remember.me"/></label>
            <a href="" class="pull-right"><g:message code="forgot.password"/>?</a>
        </div>

        <div class="or-seperator"><i><g:message code="or"/></i></div>

        <p class="text-center"><g:message code="login.with.social.accout"/></p>

        <div class="text-center social-btn">
            <a href="" class="btn btn-primary"><i class="fa fa-facebook"></i>&nbsp; Facebook</a>
            <a href="" class="btn btn-info"><i class="fa fa-twitter"></i>&nbsp; Twitter</a>
            <a href="" class="btn btn-danger"><i class="fa fa-google"></i>&nbsp; Google</a>
        </div>
    </form>

    <p class="text-center text-muted small"><g:message code="dont.have.account.question"/> <a href="" data-toggle="modal"
                                                                      data-target="#registerModal"><g:message code="sign.up.here"/></a>
    </p>
</div>

<div class="col-md-3"></div>
<script>
    (function () {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
</script>
</body>
</html>