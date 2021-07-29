<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="css/shop-homepage.css" rel="stylesheet">
<style>
    .col-md-4 {
        padding-left: 5px;
        padding-right: 5px;
    }
    
    .thumbnail {
        height: 220px;
    }
    
    .movie_image {
        height: 210px;
        padding-left: 5px;
        padding-right: 5px;
    }
    
    .movie_image::before {
        content: ' ';
        display: inline-block;
        vertical-align: middle;
        height: 100%;
    }
    
    .movie_image img {
        display: inline-block;
        vertical-align: middle;
        width: 90%;
        max-height: 210px;
        padding-top: 5px;
    }

    .review #contents {
        overflow-x: hidden;
        overflow-y: auto;
        line-height: 20px;
        height: 125px;
    }

    .review {
        height: 100%;
        overflow: hidden;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 0;
    }

    #star span {
        width: 20px;
        height: 20px;
        margin-left: 0;
        margin-right: 0;
        padding-left: 0;
        padding-right: 0;
        margin-bottom: 10px;
        font-size: 20px;
    }

    #star .modify {
        font-size: 13px;
        width: auto;
    }

    #star .modify a:hover {
        text-decoration: none;
    }

    #star i {
        height: 20px;
        line-height: 20px;
    }

    #star .fa-star-o {
        color: darkgray;
    }

    #star .fa-star {
        text-shadow: 3px 3px 3px rgba(150, 150, 150, 1);
        color: #ebc600;
        opacity: 0;
    }

    #star .enable .fa-star {
        opacity: 1;
    }
</style>

<script>
    $(function () {
        var ratingE = $('[name="rev_rating"]');
        ratingE.each(function () {
            var rating = $(this).val();
            $(this).parent().find('#star' + rating).addClass('enable');
            $(this).parent().find('#star' + rating).prevAll().addClass('enable');
        });
    })
</script>

<div class="content">
    <div class="container1">
        <div class="row">
            <div class="col-md-12">
                <div class="row carousel-holder">
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
								<c:forEach var="movie" items="${movieList.list}" varStatus="status">
									<c:if test="${status.index eq 0}">
										<li data-target="#carousel-example-generic" data-slide-to="${status.index}" class="active"></li>
									</c:if>
									<c:if test="${status.index ne 0}">
										<li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
									</c:if>
								</c:forEach>
                            </ol>  
                            <a href="movie_list?pageno=1">
	                            <div class="carousel-inner">
	                            	<c:forEach var="movie" items="${movieList.list}" varStatus="status">
		                             	<c:if test="${status.index eq 0}">
			                             	<div class="item active" >                                	                                	
			                                   	<img class="slide-image" src="${movie.mv_image}" alt="">                                    
			                                </div>
		                                </c:if>
		                             	<c:if test="${status.index ne 0}">
			                             	<div class="item" >                                	                                	
			                                   	<img class="slide-image" src="${movie.mv_image}" alt="">                                    
			                                </div>
		                                </c:if>
	                                </c:forEach>
	                            </div>
                            </a>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                </div>
                <c:forEach var="review" items="${selectListAll}" varStatus="st">
                    <c:if test="${st.index % 3 == 0}">
					<div class="row">
                    </c:if>
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <div>
								<img width=10% src="images/heart.png" alt="" style="margin:-10px; position: absolute; z-index: 2; width: 10%;"/>
                            </div>
                            <div class="movie_image col-md-6">
                               <img src="${review.mv_image}"/>
                            </div>
                            <div class="review col-md-6">
                                <input type="hidden" name="rev_rating" value="${review.rev_rating}"/>
                                <div id="star">
                                    <span id="star1" class="fa-stack">
                                        <i class="fa fa-star-o fa-stack-1x"></i>
                                        <i class="fa fa-star fa-stack-1x"></i>
                                    </span>
                                    <span id="star2" class="fa-stack">
                                        <i class="fa fa-star-o fa-stack-1x"></i>
                                        <i class="fa fa-star fa-stack-1x"></i>
                                    </span>
                                    <span id="star3" class="fa-stack">
                                        <i class="fa fa-star-o fa-stack-1x"></i>
                                        <i class="fa fa-star fa-stack-1x"></i>
                                    </span>
                                    <span id="star4" class="fa-stack">
                                        <i class="fa fa-star-o fa-stack-1x"></i>
                                        <i class="fa fa-star fa-stack-1x"></i>
                                    </span>
                                    <span id="star5" class="fa-stack">
                                        <i class="fa fa-star-o fa-stack-1x"></i>
                                        <i class="fa fa-star fa-stack-1x"></i>
                                    </span>
                                </div>
                                <a href="review_view?rev_no=${review.rev_no}"><h5><strong>${review.rev_title}</strong></h5></a>
                                <div id="contents">${review.rev_content}
									<br/><br/><br/><br/><br/>
                                	<div><h5 style="float: right; margin-bottom: 0; padding-top: 5px;" >${review.rev_date.toLocaleString().replaceFirst('오전 12:00:00','')}</h5></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${st.index % 3 == 2}">
					</div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
</div>
<script src="js/bootstrap.min.js"></script>