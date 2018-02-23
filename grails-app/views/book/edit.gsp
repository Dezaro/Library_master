<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>

%{--<a href="#edit-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label"--}%
                                                           %{--default="Skip to content&hellip;"/></a>--}%

%{--<div class="nav" role="navigation">--}%
    %{--<ul>--}%
        %{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
        %{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>--}%
        %{--<li><g:link class="create" action="create"><g:message code="default.new.label"--}%
                                                              %{--args="[entityName]"/></g:link></li>--}%
    %{--</ul>--}%
%{--</div>--}%

%{--<div id="edit-book" class="content scaffold-edit" role="main">--}%
    %{--<h1><g:message code="default.edit.label" args="[entityName]"/></h1>--}%
    %{--<g:if test="${flash.message}">--}%
        %{--<div class="message" role="status">${flash.message}</div>--}%
    %{--</g:if>--}%
    %{--<g:hasErrors bean="${this.book}">--}%
        %{--<ul class="errors" role="alert">--}%
            %{--<g:eachError bean="${this.book}" var="error">--}%
                %{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message--}%
                        %{--error="${error}"/></li>--}%
            %{--</g:eachError>--}%
        %{--</ul>--}%
    %{--</g:hasErrors>--}%
    %{--<g:form resource="${this.book}" method="PUT">--}%
        %{--<g:hiddenField name="version" value="${this.book?.version}"/>--}%
        %{--<fieldset class="form">--}%
            %{--<f:all bean="book"/>--}%
        %{--</fieldset>--}%
        %{--<fieldset class="buttons">--}%
            %{--<input class="save" type="submit"--}%
                   %{--value="${message(code: 'default.button.update.label', default: 'Update')}"/>--}%
        %{--</fieldset>--}%
    %{--</g:form>--}%
%{--</div>--}%

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <form class="form-horizontal" role="form" action="/book/save" method="POST">
                <div class="form-group">
                    <label for="title_id" class="col-sm-2 control-label">
                       Title <span class="red-star">*</span>
                    </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="title" id="title_id" required value="${book.title}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="isbn_id" class="col-sm-2 control-label">
                        ISBN <span class="red-star">*</span>
                    </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="isbn" id="isbn_id" required value="${book.isbn}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="page_number_id" class="col-sm-2 control-label">
                        Page Number <span class="red-star">*</span>
                    </label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="pageNumber" id="page_number_id" required value="${book.pageNumber}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="publish_date_id" class="col-sm-2 control-label">
                        Published Date
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="publish_date_id" name="publishedDate" class="form-control" value="${book.publishedDate}" />
                        <script>
                            $('#publish_date_id').datepicker();
                        </script>
                    </div>
                </div>
                <div class="form-group">
                    <label for="description_id" class="col-sm-2 control-label">
                        Description
                    </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="description" id="description_id"  value="${book.description}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="publisher_id" class="col-sm-2 control-label">
                        Publisher
                    </label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="publisher" id="publisher_id"  value="${book.publisher}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="availability_id" class="col-sm-2 control-label">
                        Availability <span class="red-star">*</span>
                    </label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="availability" id="availability_id" required value="${book.availability}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="cover_id" class="col-sm-2 control-label">
                        Cover <span class="red-star">*</span>
                    </label>
                    <div class="col-sm-10">
                        %{--<select class="form-control" name="cover" id="cover_id" required>--}%
                            %{--<option value="${book.cover}">${book.cover}</option>--}%
    %{--<g:each var="l" in="${anInstance.constraints.cover.inList}">--}%
        %{--<option value="${l}">${l}</option>--}%
    %{--</g:each>--}%
    %{--<g:select name="book" from="${book.constraints.cover.inList}"--}%
              %{--value="${incidentInstance?.cover}"/>--}%
                            %{--<option value="+46">Sverige (+46)</option>--}%
                            %{--<option value="+45">Danmark (+45)</option>--}%
                        %{--</select>--}%
                        <g:select name="cover" from="${coverInList}" value="${book.cover}" ></g:select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="picture_url_id" class="col-sm-2 control-label">
                        Picture Url
                    </label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="pictureUrl" id="picture_url_id" value="${book.pictureUrl}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="category_id" class="col-sm-2 control-label">
                        Category <span class="red-star">*</span>
                    </label>
                    <div class="col-sm-10">
                        <select class="form-control" name="category" id="category_id" required>
                            <option value="${book.category}">${book.category}</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="author_id" class="col-sm-2 control-label">
                        author <span class="red-star">*</span>
                    </label>
                    <div class="col-sm-10">
                        %{--<g:select id="author_id" name="author" from="${book.constraints.cover.inList}" optionKey="value" value="${book.cover}" />--}%
                        <select class="form-control" name="author" id="author_id" required>
                            <option value="${book.author}">${book.author}</option>
                        </select>
                    </div>
                </div>
                

                <div class="form-group">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-primary">
                            <span class="fa fa-lg fa-edit"></span> Update
                        </button>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </form>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

</body>
</html>
