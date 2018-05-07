<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="create.book.label"/></title>
</head>

<body>

<div class="nav text-color-blues" role="navigation">
                    <h1><g:message code="create.book.label"/></h1>
                    <hr/>
                </div>

                <g:if test="${flash.message}">
                    <div class="alert alert-info" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${this.book}">
                    <ul class="alert alert-danger" role="alert" style="list-style-type: none;">
                        <g:eachError bean="${this.book}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><span
                                    class="glyphicon glyphicon-exclamation-sign"></span> <g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>

                <div class="container-fluid custom-form">
                    <div class="row">
                        <div class="col-xs-2">
                        </div>

                        <div class="col-xs-8">
                            <g:form class="comment-form-left" name="createBookForm" resource="${this.book}" method="POST">
                                <div class="form-group">
                                    <label for="title_id" class="col-sm-4 control-label">
                                        <g:message code="book.title.label"/> <span class="red-star">*</span>
                                    </label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="title" id="title_id" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="isbn_id" class="col-sm-4 control-label">
                                        ISBN <span class="red-star">*</span>
                                    </label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="isbn" id="isbn_id" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="page_number_id" class="col-sm-4 control-label">
                                        <g:message code="book.pageNumber.label"/> <span class="red-star">*</span>
                                    </label>

                                    <div class="col-sm-10">
                                        <input type="number" class="form-control" name="pageNumber" id="page_number_id" required/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="publish_date_id" class="col-sm-4 control-label">
                                        <g:message code="book.publishedDate.label"/>
                                    </label>

                                    <div class="col-sm-10">
                                        %{--<input type="date" id="publish_date_id" name="publishedDate" class="form-control"/>--}%
                                        <g:datePicker name="publishedDate" id="publish_date_id" precision="day"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="description_id" class="col-sm-4 control-label">
                                        <g:message code="book.description.label"/>
                                    </label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="description" id="description_id"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="publisher_id" class="col-sm-4 control-label">
                                        <g:message code="book.publisher.label"/>
                                    </label>

                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" name="publisher" id="publisher_id"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="cover_id" class="col-sm-4 control-label">
                                        <g:message code="book.cover.label"/> <span class="red-star">*</span>
                                    </label>

                                    <div class="col-sm-10">
                                        <select class="form-control" name="cover" id="cover_id" required>
                                            <g:each var="inList" in="${['Soft', 'Hard']}">
                                                <option value="${inList}">${inList}</option>
                                            </g:each>
                                        </select>
                                        %{--<g:select name="cover" from="${coverInList}" value="${book.cover}" ></g:select>--}%
                                        %{--<g:select name="cover" from="${['Soft', 'Hard']}" value="${book.cover}" ></g:select>--}%
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="picture_url_id" class="col-sm-4 control-label">
                                        <g:message code="book.pictureUrl.label"/> Url
                                    </label>

                                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="pictureUrl" id="picture_url_id"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="category_id" class="col-sm-4 control-label">
                        <g:message code="book.category.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <select class="form-control" name="category" id="category_id" required>
                            <g:each var="category" in="${library.items.Category.getAll()}">
                                <option value="${category.id}">${category.categoryName}</option>
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
                            <g:each var="author" in="${library.items.Author.getAll()}">
                                <option value="${author.id}">${author.authorName}</option>
                            </g:each>
                        </select>
                    </div>
                </div>


                <div class="form-group" style="margin-top: 15px;">
                    <div class="col-sm-3"></div>

                    <div class="col-sm-4">
                        %{--<button type="submit" class="btn btn-primary" style="margin-top: 15px;margin-bottom: 15px;">--}%
                        %{--<span class="fa fa-lg fa-edit"></span> Update--}%
                        %{--</button>--}%
                        <button id="#createBtn" type="button" class="btn btn-success" onclick="submitForm()"
                                style="margin-top: 15px;margin-bottom: 15px;">
                            <span class="fa fa-lg fa-plus-circle"></span> <g:message code="create.button"/></button>
                    </div>

                    <div class="col-sm-4"></div>
                </div>
            </g:form>
        </div>

        %{--<div class="col-xs-2">--}%
        %{--</div>--}%
    </div>
</div>

<script>
    function submitForm() {
        $('body').preloader();
        var authorSelect = document.getElementById("author_id"),
            author = authorSelect.options[authorSelect.selectedIndex].text,
            apiKey = "AIzaSyAeeTMNTGN5AHk2RH2DLWCY0xeS1mwmsDA",
            url = "https://www.googleapis.com/books/v1/volumes?q=" + document.getElementById('title_id').value + '+inauthor:' + author + "&maxResults=1&printType=books&projection=lite&key=" + apiKey;
        $.ajax({
            method: "GET",
            url: url,
            dataType: "json"
        }).done(function (response) {
            if (parseInt(response.totalItems) !== 0) {
                if (typeof response.items[0].volumeInfo.imageLinks !== 'undefined') {
                    document.getElementById("picture_url_id").value = response.items[0].volumeInfo.imageLinks.thumbnail;
                }
            }
        }).fail(function () {
            console.log("Something went wrong!");
        }).always(function () {
            document.getElementsByName("createBookForm")[0].submit();
//            $('body').preloader('remove');
        });
    }
</script>
</body>
</html>
