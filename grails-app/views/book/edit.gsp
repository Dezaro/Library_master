<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="edit.book.label"/></title>
</head>

<body>

<div class="nav text-color-blues" role="navigation">
    <h1><g:message code="edit.book.label"/></h1>
    <hr/>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${this.book}">
    <ul class="alert alert-danger" role="alert" style="list-style-type: none;">
        <g:eachError bean="${this.book}" var="error">
            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><span class="glyphicon glyphicon-exclamation-sign"></span> <g:message error="${error}"/></li>
        </g:eachError>
    </ul>
</g:hasErrors>

<div class="container-fluid custom-form">
    <div class="row">
        <div class="col-md-2">
        </div>

        <div class="col-md-8">
            <g:form class="comment-form-left" resource="${this.book}" method="PUT">
                <div class="form-group">
                    <label for="title_id" class="col-sm-4 control-label">
                        <g:message code="book.title.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="title" id="title_id" required
                               value="${book.title}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="isbn_id" class="col-sm-4 control-label">
                        ISBN <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="isbn" id="isbn_id" required value="${book.isbn}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="page_number_id" class="col-sm-4 control-label">
                        <g:message code="book.page.number.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <input type="number" class="form-control" name="pageNumber" id="page_number_id" required
                               value="${book.pageNumber}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="publishedDate" class="col-sm-4 control-label">
                        <g:message code="book.published.date.label"/>
                    </label>

                    <div class="col-sm-10">
                        %{--publish_date_id:date.struct--}%
                        %{--publish_date_id_day:28--}%
                        %{--publish_date_id_month:2--}%
                        %{--publish_date_id_year:2018--}%
                        %{--<input type="date" min="01-01-1800"  id="publish_date_id" name="publishedDate" class="form-control"--}%
                               %{--value="${book.publishedDate}"/>--}%
                        <g:datePicker name="publishedDate" precision="day" value="${book.publishedDate}"/>
                        <script>

                        </script>
                    </div>
                </div>

                <div class="form-group">
                    <label for="description_id" class="col-sm-4 control-label">
                        <g:message code="book.description.label"/>
                    </label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="description" id="description_id"
                               value="${book.description}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="publisher_id" class="col-sm-4 control-label">
                        <g:message code="book.publisher.label"/>
                    </label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="publisher" id="publisher_id"
                               value="${book.publisher}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="cover_id" class="col-sm-4 control-label">
                        <g:message code="book.cover.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <select class="form-control" name="cover" id="cover_id" required>
                            <option value="${book.cover}">${book.cover}</option>
                            <g:each var="inList" in="${['Soft', 'Hard']}">
                                <g:if test="${book.cover != inList}">
                                    <option value="${inList}">${inList}</option>
                                </g:if>
                            </g:each>
                        </select>
                        %{--<g:select name="cover" from="${coverInList}" value="${book.cover}" ></g:select>--}%
                        %{--<g:select name="cover" from="${['Soft', 'Hard']}" value="${book.cover}" ></g:select>--}%
                    </div>
                </div>

                <div class="form-group">
                    <label for="picture_url_id" class="col-sm-4 control-label">
                        <g:message code="book.picture.label"/> Url
                    </label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="pictureUrl" id="picture_url_id"
                               value="${book.pictureUrl}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="category_id" class="col-sm-4 control-label">
                        <g:message code="book.category.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <select class="form-control" name="category" id="category_id" required>
                            <option value="${library.items.Category.findByCategoryName(book.category).id}">${book.category}</option>
                            <g:each var="category" in="${library.items.Category.getAll()}">
                                <g:if test="${!book.category.toString().equals(category.categoryName.toString())}">
                                    <option value="${category.id}">${category.categoryName}</option>
                                </g:if>
                            </g:each>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="author_id" class="col-sm-4 control-label">
                        <g:message code="book.author.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <select class="form-control" name="author" id="author_id" required>
                            <option value="${library.items.Author.findByAuthorName(book.author).id}">${book.author}</option>
                            <g:each var="author" in="${library.items.Author.getAll()}">
                                <g:if test="${!book.author.toString().equals(author.authorName.toString())}">
                                    <option value="${author.id}">${author.authorName}</option>
                                </g:if>
                            </g:each>
                        </select>
                    </div>
                </div>


                <div class="form-group" style="margin-top: 15px;">
                    <div class="col-sm-3"></div>

                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-primary" style="margin-top: 15px;margin-bottom: 15px;">
                            <span class="fa fa-lg fa-edit"></span> <g:message code="edit.button"/>
                        </button>
                    </div>

                    <div class="col-sm-4"></div>
                </div>
            </g:form>
        </div>

        %{--<div class="col-md-2">--}%
        %{--</div>--}%
    </div>
</div>

</body>
</html>
