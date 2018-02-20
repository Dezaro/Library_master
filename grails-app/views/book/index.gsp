<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <style type="text/css">
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Varela Round', sans-serif;
            font-size: 13px;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px 25px;
            margin: 30px 0;
            border-radius: 3px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }
        .table-title {
            padding-bottom: 15px;
            background: #299be4;
            color: #fff;
            padding: 16px 30px;
            margin: -20px -25px 10px;
            border-radius: 3px 3px 0 0;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn {
            color: #566787;
            float: right;
            font-size: 13px;
            background: #fff;
            border: none;
            min-width: 50px;
            border-radius: 2px;
            border: none;
            outline: none !important;
            margin-left: 10px;
        }
        .table-title .btn:hover, .table-title .btn:focus {
            color: #566787;
            background: #f2f2f2;
        }
        .table-title .btn i {
            float: left;
            font-size: 21px;
            margin-right: 5px;
        }
        .table-title .btn span {
            float: left;
            margin-top: 2px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table tr th:first-child {
            width: 60px;
        }
        table.table tr th:last-child {
            width: 100px;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
        table.table th i {
            font-size: 13px;
            margin: 0 5px;
            cursor: pointer;
        }
        table.table td:last-child i {
            opacity: 0.9;
            font-size: 22px;
            margin: 0 5px;
        }
        table.table td a {
            font-weight: bold;
            color: #566787;
            display: inline-block;
            text-decoration: none;
        }
        table.table td a:hover {
            color: #2196F3;
        }
        table.table td a.settings {
            color: #2196F3;
        }
        table.table td a.delete {
            color: #F44336;
        }
        table.table td i {
            font-size: 19px;
        }
        table.table .avatar {
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }
        .status {
            font-size: 30px;
            margin: 2px 2px 0 0;
            display: inline-block;
            vertical-align: middle;
            line-height: 10px;
        }
        .text-success {
            color: #10c469;
        }
        .text-info {
            color: #62c9e8;
        }
        .text-warning {
            color: #FFC107;
        }
        .text-danger {
            color: #ff5b5b;
        }
        .pagination {
            float: right;
            margin: 0 0 5px;
        }
        .pagination li a {
            border: none;
            font-size: 13px;
            min-width: 30px;
            min-height: 30px;
            color: #999;
            margin: 0 2px;
            line-height: 30px;
            border-radius: 2px !important;
            text-align: center;
            padding: 0 6px;
        }
        .pagination li a:hover {
            color: #666;
        }
        .pagination li.active a, .pagination li.active a.page-link {
            background: #03A9F4;
        }
        .pagination li.active a:hover {
            background: #0397d6;
        }
        .pagination li.disabled i {
            color: #ccc;
        }
        .pagination li i {
            font-size: 16px;
            padding-top: 6px
        }
        .hint-text {
            float: left;
            margin-top: 10px;
            font-size: 13px;
        }
        </style>
    </head>
    %{--<body>--}%
        %{--<a href="#list-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
        %{--<div class="nav" role="navigation">--}%
            %{--<ul>--}%
                %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
                %{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
            %{--</ul>--}%
        %{--</div>--}%
        %{--<div id="list-book" class="content scaffold-list" role="main">--}%
            %{--<h1><g:message code="default.list.label" args="[entityName]" /></h1>--}%
            %{--<g:if test="${flash.message}">--}%
                %{--<div class="message" role="status">${flash.message}</div>--}%
            %{--</g:if>--}%
            %{--<f:table collection="${bookList}" />--}%
            %{--<g:each var="book" in="${bookList}">--}%
                %{--<p>Title: ${book.title}</p>--}%
                %{--<p>Author: ${book.author}</p>--}%
            %{--</g:each>--}%
            %{--<div class="pagination">--}%
                %{--<g:paginate total="${bookCount ?: 0}" />--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</body>--}%
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-5">
                    <h2>User <b>Management</b></h2>
                </div>
                <div class="col-sm-7">
                    <g:link class="btn btn-primary" action="create"><i class="material-icons">&#xE147;</i><span><g:message code="default.new.label" args="[entityName]" /></span></a></g:link>
                    %{--<a href="#" class="btn btn-primary"><i class="material-icons">&#xE147;</i> <span>Add New User</span></a>--}%
                    <a href="${createLink(uri: '/')}" class="btn btn-primary"><i class="material-icons">&#xE24D;</i> <span><g:message code="default.home.label"/></span></a>
                </div>
            </div>
        </div>
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                %{--<th>#</th>--}%
                <th>Title</th>
                <th>Published date</th>
                <th>ISBN</th>
                <th>Description</th>
                <th>Publisher</th>
                <th>Page number</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="book" in="${bookList}">
                <tr>
                    <td>${book.title}</td>
                    <td><a href="#"><img src="/examples/images/avatar/1.jpg" class="avatar" alt="Avatar"> ${book.publishedDate}</a></td>
                    <td>${book.isbn}</td>
                    <td>${book.description}</td>
                    <td>${book.publisher}</td>
                    <td>${book.pageNumber}</td>
                    <td><span class="status text-success">&bull;</span> Active</td>
                    <td>
                        %{--<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>--}%
                        <g:link action="edit" id="${book.id}" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></g:link>
                        <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>
                    </td>
                </tr>
            </g:each>
            </tbody>
            %{--<tbody>--}%
            %{--<tr>--}%
                %{--<td>1</td>--}%
                %{--<td><a href="#"><img src="/examples/images/avatar/1.jpg" class="avatar" alt="Avatar"> Michael Holz</a></td>--}%
                %{--<td>04/10/2013</td>--}%
                %{--<td>Admin</td>--}%
                %{--<td><span class="status text-success">&bull;</span> Active</td>--}%
                %{--<td>--}%
                    %{--<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>--}%
                    %{--<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>--}%
                %{--</td>--}%
            %{--</tr>--}%
            %{--<tr>--}%
                %{--<td>2</td>--}%
                %{--<td><a href="#"><img src="/examples/images/avatar/2.jpg" class="avatar" alt="Avatar"> Paula Wilson</a></td>--}%
                %{--<td>05/08/2014</td>--}%
                %{--<td>Publisher</td>--}%
                %{--<td><span class="status text-success">&bull;</span> Active</td>--}%
                %{--<td>--}%
                    %{--<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>--}%
                    %{--<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>--}%
                %{--</td>--}%
            %{--</tr>--}%
            %{--<tr>--}%
                %{--<td>3</td>--}%
                %{--<td><a href="#"><img src="/examples/images/avatar/3.jpg" class="avatar" alt="Avatar"> Antonio Moreno</a></td>--}%
                %{--<td>11/05/2015</td>--}%
                %{--<td>Publisher</td>--}%
                %{--<td><span class="status text-danger">&bull;</span> Suspended</td>--}%
                %{--<td>--}%
                    %{--<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>--}%
                    %{--<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>--}%
                %{--</td>--}%
            %{--</tr>--}%
            %{--<tr>--}%
                %{--<td>4</td>--}%
                %{--<td><a href="#"><img src="/examples/images/avatar/4.jpg" class="avatar" alt="Avatar"> Mary Saveley</a></td>--}%
                %{--<td>06/09/2016</td>--}%
                %{--<td>Reviewer</td>--}%
                %{--<td><span class="status text-success">&bull;</span> Active</td>--}%
                %{--<td>--}%
                    %{--<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>--}%
                    %{--<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>--}%
                %{--</td>--}%
            %{--</tr>--}%
            %{--<tr>--}%
                %{--<td>5</td>--}%
                %{--<td><a href="#"><img src="/examples/images/avatar/5.jpg" class="avatar" alt="Avatar"> Martin Sommer</a></td>--}%
                %{--<td>12/08/2017</td>--}%
                %{--<td>Moderator</td>--}%
                %{--<td><span class="status text-warning">&bull;</span> Inactive</td>--}%
                %{--<td>--}%
                    %{--<a href="#" class="settings" title="Settings" data-toggle="tooltip"><i class="material-icons">&#xE8B8;</i></a>--}%
                    %{--<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE5C9;</i></a>--}%
                %{--</td>--}%
            %{--</tr>--}%
            %{--</tbody>--}%
        </table>
        <div class="clearfix">
            %{--<div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>--}%
            %{--<ul class="pagination">--}%
                <g:paginate total="${bookCount ?: 0}" />
                %{--<li class="page-item disabled"><a href="#">Previous</a></li>--}%
                %{--<li class="page-item"><a href="#" class="page-link">1</a></li>--}%
                %{--<li class="page-item"><a href="#" class="page-link">2</a></li>--}%
                %{--<li class="page-item active"><a href="#" class="page-link">3</a></li>--}%
                %{--<li class="page-item"><a href="#" class="page-link">4</a></li>--}%
                %{--<li class="page-item"><a href="#" class="page-link">5</a></li>--}%
                %{--<li class="page-item"><a href="#" class="page-link">Next</a></li>--}%
            %{--</ul>--}%
        </div>
    </div>
</div>
</body>
</html>