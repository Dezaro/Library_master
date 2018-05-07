<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'readerCard.label', default: 'ReaderCard')}" />
        <title><g:message code="readerCard.create.label"/></title>
    </head>
    <body>

    <div class="nav text-color-blues" role="navigation">
        <h1><g:message code="readerCard.create.label"/></h1>
        <hr/>
    </div>

    <g:if test="${flash.message}">
        <div class="alert alert-info" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.readerCard}">
        <ul class="alert alert-danger" role="alert" style="list-style-type: none;">
            <g:eachError bean="${this.readerCard}" var="error">
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
                <g:form class="comment-form-left" name="createReaderCardForm" resource="${this.readerCard}" method="POST">
                    <div class="form-group">
                        <label for="card_number_id" class="col-sm-4 control-label">
                            <g:message code="readerCard.number.label"/> <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="cardNumber" id="card_number_id" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="reader_names_id" class="col-sm-4 control-label">
                            <g:message code="readerCard.reader.names.label"/><span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="readerNames" id="reader_names_id" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="person_number_id" class="col-sm-4 control-label">
                            <g:message code="readerCard.person.number.label"/>
                        </label>

                        <div class="col-sm-10">
                            <input type="number" class="form-control" name="personNumber" id="person_number_id"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="phone_id" class="col-sm-4 control-label">
                            <g:message code="readerCard.phone.label"/> <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="phone" id="phone_id" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="registerDate" class="col-sm-4 control-label">
                            <g:message code="readerCard.register.date.label"/><span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <g:datePicker name="registerDate" precision="day"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="email_id" class="col-sm-4 control-label">
                            Email <span class="red-star">*</span>
                        </label>

                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email_id" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="address_id" class="col-sm-4 control-label">
                            <g:message code="readerCard.address.label"/>
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="address" id="address_id"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="isActive" class="col-sm-4 control-label">
                            <g:message code="readerCard.isActive.label"/>
                        </label>

                        <div class="col-sm-10">
                            <g:checkBox name="isActive" value="${true}" />
                        </div>
                    </div>

                    <div class="form-group" style="margin-top: 15px;">
                        <div class="col-sm-3"></div>

                        <div class="col-sm-4">
                            <button id="#createBtn" type="submit" class="btn btn-success"
                                    style="margin-top: 15px;margin-bottom: 15px;">
                                <span class="fa fa-lg fa-plus-circle"></span> <g:message code="create.button"/></button>
                        </div>

                        <div class="col-sm-4"></div>
                    </div>
                </g:form>
            </div>

        </div>
    </div>

    </body>
</html>
