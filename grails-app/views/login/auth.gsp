<html>
<head>
    <meta name="layout" content="${gspLayout ?: 'main'}"/>
    <title><g:message code='springSecurity.login.title'/></title>
</head>

<body>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            appId: '2103327649911618', // App ID
            channelUrl: 'http://192.168.56.1:8080/login/auth', // Channel File
            status: true, // check login status
            cookie: true, // enable cookies to allow the server to access the session
            xfbml: true  // parse XFBML
        });
        // Additional initialization code here
    };
    // Load the SDK Asynchronously
    (function (data) {
        var jse, id = 'facebook-jssdk', ref = data.getElementsByTagName('script')[0];
        if (data.getElementById(id)) {
            return;
        }
        jse = data.createElement('script');
        jse.id = id;
        jse.async = true;
        jse.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=2103327649911618";
        ref.parentNode.insertBefore(jse, ref);
    }(document));
</script>

%{--<script>--}%
%{--window.fbAsyncInit = function() {--}%
%{--FB.init({--}%
%{--appId      : '{2103327649911618}',--}%
%{--cookie     : true,--}%
%{--xfbml      : true,--}%
%{--// version    : '{latest-api-version}'--}%
%{--});--}%

%{--FB.AppEvents.logPageView();--}%

%{--};--}%

%{--(function(d, s, id){--}%
%{--var js, fjs = d.getElementsByTagName(s)[0];--}%
%{--if (d.getElementById(id)) {return;}--}%
%{--js = d.createElement(s); js.id = id;--}%
%{--js.src = "https://connect.facebook.net/en_US/sdk.js";--}%
%{--fjs.parentNode.insertBefore(js, fjs);--}%
%{--}(document, 'script', 'facebook-jssdk'));--}%
%{--</script>--}%

%{--<div class="fb-login-button">Login with Facebook</div>--}%

<script>
    FB.Event.subscribe('auth.login', function () {
        FB.getLoginStatus(function (response) {
            if (typeof(response) == 'undefined') {
                return
            }
            else {
                var uid = response.authResponse.userID;
                var accessToken = response.authResponse.accessToken;
                console.log(uid, accessToken);
                getProfileInfoAndLogin(accessToken);
            }

        });
    });

    function getProfileInfoAndLogin(token) {
        var url = "${createLink(controller: 'home', action: 'index')}";
        FB.api("/me", "GET", function (response) {
            $.ajax({
                type: "GET",
                url: url,
                dataType: "html",
                data: {fbEmail: response.email}
            }).done(function (data) {
                alert(data);
                if (data == "true") {
                    // redirect user to his homepage
                    window.location = "http://localhost:8080";
                }
                else {
                    alert("failure")
                }
            });
        });
    }
</script>


%{--<sec:ifNotGranted roles="ROLE_USER">--}%
%{--<facebookAuth:connect />--}%
%{--</sec:ifNotGranted>--}%
%{--<sec:ifAllGranted roles="ROLE_USER">--}%
%{--Welcome <sec:username/>! (<g:link uri="/j_spring_security_logout">Logout</g:link>)--}%
%{--</sec:ifAllGranted>--}%

%{--<sec:ifNotGranted roles="ROLE_USER">--}%
%{--<facebookAuth:connect />--}%
%{--</sec:ifNotGranted>--}%
%{--<sec:ifAllGranted roles="ROLE_USER">--}%
%{--Welcome <sec:username/>! (<g:link uri="/j_spring_security_logout">Logout</g:link>)--}%
%{--</sec:ifAllGranted>--}%
%{--<a href="https://localhost:8443/springSecurityOAuth2/authenticate?provider=google" provider="google">Google</a>--}%
%{--<oauth2:connect provider="google" id="google-connect-link">Google</oauth2:connect>--}%

%{--Logged with google?--}%
%{--<oauth2:ifLoggedInWith provider="google">yes</oauth2:ifLoggedInWith>--}%
%{--<oauth2:ifNotLoggedInWith provider="google">no</oauth2:ifNotLoggedInWith>--}%

<div class="col-xs-3"></div>

<div class="login-form col-xs-6">
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
                       id="username" placeholder="${g.message(code: 'username.placeholder', default: 'Username...')}"
                       required="required">
            </div>
        </div>

        <div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control"
                       name="${passwordParameter ?: 'password'}"
                       id="password" placeholder="${g.message(code: 'password.placeholder', default: 'Password...')}"
                       required="required">
            </div>
        </div>

        <div class="form-group">
            <button type="submit" id="login_btn_id" class="btn btn-primary login-btn btn-block"><g:message
                    code="sign.in"/></button>
        </div>

        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> <g:message code="remember.me"/></label>
            <a href="" data-toggle="modal" data-target="#resetPasswordModal" class="pull-right"><g:message
                    code="forgot.password"/>?</a>
        </div>

        <div class="or-seperator"><i><g:message code="or"/></i></div>

        <p class="text-center"><g:message code="login.with.social.accout"/></p>

        <div class="text-center social-btn">
            <a href="/j_spring_security_facebook_redirect" class="btn btn-primary"><i
                    class="fa fa-facebook"></i>&nbsp; Facebook</a>
            <a href="" class="btn btn-info"><i class="fa fa-twitter"></i>&nbsp; Twitter</a>
            <a href="/springSecurityOAuth2/authenticate?provider=google" class="btn btn-danger"><i
                    class="fa fa-google"></i>&nbsp; Google</a>
        </div>
    </form>

    <p class="text-center text-muted small"><g:message code="dont.have.account.question"/> <a href=""
                                                                                              data-toggle="modal"
                                                                                              data-target="#registerModal"><g:message
                code="sign.up.here"/></a>
    </p>
</div>

<div class="col-xs-3"></div>

<!-- Modal -->
<div class="modal fade" id="resetPasswordModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-2"></div>

                    <div class="col-xs-8">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="text-center">
                                    <h3><i class="fa fa-lock fa-4x"></i></h3>

                                    <h2 class="text-center">Forgot Password?</h2>

                                    <p>You can reset your password here.</p>

                                    <div class="panel-body">

                                        <form id="register-form" role="form" autocomplete="off" class="form"
                                              method="post">

                                            <div class="form-group">
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i
                                                            class="glyphicon glyphicon-envelope color-blue"></i>
                                                    </span>
                                                    <input id="user-name" name="userName"
                                                           placeholder="Email or Username"
                                                           class="form-control" type="text">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <input id="resetPasswordBtn" name="recover-submit"
                                                       class="btn btn-lg btn-primary btn-block"
                                                       value="Reset Password" type="button">
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xs-2"></div>
                </div>
            </div>
        </div>

    </div>
</div>
<div class="modal fade" id="sendMailInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-header-info" id="modal_header_id">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                <h1><i class="fa fa-lg fa-info-circle"></i> <g:message code="mail.info.label"/></h1>
            </div>

            <div class="modal-body" id="modal_body_info">
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-info center-block" data-dismiss="modal"
                        id="modal_btn_id"><i
                        class="fa fa-lg fa-info-circle"></i> <g:message code="accept.label"/></button>
            </div>
        </div>
    </div>
</div>
<script>
    (function () {
        document.forms['loginForm'].elements['${usernameParameter ?: 'username'}'].focus();
    })();
    $('body').on('click', '#resetPasswordBtn', function (event) {
        $('#resetPasswordModal').modal('toggle');
        function ajaxInfoModal(valid) {
            var header = $("#modal_header_id"),
                btn = $("#modal_btn_id"),
                header_info_cls = 'modal-header-info',
                header_danger_cls = 'modal-header-danger',
                btn_info_cls = 'btn-info',
                btn_danger_cls = 'btn-danger';
            if (valid) {
                header.removeClass(header_danger_cls);
                header.addClass(header_info_cls);
                btn.removeClass(btn_danger_cls);
                btn.addClass(btn_info_cls);
            } else {
                header.removeClass(header_info_cls);
                header.addClass(header_danger_cls);
                btn.removeClass(btn_info_cls);
                btn.addClass(btn_danger_cls);
            }
        }

        var userName = $("input[name=userName]").val();
        if (userName && userName !== '') {
            $('body').preloader();
            $.ajax({
                method: 'POST',
                url: '/emailSender/sendResetPasswordEmail',
                data: {
                    userName: userName
                }
            }).done(function (response) {
                $('body').preloader('remove');
                $('#sendMailInfo').modal('show');
                ajaxInfoModal(true);
                $('#modal_body_info').text(response.message);
            }).fail(function () {
                $('body').preloader('remove');
                $('#sendMailInfo').modal('show');
                ajaxInfoModal(false);
                $('#modal_body_info').text('Something went wrong!');
            });
        }
    });
</script>
</body>
</html>