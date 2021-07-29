<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.movie.MovieRental"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<title>관리자 페이지 - 영화 대여 보기</title>
</head>

<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp" />
		</div>
		<div id="navigation">
			<jsp:include page="include_common_left.jsp" />
		</div>
		<div id="wrapper">
			<div id="content">
				<br/>
				<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>영화대여리스트 - 영화정보</b></td>
					</tr>
				</table>
				<form>
					<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
						<tr>
							<td align=center bgcolor="E6ECDE" height="22">영화 대여번호</td>
							<td align=center bgcolor="E6ECDE" height="22">영화명</td>
						</tr>
						<c:forEach var="movieRental" items="${movieRentalList.listRental}">
						<tr>
							<td width=490 align="center" bgcolor="ffffff">
								<a href="manage_movie_rental_detail?mv_rt_no=${movieRental.mv_rt_no}">${movieRental.mv_rt_no}</a>
							</td>
							<td width=490 align="center" bgcolor="ffffff">
								<a href="manage_movie_rental_detail?mv_rt_no=${movieRental.mv_rt_no}">${movieRental.mv_rt_name}</a>
							</td>
						</tr>
						</c:forEach>
					</table>
				</form>
				<br/>
				<table border="0" cellpadding="0" cellspacing="1" width="100%">
					<tr>
						<td align="center">
							<c:if test="${movieRentalList.showFirst}">
								<a href="manage_movie_rental_list?pageno=1">◀◀</a>&nbsp; 
							</c:if>
							<c:if test="${movieRentalList.showPreviousGroup}">
								<a href="manage_movie_rental_list?pageno=${movieRentalList.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
							</c:if>
							<c:forEach var="listPage" begin="${movieRentalList.startPageNo}" end="${movieRentalList.endPageNo}" varStatus="status">
								<c:if test="${movieRentalList.selectPageNo == status.index}">
									<font color='red'><strong>${status.index}</strong></font>&nbsp;
								</c:if>
								<c:if test="${movieRentalList.selectPageNo != status.index}">
									<a href="manage_movie_rental_list?pageno=${status.index}"><strong>${status.index}</strong></a>&nbsp;
								</c:if>
							</c:forEach>
							<c:if test="${movieRentalList.showNextGroup}">
								<a href="manage_movie_rental_list?pageno=${movieRentalList.nextGroupStartPageNo}">▶&nbsp;</a>
							</c:if>
							<c:if test="${movieRentalList.showLast}">
								<a href="manage_movie_rental_list?pageno=${movieRentalList.totalPageCount}">▶▶</a>&nbsp;
							</c:if>
						</td>
					</tr>
				</table>
				<br>
				<form name="movie_list" action="manage_movie_rental" method="post">
					<table border="0" cellpadding="0" cellspacing="1">
						<tr>
							<td align="right"><input type="submit" value="추가하기" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>