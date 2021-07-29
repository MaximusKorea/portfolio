<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	$(function() {
		$('#blockBtn').click(function() { location.href="shop_list?s_type=1"; })
		$('#gameBtn').click(function() { location.href="shop_list?s_type=2"; })
		
		$('#pagekakao').click(function() {
			var win = window.open("https://page.kakao.com/main?categoryUid=21&subCategoryUid=21000", '_blank');
	        win.focus();
		})
		$('#netflix').click(function() {
			var win = window.open("https://www.netflix.com", '_blank');
	        win.focus();
		})
		$('#watcha').click(function() {
			var win = window.open("https://watcha.com", '_blank');
	        win.focus();
		})
	});
</script>
<style>
	.btn{
		background-color: silver;
		width: 200px;
		height: 100px;
		/* margin: 0 165px 0; */
		font-weight: bolder;
		font-size: 20px;
	}
	.bttn1{
		margin-left:40px ;
	}
	.btn1{
		background-color: yellow;
		width: 200px;
		height: 100px;
		font-weight: bolder;
		font-size: 22px;
		color: black;
	}
	.btn2{
		background-color: red;
		width: 200px;
		height: 100px;
		font-weight: bolder;
		font-size: 25px;
	}
	.btn3{
		background-color: pink;
		width: 200px;
		height: 100px;
		font-weight: bolder;
		font-size: 25px;
		color: hotpink;
	}
</style>
<div class="content">
	<h2 class="m_3"><strong style="color: orange;">3D 게임 함께해요*</strong>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<strong style="color: red;">스트리밍 서비스!</strong></h2>
	<input type="button" id="blockBtn" class="btn btn-default" value="Block Craft 3D">
	<button type="button" id="gameBtn" class="btn btn-default">Fly Aviator</button>
	<button type="button" id="pagekakao" class="btn1 btn-default bttn1">KAKAO PAGE</button>
	<input type="button" id="netflix" class="btn2 btn-default" value="NETFLIX">
	<button type="button" id="watcha" class="btn3 btn-default">WATCHA</button>
	<div class="clearfix"></div>
</div>
<br>
<div class="content">
	<h2 class="m_3" style="color: navy;"><strong>영화 대여</strong></h2>
	<jsp:include page="shop_rental_list.jsp"/>
</div>