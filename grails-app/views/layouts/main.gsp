<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>


    <g:layoutHead/>
</head>

<body>

%{--<div class="navbar navbar-default navbar-static-top" role="navigation">--}%
%{--<div class="container">--}%
%{--<div class="navbar-header">--}%
%{--<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">--}%
%{--<span class="sr-only">Toggle navigation</span>--}%
%{--<span class="icon-bar"></span>--}%
%{--<span class="icon-bar"></span>--}%
%{--<span class="icon-bar"></span>--}%
%{--</button>--}%
%{--<a class="navbar-brand" href="/#">--}%
%{--<asset:image src="grails.svg" alt="Grails Logo"/>--}%
%{--</a>--}%
%{--</div>--}%
%{--<div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">--}%
%{--<ul class="nav navbar-nav navbar-right">--}%
%{--<g:pageProperty name="page.nav" />--}%
%{--</ul>--}%
%{--</div>--}%
%{--</div>--}%
%{--</div>--}%

<!-- page-head -->
<div class="page-head">
    <div class="header-nav ">
        <div class="logo wow fadeInUp animated" data-wow-delay=".5s">
            <h1>
                <a class="link link--kumya" href="/"><i></i><span data-letters="EDUMA">EDUMA</span></a>
            </h1>
        </div>

        <div class="top-nav wow fadeInUp animated" data-wow-delay=".5s">
            <label class="mobile_menu" for="mobile_menu">
                <span>Menu</span>
            </label>
            <input id="mobile_menu" type="checkbox">
            <ul class="nav">
                <li><a class="${controllerName == null ? 'active' : ''}" href="/">home</a></li>
                <li><a class="${controllerName == 'book' ? 'active' : ''}" href="/book">${controllerName}</a></li>
                <li><a href="/">courses</a>

                </li>
                <li><a href="/">Shortcodes</a></li>
                <li><a href="/">GALLERY</a>

                </li>
                <li><a href="/">CONTACT</a></li>
                <li><a href="#" data-toggle="modal" data-target="#myModal">Register</a></li>
                %{--<li><a href="/logout/index">Logout</a></li>--}%
                %{--<g:link controller='logout' action=''>Spring Logout</g:link>--}%
                %{--<li>${createLink(controller:'Logout') }</li>--}%
                <script>
                    function desf() {
                        var form_logout = document.getElementById('form_logout');
                        form_logout.submit();
                    }
                </script>
                <li><a onclick="desf()">Logout</a></li>

                <form id="form_logout" name="logout" method="POST" action="${createLink(controller: 'logout')}">
                    %{--<input type="submit" value="logout">--}%
                </form>
            </ul>
        </div>

        <div class="clearfix"></div>
    </div>
</div>
<!-- //page-head -->

<g:layoutBody/>

%{--<div class="footer" role="contentinfo"></div>--}%

<!--footer-->
<div class="footer">
    <div class="container">
        <div class="col-md-3 footer-grid wow fadeInRight animated" data-wow-delay=".5s">
            <h3>About us</h3>

            <p>Nam libero tempore, cum soluta nobis est eligendi
            optio cumque nihil impedit quo minus id quod maxime
            placeat facere possimus.</p>
        </div>

        <div class="col-md-2 footer-grid wow fadeInRight animated" data-wow-delay=".5s">
            <h3>Navigation</h3>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/">About</a></li>
                <li><a href="/">Courses</a></li>
                <li><a href="/">Shortcodes</a></li>
                <li><a href="/">Gallery</a></li>
                <li><a href="/">Contact</a></li>
            </ul>
        </div>

        <div class="col-md-3 footer-grid wow fadeInLeft animated" data-wow-delay=".5s">
            <h3>Get in Touch</h3>

            <h2>Eduma</h2>
            <ul>
                <li>2144 - 007 - 1566</li>
                <li>No 48, Season street,</li>
                <li>Livingstone,</li>
                <li>London</li>
                <li>Email : <a href="mailto:info@example.com">info@example.com</a></li>
            </ul>
        </div>

        <div class="col-md-4 social-grid wow fadeInLeft animated" data-wow-delay=".5s">
            <h3>Connect online</h3>
            <ul>
                <li><a class="fb1" href="#"></a></li>
                <li><a class="fb2" href="#"></a></li>
                <li><a class="fb3" href="#"></a></li>
                <li><a class="fb4" href="#"></a></li>
            </ul>

            <form>
                <input type="email" value="Enter your email" onfocus="this.value = '';" onblur="if (this.value == '') {
                    this.value = 'Enter your email';
                }" required="">
                <input type="submit" value=" ">
            </form>
        </div>

        <div class="clearfix"></div>

        <div class="copy-right">
            <p>&copy; 2016 Eduma. All Rights Reserved | Design by  <a href="http://w3layouts.com/">W3layouts</a></p>
        </div>
    </div>
</div>
<!-- //footer-->
<!-- Modal -->

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>

            <div class="modal-body modal-spa">
                <div class="login-grids">
                    <div class="login">
                        <div class="login-left">
                            <ul>
                                <li><a class="fb" href="#"><i></i>Sign in with Facebook</a></li>
                                <li><a class="goog" href="#"><i></i>Sign in with Google</a></li>
                                <li><a class="linkin" href="#"><i></i>Sign in with Linkedin</a></li>
                            </ul>
                        </div>

                        <div class="login-right">
                            <form>
                                <h3>Signin with your account</h3>
                                <input type="text" value="Email" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {
                                           this.value = 'Email';
                                       }" required="">
                                <input type="password" value="Password" onfocus="this.value = '';"
                                       onblur="if (this.value == '') {
                                           this.value = 'Password';
                                       }" required="">
                                <h4><a href="#">Forgot password</a> / <a href="#">Create new password</a></h4>

                                <div class="single-bottom">
                                    <input type="checkbox" id="brand" value="">
                                    <label for="brand"><span></span>Remember Me.</label>
                                </div>
                                <input type="submit" value="SIGNIN">
                            </form>
                        </div>

                        <div class="clearfix"></div>
                    </div>

                    <p>By logging in you agree to our <a href="#">Terms and Conditions</a> and <a
                            href="#">Privacy Policy</a></p>
                </div>
            </div>

        </div>
    </div>
</div>


<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
