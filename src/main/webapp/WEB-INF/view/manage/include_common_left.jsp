<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<p>
	<strong>메 뉴</strong>
</p>
<ul>
	<%	if(session.getAttribute("sUserId") != null && session.getAttribute("sUserId").equals("admin")) { %>
	<li>
		<a href="manage_main">메인</a>
		<a href="manage_logout_action">로그아웃</a>
	</li>
	<li><a></a></li>
	<li><a href="manage_member_info_list">회원 정보 관리</a></li>
	<li><a href="manage_movie_info_list?pageno=1">영화 정보 관리</a></li>
	<li><a href="manage_schedule_info_list?pageno=1">상영 스케쥴 관리</a></li>
	<li><a href="manage_product_list?pageno=1">상품 정보 관리</a></li>
	<li><a href="board_list_admin?pageno=1&board_type=Notice">공지사항 관리</a></li>
	<li><a href="board_list_admin?pageno=1&board_type=1:1">1:1 문의 관리</a></li>
	<li><a href="manage_movie_rental_list?pageno=1">영화 대여 관리</a></li>
	<li><a></a></li>
	<%
		} else {
	%>
	<li>
		<a href="manage">로그인</a>
	</li>
	<li>로그인해주세요.</li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<%
		}
	%>
	<li><a></a></li>
	<li><a></a></li>
</ul>
	<a href="index">영화관 바로가기</a>