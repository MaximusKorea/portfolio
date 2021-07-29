<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	function golink(i) {
		location.href="menu?no="+i+"&pageno=1";
	}
</script>
<style>
	.content{
		padding: 0em;
	}
	
	.menuinfo {
		list-style-type: none;
	 	background-color:blue;
		color:white;
		
		-webkit-margin-before: 0em;
		-webkit-margin-after: 0em; 
		-webkit-margin-start : 0px;
		-webkit-margin-end : 0px;
		-webkit-padding-start: 0px;
		-webkit-margin-start: 0px;
		-webkit-margin-end: 0px;
	 
	}
	
	.menuinfo li {
		border: 1px solid gray;
		width: auto;
		height: 100px;
		text-align: center;
		font-size:large;
		font-weight:bolder;
	 	padding-top: 35px;
	}
	 
	.menuinfo li:HOVER{
		background: red;
	}
	 
	.mypage{
		margin-left: 150px;
	}
	
	.mypage div{
		margin-top: 100px;
	}
	
	.mypage span{
		color : olive;
		display: inline-block;
		width: 100px;
	}
	
	.view-left span{	
		display: inline-block;
		width: 63px;
	}
</style>

<div class="content">
	<div class="col-md-3 view-left">
		<ul class="menuinfo">
			<li onclick="golink(1)">정보수정</li>
			<li onclick="golink(2)">예매내역</li>
			<li onclick="golink(3)">주문내역</li>
			<li onclick="golink(4)">회원탈퇴</li>
			<li onclick="golink(5)">포인트사용내역</li>
		</ul>
		<div class="clearfix"></div>
	</div>

	<c:if test="${!empty(MENU_PAGE) }">
		<div class="col-md-9 view-left rrr">
			<jsp:include page="${MENU_PAGE}" />
		</div>
	</c:if>

	<c:if test="${empty(MENU_PAGE) }">
		<div class="col-md-6 mypage">
 			 <div>
	 	   		<span >아이디</span>
	 	   		<input type="text" value="${Smember.m_id}" readonly="readonly" disabled="disabled">
	 	   		<span >이름</span>
	 	   		<input type="text" value="${Smember.m_name}" readonly="readonly" disabled="disabled">
	 	   	</div>
	 	    <div>
	 	   		<span>영화 관람횟수</span>
	 	   		<input type="text" value="${mvcount}" readonly="readonly" disabled="disabled">
	 	   		<span>잔여 포인트</span>
	 	   		<input type="text" value="${ptcount}" readonly="readonly" disabled="disabled">
	 	   	</div>
 	 	</div>
	</c:if>
	<div class="clearfix"></div>
</div>