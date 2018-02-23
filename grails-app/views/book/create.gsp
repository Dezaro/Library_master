<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'book.label', default: 'Book')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<a href="#create-book" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-book" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${this.book}">
        <ul class="errors" role="alert">
            <g:eachError bean="${this.book}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form name="createBookForm" resource="${this.book}" method="POST">
        <fieldset class="form">
            <f:all bean="book"/>
        </fieldset>
        <fieldset class="buttons">
            <button id="#createBtn" type="button" onclick="submitForm()" class="btn btn-danger">Create</button>
            %{--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />--}%
        </fieldset>
    </g:form>
</div>

<script>
    function submitForm() {
        var authorSelect = document.getElementById("author"),
            author = authorSelect.options[authorSelect.selectedIndex].text,
            apiKey = "AIzaSyAeeTMNTGN5AHk2RH2DLWCY0xeS1mwmsDA",
            url = "https://www.googleapis.com/books/v1/volumes?q=" + document.getElementById('title').value + '+inauthor:' + author + "&maxResults=1&filter=ebooks&printType=books&projection=lite&key=" + apiKey;

        $.ajax({
            method: "GET",
            url: url,
            dataType: "json"
        }).done(function (response) {
            document.getElementById("pictureUrl").value = response.items[0].volumeInfo.imageLinks.thumbnail;
        }).fail(function () {
            console.log("Something went wrong!");
        }).always(function () {
            console.log("ОК!");
            console.log(document.getElementById("pictureUrl").value);
            console.log(document.getElementsByName("createBookForm")[0]);
            document.getElementsByName("createBookForm")[0].submit()
        });
    }
</script>
</body>
</html>
