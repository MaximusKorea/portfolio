<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/animate.css"/>
<link href="css/shop-homepage.css" rel="stylesheet">
<script src="js/tooltip.js"></script>


<script>
	<!-- MOVIE -->
    addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    <!-- MOVIE -->
    
    <!-- REVIEW -->
    $(function () {
        var ratingE = $('[name="rev_rating"]');

        ratingE.each(function () {
            var rating = $(this).val();
            $(this).parent().find('#star' + rating).addClass('enable');
            $(this).parent().find('#star' + rating).prevAll().addClass('enable');
        });
    })
    <!-- REVIEW -->
</script>

<style>
	<!-- MOVIE -->
    .movie_image1 {
        margin: auto;
    }

    .tooltip.bottom .tooltip-inner {
        background-color:red;
    }
    
    .tooltip.bottom .tooltip-arrow {
        border-bottom-color: red;
    }
    <!-- MOVIE -->
    
    
    
    <!-- REVIEW -->        
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
    <!-- REVIEW -->
</style>



<!-- MOVIE -->
<div class="content">
    <div class="movie_top">
        <div class="col-md-3 movie_box">
            <div>
                <div class="movie_image1">
                    <img src="${movie.mv_image}" class="img-responsive" alt=""/>
                </div>
                <form action="" class="sky-form">
                    <fieldset></fieldset>
                </form>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="desc1 col-md-9">
            <p class="movie_option">
                <strong> <font size="6">${movie.mv_name}</font></strong> 
                <font color="#ff000030" size="2"> 예매율 : ${movie.mv_reserveRate}%</font>
            </p>
            <p class="movie_option">
                <strong>감독 : ${movie.mv_director}<br/></strong>
            </p>
            <p class="movie_option">
                <strong>배우 : ${movie.mv_actor}<br/> </strong>
            </p>
            <p class="movie_option">
                <strong>장르 : ${movie.mv_genre} (${movie.mv_runTime}분)</strong>
            </p>
            <p class="movie_option">
                <strong>등급 : ${movie.mv_age}이용가, ${movie.mv_state}</strong>
            </p>
            <p class="movie_option">
                <strong>개봉일 : ${movie.mv_date.toLocaleString().replaceFirst("오전 12:00:00","")}</strong>
            </p>
            <br/>
            <div class="down_btn">
            	<c:choose>
					<c:when test="${count > 0}">
					    <a class="btn1" href="movie_orders?mv_no=${movie.mv_no}"><span> </span>예매하기</a>
					</c:when>
					<c:when test="${count == 0}">
					    <a class="btn2"><span> </span>상영중지</a>
					</c:when>
				</c:choose>
                <c:choose>
					<c:when test="${sessionScope['Smember'] ne null }">
	                	<a class="btn1" href="review_writeForm?mv_no=${movie.mv_no}"><span> </span>리뷰작성</a>
	                </c:when>
				</c:choose>
            </div>
        </div>
        
        <div class="clearfix"></div>
                
        <p class="m_4">${movie.mv_info}</p>
		
        <script type="text/javascript" src="js/jquery.flexisel.js"></script>
        <script type="text/javascript">
            $(window).load(function () {
                $("#flexiselDemo3").flexisel({
                    visibleItems: 2,
                    animationSpeed: 1000,
                    autoPlay: true,
                    autoPlaySpeed: 3000,
                    pauseOnHover: true,
                    enableResponsiveBreakpoints: true
                });
            });
        </script>

        <form method="post" action="contact-post.html">
            <div class="clearfix"></div>
        </form>
    </div>
    <div class="clearfix"></div>
</div>
<!-- MOVIE -->




<!-- REVIEW -->
<div class="content">
    <div class="container1">
        <div class="row">        			
			<c:forEach var="review" items="${reviewMvNo}" varStatus="st">
				<c:if test="${st.index % 3 == 0}">
				<div class="row">
				</c:if>					
				<div class="col-sm-4 col-lg-4 col-md-4">
                     <div class="thumbnail">
                         <div>
							<img width=10% src="images/heart.png" alt="" style="margin:-10px; position: absolute; z-index: 2; width: 10%;"/>
                         </div>
                         <div class="movie_image col-md-6">
                             <img src="${movie.mv_image}"/>
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
								<c:choose>
									<c:when test="${sessionScope['Smember'] ne null && m_no eq review.m_no}">
										<span class="modify" style="float: right ;"><a href="review_delete?rev_no=${review.rev_no}">삭제</a></span>
									</c:when>
								</c:choose>
							</div>

							<%-- <h5><strong>${Smember.m_id}</strong>&nbsp;님</h5> --%>
							<h5><strong></strong></h5>
                             
							<a href="review_view?rev_no=${review.rev_no}"><h5><strong>${review.rev_title}</strong></h5></a>

							<div id="contents">${review.rev_content}
							<br/><br/><br/>
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
    <div class="clearfix"></div>
</div>
<!-- REVIEW -->