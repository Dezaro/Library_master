<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>

<body>

<div id="content" role="main">
    <section class="row colset-2-its">
        <div class="media">
            %{--<div style="display: inline-block;">--}%
            %{--<h2 class="title">Books</h2>--}%
            %{--</div>--}%

            <div class="row" id="search">
                <g:form action="search" method="GET" enctype="multipart/form-data">
                    <div class="form-group col-xs-9">
                        <g:textField class="form-control" type="text" placeholder="Search by title or author"
                                     name="searchFor"
                                     value="${params.searchFor}"/>
                    </div>

                    <div class="form-group col-xs-3">
                        <button type="submit" class="btn btn-block btn-primary">Search</button>
                    </div>
                </g:form>
            </div>

            <div class="row" id="filter">
                <g:form action="filter" method="GET">
                    <div class="form-group col-sm-3 col-xs-6">
                        %{--<select onchange="this.form.submit()" data-filter="make" class="filter-make filter form-control">--}%
                        %{--<option value="">Select Category</option>--}%
                        %{--<g:each var="category" in="${categoryList}">--}%
                        %{--<option  value="${params.filter}">${category.categoryName}</option>--}%
                        %{--</g:each>--}%
                        %{--</select>--}%
                        <g:select optionKey="id"
                                  optionValue="categoryName"
                                  name="category"
                                  from="${categoryList}"
                                  noSelection="${['null':'Select Category...']}"
                                  onchange="this.form.submit()" data-filter="make"
                                  class="filter-make filter form-control">
                        </g:select>
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
                </g:form>
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
