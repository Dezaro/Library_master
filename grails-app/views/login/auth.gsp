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
        <h2 class="text-center">Sign in</h2>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" name="${usernameParameter ?: 'username'}"
                       id="username" placeholder="User name" required="required">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control"
                       name="${passwordParameter ?: 'password'}"
                       id="password" placeholder="Password" required="required">
            </div>
        </div>

        <div class="form-group">
            <button type="submit" id="login_btn_id" class="btn btn-primary login-btn btn-block">Sign in</button>
        </div>

        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="" class="pull-right">Forgot Password?</a>
        </div>

        <div class="or-seperator"><i>or</i></div>

        <p class="text-center">Login with your social media account</p>

        <div class="text-center social-btn">
            <a href="" class="btn btn-primary"><i class="fa fa-facebook"></i>&nbsp; Facebook</a>
            <a href="" class="btn btn-info"><i class="fa fa-twitter"></i>&nbsp; Twitter</a>
            <a href="" class="btn btn-danger"><i class="fa fa-google"></i>&nbsp; Google</a>
        </div>
    </form>

    <p class="text-center text-muted small">Don't have an account? <a href="" data-toggle="modal"
                                                                      data-target="#registerModal">Sign up here!</a>
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