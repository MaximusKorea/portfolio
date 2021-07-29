<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>${PAGE_TITLE}</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
<style type="text/css">
	/* float Banner */
	.sect-aside-banner {
		position: fixed;
		padding: 0px;
		margin: 0px;
		left: 1510px;
		z-index: 1;
		top: 260px;
	}
	.sect-aside-banner .aside-content-top {
	    padding-top: 10px;
	    background: url(https://img.cgv.co.kr/R2014/images/common/bg/bg_aside_banner_top.png) no-repeat 0 0;
	}
	.sect-aside-banner .aside-content-btm {
	    padding: 0 7px 10px;
	    background: url(https://img.cgv.co.kr/R2014/images/common/bg/bg_aside_banner_bottom.png) no-repeat 0 100%;
	}
	.sect-aside-banner > .btn-top > a {
	    width: 116px;
	    height: 72px;
	    background: url(https://img.cgv.co.kr/R2014/images/common/btn/btn_top.png) no-repeat 0 0;
	    display: block;
	}
	.sect-aside-banner > .btn-top > a > span {
	    visibility: hidden;
	}
	/* 
	body
	{
		background-position: top right 0px;
		background: url(https://img.cgv.co.kr/R2014/images/common/bg/bg_c_bricks.png) repeat-x 0 180px;
		background-size: 130px 524px;
	}
	*/
</style>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="js/responsiveslides.min.js"></script>
<script type="application/x-javascript">
	addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    }
</script>
<script>
 	$(function () {
        $("#slider").responsiveSlides({
            auto: true,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            pager: true,
        });
    });
 	
 	$(document).ready(function() {
 		//document.cookie = 'same-site-cookie=foo; SameSite=Lax';
		//document.cookie = 'cross-site-cookie=bar; SameSite=None; Secure';
		
 		// tab
		var sectEvent = $('.sect-event');
			sectEvent.hide();

		$('#tabCategory li a').click(function() {
			var tabType = $(this).data('filter');
			sectEvent.hide().filter(function() {
				return $(this).data('cat') === tabType;
			}).show();
			event.preventDefault ? event.preventDefault() : (event.returnValue = false);
		});
		
		// 플로팅(float) 배너
		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($("#floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
		$(window).scroll(function() {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";
			// 애니메이션 없이 바로 따라감
			/* $("#floatMenu").css('top', newPosition); */
			$("#floatMenu").stop().animate({
				"top": newPosition
			}, 0);
		}).scroll();
		
	});

	function golink(i) {
		if(${empty(Smember)}) {
			alert('로그인 해주세요');
			location.href="member_login";
		} else {
			location.href="menu?no="+i+"&pageno=1";
		}
	}
</script>
</head>
<body class="bo">
	<div class="container">
		<div class="container_wrap">
			<div class="header_top">
				<div class="col-sm-3 logo">
					<a href="index"><img src="http://img.cgv.co.kr/R2014/images/title/h1_cgv.png" alt="CGV" /></a>
				</div>
				<div class="col-sm-6 nav">
					<ul>
						<img src="http://img.cgv.co.kr/R2014/images/title/h2_movie.png" alt="MOVIE">
						</p>
					</ul>
					<br>
					<ul>
						<li>
							<span class="simptip-position-bottom simptip-movable" data-tooltip="NOTICE">
								<a href="board_list?pageno=1&board_type=Notice"></a>
							</span>
						</li>
						<li>
							<span class="simptip-position-bottom simptip-movable" data-tooltip="MOVIE">
								<a href="movie_list?pageno=1"></a>
							</span>
						</li>
						<li>
							<span class="simptip-position-bottom simptip-movable" data-tooltip="PRODUCT">
								<a href="product_list?p_type=1"></a>
							</span>
						</li>
						<li>
							<span class="simptip-position-bottom simptip-movable" data-tooltip="REVIEW">
								<a href="review_list"></a>
							</span>
						</li>
						<li>
							<span class="simptip-position-bottom simptip-movable" data-tooltip="GAME&SHOP">
								<a href="shop_list_choice?pageno=1"></a>
							</span>
						</li>
					</ul>
				</div>
				<div class="col-sm-3 header_right">
					<ul class="header_right_box">
						<c:if test="${empty(Smember) }">
							<li><p><a href="member_write">회원가입</a></p></li>
							<li><p><a href="member_login">로그인</a></p></li>
						</c:if>
						<c:if test="${!empty(Smember) }">
							<li><p><a href="board_list2?pageno=1&board_type=1:1">고객센터</a></p></li>
							<li><p><a href="member_mypage">마이페이지</a></p></li>
							<c:if test="${Smember.m_id eq 'admin' }">
								<li><p><a style="color: red;" href="manage">관리페이지</a></p></li>
							</c:if>
							<li><p><a href="member_logout">로그아웃</a></p></li>
							<br>
							<li><p><a href="#" style="color: blue;">[ ${Smember.m_name} ] 님 접속중</a></p></li>
							<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path'] }" />
							<c:if test="${path eq '/member_login_action' || path eq '/' || path eq '/main' || path eq '/index' }">
								<li><p><a href="#" style="color: green;">현재 포인트 : ${point}</a></p></li>
							</c:if>
						</c:if>
						<div class="clearfix"></div>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
			<jsp:include page="${CONTENT_PAGE}" />
		</div>
	</div>

	<jsp:include page="${CONTENT_PAGE_BANNER}" />

	<div class="container">
		<footer id="footer">
			<div id="footer-3d">
				<div class="gp-container">
					<span class="first-widget-bend"></span>
				</div>
			</div>
			<div id="footer-widgets" class="gp-footer-larger-first-col">
				<div class="gp-container">
					<div class="footer-widget footer-1">
						<div class="wpb_wrapper">
							<img src="images/f_logo.png" alt="" />
						</div>
						<br>
						<p>It is a long established fact that a reader will be
							distracted by the readable content of a page.</p>
						<p class="text">There are many variations of passages of Lorem
							Ipsum available, but the majority have suffered.</p>
					</div>
					<div class="footer_box">
						<div class="col_1_of_3 span_1_of_3">
							<h3>Categories</h3>
							<ul class="first">
								<li><a href="board_list?pageno=1&board_type=Notice">Notice</a></li>
								<li><a href="movie_list?pageno=1">Movie</a></li>
								<li><a href="product_list?p_type=1">Product</a></li>
								<li><a href="review_list">Review</a></li>
								<li><a href="shop_list_choice?pageno=1">Game&Shop</a></li>
							</ul>
						</div>
						<div class="col_1_of_3 span_1_of_3">
							<h3>Information</h3>
							<ul class="first">
								<li><a href="shop_list_choice?pageno=1">New products</a></li>
								<li><a href="main">top sellers</a></li>
								<li><a href="shop_list_choice?pageno=1">Specials</a></li>
							</ul>
						</div>
						<div class="col_1_of_3 span_1_of_3">
							<h3>Follow Us</h3>
							<ul class="first">
								<li><a href="https://www.facebook.com" target="_blank">Facebook</a></li>
								<li><a href="https://twitter.com" target="_blank">Twitter</a></li>
								<li><a href="https://www.youtube.com" target="_blank">Youtube</a></li>
							</ul>
							<div class="copy">
								<p>
									&copy; 2021 Template by <a href="http://w3layouts.com"
										target="_blank"> w3layouts</a>
								</p>
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</footer>
	</div>
	<!-- float banner -->
	<div id="ctl00_sect_person_right" class="sect-aside-banner">
		<a> </a>
		<div class="aside-content-top">
			<a> </a>
			<div class="aside-content-btm">
				<a> </a> <a href="movie_list?pageno=1"> <img
					src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_theater.gif"
					alt="CGV THEATER">
				</a> <a href="product_list?p_type=1"> <img
					src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_arthouse.gif"
					alt="CGV arthouse">
				</a> <a href="http://www.cgv.co.kr/theaters/special/"> <img
					src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_special.gif"
					alt="CGV SPECIAL">
				</a> <a href="#" onclick="golink(2);"> <img
					src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_ticket.gif"
					alt="CGV TICKET INFO">
				</a> <a href="http://www.cgv.co.kr/discount/discountlist.aspx"> <img
					src="https://img.cgv.co.kr/R2014/images/common/btn/btn_person_discount.gif"
					alt="CGV DISCOUNT INFO">
				</a>
			</div>
		</div>
		<div class="btn-top">
			<a href="#" onclick="window.scrollTo(0,0);return false;"><span>최상단으로 이동</span></a>
		</div>
	</div>
</body>
</html>