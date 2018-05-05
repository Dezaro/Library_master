<%@ page import="library.items.BookItem" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'rentBook.label', default: 'RentBook')}"/>
    <title><g:message code="rentBook.edit.label"/></title>
</head>

<body>
<div class="nav text-color-blues" role="navigation">
    <h1><g:message code="rentBook.edit.label"/></h1>
    <hr/>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${this.rentBook}">
    <ul class="alert alert-danger" role="alert" style="list-style-type: none;">
        <g:eachError bean="${this.rentBook}" var="error">
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
            <g:form class="comment-form-left" resource="${this.rentBook}" method="PUT">
                <div class="form-group">
                    <label for="category_id" class="col-sm-4 control-label">
                        <g:message code="readerCard.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <select class="form-control" name="category" id="category_id" required>
                            <option value="${rentBook.readerCard.id}">${rentBook.readerCard} - No ${library.items.ReaderCard.findByReaderNames(rentBook.readerCard).cardNumber}</option>
                            <g:each var="readerCard" in="${library.items.ReaderCard.getAll()}">
                                <g:if test="${!rentBook.readerCard.toString().equals(readerCard.readerNames.toString())}">
                                    <option value="${readerCard.id}">${readerCard.readerNames} - No ${readerCard.cardNumber}</option>
                                </g:if>
                            </g:each>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="book_item_id" class="col-sm-4 control-label">
                        <g:message code="bookItem.label"/> <span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <select class="form-control" name="bookItem" id="book_item_id" required>
                            <option value="${rentBook.bookItem.id}">${library.items.Book.findById(library.items.BookItem.findByBookSerialNumber(rentBook.bookItem).book.id).title} - ${rentBook.bookItem}</option>
                            <g:each var="bookItem" in="${library.items.BookItem.getAll()}">
                                <g:if test="${!rentBook.bookItem.toString().equals(bookItem.bookSerialNumber.toString())}">
                                    <option value="${bookItem.id}">${library.items.Book.findById(bookItem.book.id).title} - ${bookItem.bookSerialNumber}</option>
                                </g:if>
                            </g:each>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="rentDate" class="col-sm-4 control-label">
                        <g:message code="book.rent.date.label"/>
                    </label>

                    <div class="col-sm-10">
                        %{--<input type="date" min="01-01-1800" id="rent_date_id" name="rentDate"--}%
                               %{--class="form-control"--}%
                               %{--value="${rentBook.rentDate}"/>--}%
                        <g:datePicker name="rentDate" precision="day" value="${rentBook.rentDate}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="returnBeforeDate" class="col-sm-4 control-label">
                        <g:message code="book.return.before.date.label"/>
                    </label>

                    <div class="col-sm-10">
                        %{--<input type="date" min="01-01-1800" id="return_before_date_id" name="rentDate"--}%
                               %{--class="form-control"--}%
                               %{--value="${rentBook.returnBeforeDate}"/>--}%
                        <g:datePicker name="returnBeforeDate" precision="day" value="${rentBook.returnBeforeDate}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label for="isReturn" class="col-sm-4 control-label">
                        <g:message code="book.isReturn.label"/>
                    </label>

                    <div class="col-sm-10">
                        <g:checkBox name="isReturn" value="${rentBook.isReturn}" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="returnDate" class="col-sm-4 control-label">
                        <g:message code="book.returnDate.label"/>
                    </label>

                    <div class="col-sm-10">
                        %{--<input type="date" min="01-01-1800" id="return_date_id" name="rentDate"--}%
                               %{--class="form-control"--}%
                               %{--value="${rentBook.returnDate}"/>--}%
                        <g:datePicker name="returnDate" precision="day" value="${rentBook.returnDate}"/>
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
