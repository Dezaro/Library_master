<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="category.create.label"/></title>
</head>

<body>

<div class="nav text-color-blues" role="navigation">
    <h1><g:message code="category.create.label"/></h1>
    <hr/>
</div>

<g:if test="${flash.message}">
    <div class="alert alert-info" role="status">${flash.message}</div>
</g:if>
<g:hasErrors bean="${this.category}">
    <ul class="alert alert-danger" role="alert" style="list-style-type: none;">
        <g:eachError bean="${this.author}" var="error">
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
            <g:form class="comment-form-left" name="createCategoryForm" resource="${this.category}" method="POST">
                <div class="form-group">
                    <label for="category_name_id" class="col-sm-4 control-label">
                        <g:message code="category.name.label"/><span class="red-star">*</span>
                    </label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="categoryName" id="category_name_id" required/>
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
