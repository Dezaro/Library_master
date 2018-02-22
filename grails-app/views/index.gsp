<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>

<body>
<content tag="nav">
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Application Status <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Environment: ${grails.util.Environment.current.name}</a></li>
            <li><a href="#">App profile: ${grailsApplication.config.grails?.profile}</a></li>
            <li><a href="#">App version:
                <g:meta name="info.app.version"/></a>
            </li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Grails version:
                <g:meta name="info.app.grailsVersion"/></a>
            </li>
            <li><a href="#">Groovy version: ${GroovySystem.getVersion()}</a></li>
            <li><a href="#">JVM version: ${System.getProperty('java.version')}</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Artefacts <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <li><a href="#">Controllers: ${grailsApplication.controllerClasses.size()}</a></li>
            <li><a href="#">Domains: ${grailsApplication.domainClasses.size()}</a></li>
            <li><a href="#">Services: ${grailsApplication.serviceClasses.size()}</a></li>
            <li><a href="#">Tag Libraries: ${grailsApplication.tagLibClasses.size()}</a></li>
        </ul>
    </li>
    <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
           aria-expanded="false">Installed Plugins <span class="caret"></span></a>
        <ul class="dropdown-menu">
            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                <li><a href="#">${plugin.name} - ${plugin.version}</a></li>
            </g:each>
        </ul>
    </li>
</content>

%{--<div class="svg" role="presentation">--}%
%{--<div class="grails-logo-container">--}%
%{--<asset:image src="grails-cupsonly-logo-white.svg" class="grails-logo"/>--}%
%{--</div>--}%
%{--</div>--}%

<div id="content" role="main">
    <section class="row colset-2-its">
        %{--<h1>Welcome to Grails</h1>--}%

        %{--<p>--}%
        %{--Congratulations, you have successfully started your first Grails application! At the moment--}%
        %{--this is the default page, feel free to modify it to either redirect to a controller or display--}%
        %{--whatever content you may choose. Below is a list of controllers that are currently deployed in--}%
        %{--this application, click on each to execute its default action:--}%
        %{--</p>--}%

        <div class="page_wrap movie_wrap">
            <main id="main" class="">
                <div class="media">
                    <div style="display: inline-block;">
                        <h2 class="title">Books</h2>
                    </div>

                    <div class="row" id="search">
                        <form id="search-form" action="" method="POST" enctype="multipart/form-data">
                            <div class="form-group col-xs-9">
                                <input class="form-control" type="text" placeholder="Search"/>
                            </div>

                            <div class="form-group col-xs-3">
                                <button type="submit" class="btn btn-block btn-primary">Search</button>
                            </div>
                        </form>
                    </div>

                    <div class="row" id="filter">
                        <form>
                            <div class="form-group col-sm-3 col-xs-6">
                                <select data-filter="make" class="filter-make filter form-control">
                                    <option value="">Select Make</option>
                                    <option value="">Show All</option>
                                </select>
                            </div>

                            <div class="form-group col-sm-3 col-xs-6">
                                <select data-filter="model" class="filter-model filter form-control">
                                    <option value="">Select Model</option>
                                    <option value="">Show All</option>
                                </select>
                            </div>

                            <div class="form-group col-sm-3 col-xs-6">
                                <select data-filter="type" class="filter-type filter form-control">
                                    <option value="">Select Type</option>
                                    <option value="">Show All</option>
                                </select>
                            </div>

                            <div class="form-group col-sm-3 col-xs-6">
                                <select data-filter="price" class="filter-price filter form-control">
                                    <option value="">Select Price Range</option>
                                    <option value="">Show All</option>
                                </select>
                            </div>
                        </form>
                    </div>


                    <div class="results">
                        <div class="item poster card">
                            <div class="image_content">
                                <img class="poster fade lazyloaded"
                                     src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/ec1m7YgBYb4os06OSNW3QBaNYqZ.jpg">
                            </div>

                            <div class="info">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h4 class="title">Rambo</h4>
                                    </div>

                                    <div class="col-md-3">
                                        <span class="vote_average pull-right">6.4 <span
                                                class="glyphicon glyphicon-star"></span></span>
                                    </div>
                                </div>

                                <p class="meta flex">
                                    <span class="release_date"><span
                                            class="glyphicons glyphicons-calendar x1"></span> 2008-01-24</span>

                                </p>

                                <p class="genres pull-right" style="font-style: italic;">Екшън,Трилър</p>

                                <p class="overview">When governments fail to act on behalf of captive missionaries, ex-Green Beret John James Rambo sets aside his peaceful existence along the Salween River in a war-torn region of Thailand to take action.  Although he's still haunted by violent memories of his time as a U.S. soldier during the Vietnam War, Rambo can hardly turn his back on the aid workers who so desperately need his help.</p>
                            </div>
                        </div>

                        <div class="item poster card">
                            <div class="image_content">
                                <img class="poster fade lazyloaded"
                                     src="https://image.tmdb.org/t/p/w370_and_h556_bestv2/8WHzOXKQBx83tr8ZBYlfttl8YEl.jpg">
                            </div>

                            <div class="info">
                                <div class="row">
                                    <div class="col-md-9">
                                        <h4 class="title">Rambo</h4>
                                    </div>

                                    <div class="col-md-3">
                                        <span class="vote_average pull-right">0 <span
                                                class="glyphicon glyphicon-star"></span></span>
                                    </div>
                                </div>

                                <p class="meta flex">
                                    <span class="release_date"><span
                                            class="glyphicons glyphicons-calendar x1"></span> 2018-02-01</span>

                                </p>

                                <p class="genres pull-right" style="font-style: italic;">Екшън</p>

                                <p class="overview">The action film will follow the last surviving member of an elite covert unit of the Indian Armed forces who returns home to discover a war waging in his own land. Forced into the dangerous jungles and frozen mountains of the Himalayas, he unleashes mayhem and destruction, becoming the unstoppable machine he was trained to be.</p>
                            </div>
                        </div>
                    </div>

                </div>
            </main>
        </div>

        <div id="list-template" style="display: none;">
            <li class="list-group-item">
                <div class="row">
                    <div class="col-md-2">
                        <img src="" alt='image' id="image" class="thumbnail img-responsive"
                             style="height: 180px; width:120px;">
                    </div>

                    <div class="col-md-10">
                        <div class="row">
                            <div class="col-md-10">
                                <h4 class="title"></h4>
                                <h6 class="genres" style="font-style: italic;"></h6>

                                <p class="release_date"></p>
                            </div>

                            <div class="col-md-2">
                                <p class="vote_average" style="text-align:right"></p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <p class="overview" style="text-align:justify"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </div>

        <div id="card-template" style="display: none;">
            <div class="item poster card">
                <div class="image_content">
                    <img class="poster lazyload fade" src="">
                </div>

                <div class="info">
                    <div class="row">
                        <div class="col-md-9">
                            <h4 class="title"></h4>
                        </div>

                        <div class="col-md-3">
                            <span class="vote_average pull-right"><span class="glyphicon glyphicon-star"></span></span>
                        </div>
                    </div>

                    <p class="meta flex">
                        <span class="release_date">
                            <span class="glyphicons glyphicons-calendar x1"></span></span>

                    </p>

                    <p class="genres pull-right" style="font-style: italic;"></p>

                    <p class="overview"></p>
                </div>
            </div>
        </div>

        %{--<g:each var="b" in="${grailsApplication.book.index}">--}%

        %{--</g:each>--}%

        <div id="controllers" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">
                    <li class="controller">
                        <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                    </li>
                </g:each>
            </ul>
        </div>
    </section>
</div>

</body>
</html>
