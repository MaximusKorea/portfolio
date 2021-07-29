<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="css/reset.css?t=20170411">
<link rel="stylesheet" type="text/css" href="css/common.css?t=20170719001">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script> var st_date = new Date().toISOString().substr(0, 10).replace('T', ' '); </script>
<style>
	/* Tab */
	.tab-menu li:first-child {
		padding-left: 20px;
    	background: url(https://img.cgv.co.kr/R2014/images/sprite/sprite_corner.png) 0 -20px no-repeat;
	}
	.tab-menu li {
	    display: inline-block;
	    margin-left: -4px;
	}
	.tab-menu li:first-child a {
	    background: #e71a0f;
	}
	.tab-menu li a {
	    display: inline-block;
	    position: relative;
	    height: 39px;
	    padding: 0 15px;
	    background: #e71a0f url(https://img.cgv.co.kr/R2014/images/common/bg/bg_tebmenu-line.gif) 0 12px no-repeat;
	    color: #ffffff;
	    font-size: 15px;
	    font-weight: 500;
	    text-align: center;
	    line-height: 39px;
	    text-decoration: none;
	}
	.tab-menu .last {
	    padding-right: 19px;
	    background: url(https://img.cgv.co.kr/R2014/images/common/bg/ribon_right.png) right 0 no-repeat;
	}
	.sect-event > ul {
		display: flex;
		justify-content: center;
		width: 1100px;
		text-align: center;
		margin-left: auto;
  		margin-right: auto;
  		padding-bottom: 25px;
		border-bottom: 3px solid black;
	}
	[data-cat="test2"] > ul,
	[data-cat="test3"] > ul {
		display: flex;
		justify-content: center;
		width: 1100px;
		text-align: center;
		margin-left: auto;
  		margin-right: auto;
  		padding-bottom: 5px;
  		border-bottom: 0px solid black;
	}
	
	
	/* Banner */
	.cols-banner {
		overflow: hidden;
		display: flex;
		justify-content: center;
	}
	.cols-banner .col-ad, .cols-banner .col-hd, .cols-banner .col-collage {
	    float: left;
	}
	.cols-banner .box-com {
		/*
		width: 228px;
	    height: 261px;
		*/
	    padding: 3px;
	    border: 3px solid #241d1e;
	}
	.cols-banner .box-com .box-inner {
	    width: 226px;
	    height: 259px;
	    border: 1px solid #241d1e;
	    text-align: center;
	}
	.cols-banner .box-com .box-inner iframe, .cols-banner .box-com .box-inner a {
	    display: block;
	    width: 226px;
	    height: 259px;
	}
	.cols-banner .col-hd {
	    position: relative;
	    width: 486px;
	    height: 273px;
	    margin: 0 7px;
	}
</style>


<!-- Tab -->
<div class="content"  style="background: none;">
    <div class="box_1">
        <h3 style="background:url(https://img.cgv.co.kr/R2014/images/common/bg/bg_h3_line.jpg) repeat-x 0 50%; margin: 5px 297px 5px; line-height: 41px; text-align: center; font-weight: 500;">
        	<img src="https://img.cgv.co.kr/R2014/images/title/h3_event.gif" alt="EVENT" style="padding: 0 8px; background-color: #fdfcf0;">
        </h3>
        <div class="clearfix"></div>
    </div>
</div>

<ul id="tabCategory" class="tab-menu" style="list-style: none; clear: both; text-align: center;">
	<li class="on"><a href="#" id="on" data-filter="test1" title="현재 선택됨">CGV스페셜</a></li>
	<li><a href="#" data-filter="test2">영화/예매</a></li>
	<li><a href="#" data-filter="test3">CGV아트하우스</a></li>
	<li><a href="#" data-filter="test4">제휴/할인</a></li>
	<li class="last"><a href="#" data-filter="test5">멤버십</a></li>
</ul>
<br><br>
<div class="sect-event" data-cat="test1">
	<ul>
		<li>
			<a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=31811">
				<img src="https://img.cgv.co.kr/Front/Main/2021/0330/16170705205160.jpg" alt="시그니처 K">
			</a>
		</li>
		<li>
			<a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=30445">
				<img src="https://img.cgv.co.kr/Front/Main/2020/1222/16086237963730.jpg" alt="IMAX Island">
			</a>
		</li>
		<li>
			<a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=31343&amp;menu=001">
				<img src="https://img.cgv.co.kr/Front/Main/2021/0106/16099033996280.jpg" alt="별관">
			</a>
		</li>
	</ul>
</div>
<div class="sect-event" data-cat="test2">
	<ul>
	</ul>
</div>
<div class="sect-event" data-cat="test3">
	<ul>
	</ul>
</div>
<div class="sect-event" data-cat="test4">
	<ul>
		<li>
			<a href="http://www.cgv.co.kr/culture-event/event/detail-view.aspx?idx=20635&menu=4">
				<img src="https://img.cgv.co.kr/Front/Main/2020/1231/16093946547390.jpg" alt="KT 멤버십">
			</a>
		</li>
		<li>
			<a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=30002&menu=006">
				<img src="https://img.cgv.co.kr/Front/Main/2020/1223/16087026751200.jpg" alt="마이신한포인트">
			</a>
		</li>
	</ul>
</div>
<div class="sect-event" data-cat="test5">
	<ul>
		<li>
			<a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=31372">
				<img src="https://img.cgv.co.kr/Front/Main/2020/1222/16086268926890.jpg" alt="VIP 원데이 프리패스">
			</a>
		</li>
	</ul>
</div>
<br><br>

<!-- Banner -->
<div class="cols-banner">
	<div class="col-ad">
		<div class="box-com">
		    <div class="box-inner">
                <a href="http://www.cgv.co.kr/culture-event/popcorn-store/store-category.aspx?CategoryIdx=3"><img src="https://img.cgv.co.kr/Front/Main/2020/1130/16067181584930.jpg" alt="기프트카드"></a>
            </div>
		</div>
	</div>
	<div class="col-hd">
		<a href="http://www.cgv.co.kr/arthouse/"><img src="https://img.cgv.co.kr/R2014/images/main/main_moviecollage.jpg" alt="CGV ARTHOUSE, A Good Movie, A Better Life"></a>
	</div>
	<div class="col-collage">
		<div class="box-com">
		    <div id="Branding_R" class="box-inner">
                <iframe src="https://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/main@Branding" width="226" height="259" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="Branding" id="Branding"></iframe>    
            </div>
		</div>
	</div>
</div>
<br><br>