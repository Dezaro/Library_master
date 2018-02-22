<div id="card-template-${book?.id}" class="item poster card">
    <div class="image_content">
        <img class="poster fade lazyloaded"
             src="${book?.pictureUrl}">
    </div>

    <div class="info">
        <div class="row">
            <div class="col-md-9">
                <h4 class="title">${book?.title}</h4>
            </div>

            <div class="col-md-3">
                <span class="vote_average pull-right">6.4 <span
                        class="glyphicon glyphicon-star"></span></span>
            </div>
        </div>

        <p class="meta flex">
            <span class="release_date"><span
                    class="glyphicons glyphicons-calendar x1"></span> ${book?.publishedDate}</span>

        </p>

        <p class="genres pull-right" style="font-style: italic;">${book?.category.categoryName}</p>

        <p class="overview">${book?.description}</p>
    </div>
</div>