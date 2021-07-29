<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
</head>

<style>
	#star span {
		width: 30px;
		height: 30px;
		margin-left: 0;
		margin-right: 0;
		padding-left: 0;
		padding-right: 0;
		font-size: 25px;
	}

	#star i {
		height: 30px;
		line-height: 30px;
	}

	#star .fa-star-o {
		color: darkgray;
	}

	#star .fa-star {
		text-shadow: 3px 3px 3px rgba(150, 150, 150, 1);
		color: #ebc600;
		opacity: 0;
	}

	#star .hover .fa-star {
		opacity: 0.5;
	}

	#star .enable .fa-star {
		opacity: 1;
	}

	.btn1 {
		cursor: pointer;
	}
</style>


<script type="text/javascript">
	function modify(){
		f.action="review_modify";	
		f.submit();
	}
	
	$(function () {
		$('#star > span').mouseenter(function () {
			$(this).addClass('hover');
			$(this).prevAll().addClass('hover');
		});
	
		$('#star > span').mouseleave(function () {
			$('#star > span').removeClass('hover');
		});
	
		$('#star > span').on('click', function () {
			$('#star > span').removeClass('enable');
			$(this).addClass('enable');
			$(this).prevAll().addClass('enable');
			var rating = $(this).attr('id').replace('star', '');
			$('[name="rev_rating"]').val(rating);
		});
	});
	
	$(function () {
		var ratingE = $('[name="rev_rating"]');
		ratingE.each(function () {
			var rating = $(this).val();
			$(this).parent().find('#star' + rating).addClass('enable');
			$(this).parent().find('#star' + rating).prevAll().addClass('enable');
		});
	})
</script>

<div class="container">
	<div class="container1">
	    <div class="row">
	        <div class="col-md-12">
	            <div class="well well-sm">
	                <form name="f" class="form-horizontal" method="post">
	                    <fieldset>
	                        <strong><legend class="text-center header">REVIEW VIEW</legend></strong>                     
	                        <div class="col-md-3" style="padding-left: 100px">
	                        	<img width="195px" src="${review.mv_image}" />
	                        </div>
	                        <input type="text" name="rev_no" value="${review.rev_no}" hidden="true">
	                        <div class="col-md-9">
		                        <div class="form-group">
		                            <span class="col-md-2 text-center"><i class="fa fa-calendar-check-o bigicon"></i></span>
		                            <div class="col-md-10">
		                                <input readonly="readonly" id="fname" name="rev_date" value="${review.rev_date.toLocaleString().replaceFirst('오전 12:00:00','')}" type="text" class="form-control">	                            		                            	
		                            </div>
		                        </div>
		                        <div class="form-group">
		                            <span class="col-md-2 text-center"><i class="fa fa-user bigicon"></i></span>
		                            <div class="col-md-10">
		                                <input readonly="readonly" id="lname" name="m_id" value="${review.m_id}" type="text" class="form-control">
		                            </div>
		                        </div>
								<div class="form-group">
		                            <span class="col-md-2 text-center"><i class="fa fa-list bigicon"></i></span>
		                            <div class="col-md-10">
		                                <input id="rev_title" name="rev_title" value="${review.rev_title}" type="text" class="form-control">
		                            </div>
		                        </div>
								<div class="form-group">
									<span class="col-md-2 text-center"><i class="fa fa-star-o bigicon"></i></span>
									<input type="hidden" name="rev_rating" value="${review.rev_rating}"/>
									<div id="star" class="col-md-10">
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
								</div>
		                        <div class="form-group">
									<span class="col-md-2 text-center"><i class="fa fa-pencil-square-o bigicon"></i></span>
									<div class="col-md-10">
										<textarea class="form-control" id="message" name="rev_content" rows="7">${review.rev_content}</textarea>	                                
		                            </div>
		                        </div>
		                        <div class="down_btn6">
		                            <div class="col-md-12 text-center">
		                                <a class="btn1 col-md-3" href="review_list"><span> </span>목록으로</a>
		                                <c:choose>
											<%-- <c:when test="${sessionScope['Smember'] ne null}"> --%>
											<c:when test="${m_id eq review.m_id }">
												<a class="btn1 col-md-3" onclick="modify()"><span> </span>수정하기</a>
							                </c:when>
										</c:choose>
		                       		 </div>
		                        </div>
	                        </div>
	                    </fieldset>
	                </form>
	            </div>
	        </div>
	    </div>
	</div> 
</div>

<style>
    .header {
        color: #36A0FF;
        font-size: 27px;
        padding: 10px;
    }

    .bigicon {
        font-size: 35px;
        color: #36A0FF;
    }
</style>