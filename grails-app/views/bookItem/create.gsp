<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bookItem.label', default: 'BookItem')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="nav text-color-blues" role="navigation">
        <h1>Book Item Create</h1>
        <hr/>
    </div>

    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.bookItem}">
        <ul class="alert alert-danger" role="alert" style="list-style-type: none;">
            <g:eachError bean="${this.bookItem}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><span
                        class="glyphicon glyphicon-exclamation-sign"></span> <g:message error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>

    <div class="container-fluid custom-form">
        <div class="row">
            <div class="col-md-2">
            </div>

            <div class="col-md-8">
                <g:form class="comment-form-left" name="createBookForm" resource="${this.bookItem}" method="POST">
                    <div class="form-group">
                        <label for="book_id" class="col-sm-4 control-label">
                            Book <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <select class="form-control" name="book" id="book_id" required>
                                <g:each var="book" in="${library.items.Book.getAll()}">
                                    <option value="${book.id}">${book.title}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="serial_number_id" class="col-sm-4 control-label">
                            Serial number <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="serialNumber" id="serial_number_id" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="isAvailable" class="col-sm-4 control-label">
                            Is Available
                        </label>

                        <div class="col-sm-10">
                            <g:checkBox name="isAvailable" value="${true}" />
                        </div>
                    </div>

                    <div class="form-group" style="margin-top: 15px;">
                        <div class="col-sm-3"></div>

                        <div class="col-sm-4">
                            <button id="#createBtn" type="submit" class="btn btn-success"
                                    style="margin-top: 15px;margin-bottom: 15px;">
                                <span class="fa fa-lg fa-plus-circle"></span> Create</button>
                        </div>

                        <div class="col-sm-4"></div>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
    </body>
</html>
