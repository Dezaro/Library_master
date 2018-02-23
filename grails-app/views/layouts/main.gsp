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
    <asset:javascript src="application.js"/>

    <g:layoutHead/>
    <style>
    .blue-static {
        color: #337ab7;
        font-family: 'Nunito', sans-serif;
        font-size: 22px;
        font-weight: 500;
    }

    .nav-custom li a.active, .nav li a:hover {
        background: none;
        font-weight: bold;
        color: #E21737 !important;
        outline: none;
        text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.8);
    }

    .nav-custom li{
        width: 100%;
    }

    .nav-custom > li > a {
        padding: .5em 1em .5em 1em;
        font-family: 'Nunito', sans-serif;
        display: block;
        width: 100%;
        /*color: #3ea0f3;*/
        color: #556687;
        margin: 0;
        font-size: 16px;
        font-weight: 500;
        text-transform: uppercase;
        border: none;
        letter-spacing: 1px;
        border-style: solid;
        border-color: rgba(255, 255, 255, 0);
        background: none;
    }
    body{
        overflow:auto;
        font-size: 16px;
    }
    </style>
</head>

<body>

<!-- page-head -->
<div class="page-head">
    <div class="header-nav ">
        <div class="logo wow fadeInUp animated" data-wow-delay=".5s">
            <h1>
                <a class="link link--kumya" href="/"><i></i><span data-letters="LIBRARY" style="font-size: 36px;">LIBRARY</span></a>
            </h1>
        </div>

        <div class="top-nav wow fadeInUp animated" data-wow-delay=".5s">
            <label class="mobile_menu" for="mobile_menu">
                <span>Menu</span>
            </label>
            <input id="mobile_menu" type="checkbox">
            <ul class="nav">

                <li><a class="${controllerName == 'home' ? 'active' : ''}" href="/">home</a></li>
                <li><a class="${controllerName == 'courses' ? 'active' : ''}" href="/">courses</a></li>
                <li><a class="${controllerName == 'about' ? 'active' : ''}" href="/">about</a></li>
                <li><a class="${controllerName == 'contacts' ? 'active' : ''}" href="/">contacts</a></li>

                <sec:ifNotLoggedIn>
                    <li><a href="" data-toggle="modal" data-target="#registerModal">Register</a></li>
                    <li><a class="${controllerName == 'login' ? 'active' : ''}" href="/login/auth">login</a></li>
                </sec:ifNotLoggedIn>

                <sec:ifLoggedIn>
                    <script>
                        function logOut() {
                            var form_logout = document.getElementById('form_logout');
                            form_logout.submit();
                        }
                    </script>
                    <li style="cursor: pointer;"><a onclick="logOut()">Logout</a></li>

                    <form id="form_logout" name="logout" method="POST"
                          action="${createLink(controller: 'logout')}"></form>
                </sec:ifLoggedIn>

            </ul>
        </div>

        <div class="clearfix"></div>
    </div>
</div>
<!-- //page-head -->

<!-- page-content -->
<div class="container" style="margin-top: 40px;width: 100%">
    %{--<div class="row">--}%
        <div class="col-md-2">
        <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
            <sec:ifLoggedIn>
                <!-- Left column -->
                <span class="blue-static"><i class="fa fa-ln fa-wrench"></i> Management</span>
                <hr>
                <ul class="nav nav-custom nav-pills nav-stacked">
                    <li ><a href="/author/index" class="${controllerName == 'author' ? 'active' : ''}"><i class="glyphicon glyphicon-user"></i> Authors</a></li>
                    <li><a href="/book/index" class="${controllerName == 'book' ? 'active' : ''}"><i class="glyphicon glyphicon-book"></i> Books</a></li>
                    <li><a href="/bookItem/index" class="${controllerName == 'bookItems' ? 'active' : ''}"><i class="glyphicon glyphicon-tag"></i> Book Items</a></li>
                    <li><a href="/category/index" class="${controllerName == 'category' ? 'active' : ''}"><i class="glyphicon glyphicon-list"></i> Category</a></li>
                    <li><a href="/readerCard/index" class="${controllerName == 'readerCard' ? 'active' : ''}"><i class="glyphicon glyphicon-list-alt"></i> Readers cards</a></li>
                    <li><a href="/rentBook/index" class="${controllerName == 'rentBook' ? 'active' : ''}"><i class="glyphicon glyphicon-download-alt"></i> Rent Books</a></li>
                    <li><a href="/user/index" class="${controllerName == 'user' ? 'active' : ''}"><i class="fa fa-ln fa-users"></i> Users</a></li>
                </ul>
                <hr><!-- /col-3 -->
            </sec:ifLoggedIn>
        </div>

        <div class="col-md-8">
            <g:layoutBody/>
        </div>

    <div class="col-md-2"></div>
    %{--</div>--}%
</div>
<!-- //page-content -->

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
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
<!-- //Modal -->

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>



</body>
</html>
