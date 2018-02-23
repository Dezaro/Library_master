<div id="card-template-${book?.id}" class="item poster card">
    <div class="image_content">
        <g:link controller="book" action="show" id="${book.id}"><img class="poster fade1 lazyloaded"
                                                   src="${book?.pictureUrl}"></g:link>

    </div>

    <div class="info">
        <div class="row">
            <div class="col-md-9">
                <h3 class="title">${book?.title}</h3>
            </div>

            <div class="col-md-3">
                <span class="vote_average pull-right">6.4 <span
                        class="glyphicon glyphicon-star"></span></span>
            </div>
        </div>
        <p class="genres pull-right" style="font-style: italic; font-weight: bold">${book?.author.authorName}</p>

        <p class="genres pull-right" style="font-style: italic;">${book?.category.categoryName}</p>

        <p class="meta flex">
            <span class="release_date"><span
                    class="glyphicons glyphicons-calendar x1"></span><g:formatDate format="yyyy" date="${book?.publishedDate}"/></span>

        </p>

        <p class="overview">${book?.description}</p>
    </div>
</div>