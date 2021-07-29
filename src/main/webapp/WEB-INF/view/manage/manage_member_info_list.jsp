<%@ page import="domain.movie.Movie"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<title>관리자 페이지 - 회원 정보 열람</title>
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
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
						<br/>
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>회원리스트</b></td>
								</tr>
							</table>
							<form>
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td align=center bgcolor="E6ECDE" height="22">회원아이디</td>
										<td align=center bgcolor="E6ECDE" height="22">회원명</td>
										<td align=center bgcolor="E6ECDE" height="22">생년월일</td>
										<td align=center bgcolor="E6ECDE" height="22">잔여포인트</td>
									</tr>
									<c:forEach var="member" items="${memberList}">
										<tr> 
											<td width=490 align="center" bgcolor="ffffff">
												<a href="manage_member_info_detail?m_no=${member.m_no}">${member.m_no}</a>
											</td>
											<td width=490 align="center" bgcolor="ffffff">
												<a href="manage_member_info_detail?m_no=${member.m_no}">${member.m_name}</a>
											</td>
											<td width=490 align="center" bgcolor="ffffff">${member.m_birth}</td>
											<td width=490 align="center" bgcolor="ffffff">${member.pt_point}</td>
										</tr>
									</c:forEach>
								</table>
							</form>
						 <br/>
						 </td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>