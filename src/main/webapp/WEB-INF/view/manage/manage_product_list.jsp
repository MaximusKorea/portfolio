<%@ page import="domain.movie.Movie"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<title>관리자 페이지 - 상품 정보 열람</title>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>상품리스트</b></td>
								</tr>
							</table>
							<form>
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td align=center bgcolor="E6ECDE" height="22">상품번호</td>
										<td align=center bgcolor="E6ECDE" height="22">상품이름</td>
										<td align=center bgcolor="E6ECDE" height="22">상품가격</td>
										<td align=center bgcolor="E6ECDE" height="22">상품제고</td>
									</tr>
									<c:forEach var="product" items="${productlist.list}">
										<tr>
											<td width=490 align="center" bgcolor="ffffff">
												<a href="manage_product_detail?p_no=${product.p_no}&pageno=${productlist.selectPageNo}">${product.p_no}</a>
											</td>
											<td width=490 align="center" bgcolor="ffffff">
												<a href="manage_product_detail?p_no=${product.p_no}&pageno=${productlist.selectPageNo}">${product.p_name}</a>
											</td>
											<td width=490 align="center" bgcolor="ffffff">${product.p_price}</td>
											<td width=490 align="center" bgcolor="ffffff">${product.p_desc}</td>
										</tr>
									</c:forEach>
								</table>
							</form>
							<br/>
							<table border="0" cellpadding="0" cellspacing="1" width="100%">
								<tr>
									<td align="center">
									<c:if test="${productlist.showFirst}">
										<a href="manage_product_list?pageno=1">◀◀</a>&nbsp; 
									</c:if>
									<c:if test="${movieList.showPreviousGroup}">
										<a href="manage_product_list?pageno=${productlist.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
									</c:if>
									<c:forEach var="listPage" begin="${productlist.startPageNo}" end="${productlist.endPageNo}" varStatus="status">
										<c:if test="${productlist.selectPageNo == status.index}">
											<font color='red'><strong>${status.index}</strong></font>&nbsp;
										</c:if>
										<c:if test="${productlist.selectPageNo != status.index}">
											<a href="manage_product_list?pageno=${status.index}"><strong>${status.index}</strong></a>&nbsp;
										</c:if>
									</c:forEach>
										<c:if test="${movieList.showNextGroup}">
											<a href="manage_product_list?pageno=${productlist.nextGroupStartPageNo}">▶&nbsp;</a>
										</c:if>
										<c:if test="${movieList.showLast}">
											<a href="manage_product_list?pageno=${productlist.totalPageCount}">▶▶</a>&nbsp;
										</c:if>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
 							<form name="product_list" action="manage_product_insert" method="post"> 
								<table border="0" cellpadding="0" cellspacing="1">
 									<tr> 
 										<td align="right"><input type="submit" value="추가하기" /></td> 
 									</tr>
 								</table> 
 							</form> 
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>