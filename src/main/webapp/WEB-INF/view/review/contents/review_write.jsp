<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.util.Calendar,  java.util.Date, java.text.SimpleDateFormat" %>
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
    function reviewWrite() {
        f.action = "review_write";
        f.submit();
    }
    
    function addLoadEvent(func) {
        var oldonload = window.onload;
        if (typeof window.onload != 'function') {
            window.onload = func;
        } else {
            window.onload = function () {
                if (oldonload) {
                    oldonload();
                }
                func();
            }
        }
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
    })
</script>

<div class="container">
    <div class="container1">
        <div class="row">
            <div class="col-md-12">
                <div class="well well-sm">
                    <form name="f" class="form-horizontal" method="post">
                        <fieldset>
                            <strong><legend class="text-center header">REVIEW WRITE</legend></strong>
                            <div class="col-md-1">&nbsp;</div>
                            <div class="col-md-3">
                                <img height="350px" name="mv_image" src="${movie.mv_image}" value="${movie.mv_image}"/>
                            </div>
                            <div class="col-md-7">
                                <div class="form-group">
									<span class="col-md-2 text-center"><i class="fa fa-user bigicon"></i></span>
                                    <div class="col-md-10">										
										<input id="fname" name="m_id" type="text" value="${Smember.m_id}" readonly="readonly" placeholder="글쓴이" class="form-control">
                                    </div>
                                </div>
								<input id="mv_name" name="mv_name" type="text" value="${movie.mv_name}" hidden="true">                                   	
								<input id="mv_no" name="mv_no" type="text" value="${movie.mv_no}" hidden="true">
								<input id="m_no" name="m_no" type="text" value="${Smember.m_no}" hidden="true">
                                <div class="form-group">
	                            	<span class="col-md-2 text-center"><i class="fa fa-list bigicon"></i></span>
	                            	<div class="col-md-10">
	                                	<input id="rev_title" name="rev_title" type="text" class="form-control">
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
                                        <textarea class="form-control" id="message" value="후기당!!!" name="rev_content" placeholder="후기를 남겨주세요*^^*" rows="7"></textarea>
                                    </div>
                                </div>
                                <div class="down_btn6">
                                    <div class="col-md-12 text-center">
                                        <a class="btn1 col-md-3" onclick="reviewWrite()"><span> </span>Submit</a>
                                        <a class="btn1 col-md-3" href="javascript:history.back()"><span> </span>Cancel</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1">&nbsp;</div>
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