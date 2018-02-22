<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>

<body>

<div id="content" role="main" style="margin-top: 40px;">
    <section class="row colset-2-its">
        <div class="media">
            %{--<div style="display: inline-block;">--}%
                %{--<h2 class="title">Books</h2>--}%
            %{--</div>--}%

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

            <g:each var="book" in="${bookList}">
                <g:render template="/book/bookList" var="book" collection="${book}"/>
            </g:each>

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
