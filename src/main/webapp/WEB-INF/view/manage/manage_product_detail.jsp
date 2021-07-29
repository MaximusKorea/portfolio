<%@ page import="domain.movie.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<title>관리자 페이지 - 영화 정보 보기</title>
 <script type="text/javascript">
	function golist(){
		f.action = "manage_product_list?pageno="+${pageno};
		f.method="POST";
		f.submit();
	}
	function deleteproduct(){
		f.action = "manage_product_delete?p_no="+${productdetail.p_no};
		f.method="POST";
		f.submit();
	} 
	function product_modifyInfo(){
		f.action = "manage_product_update_form?p_no="+${productdetail.p_no}+"&pageno="+${pageno};
		f.method="POST";
		f.submit();
	} 
</script> 
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>상품 상세페이지</b></td>
								</tr>
							</table>
							<form name = "f">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=300 align=center bgcolor="E6ECDE" height="22">상품이미지</td>
										<td width=490 align="center" bgcolor="ffffff" colspan="3"><img src="${productdetail.p_image}" width="100" height="150"></td>
									</tr>
									<tr>
										<td width=150 align=center bgcolor="E6ECDE" height="22">상품번호</td>
										<td width=490 align="left" bgcolor="ffffff">${productdetail.p_no}</td>
										<td width=150 align=center bgcolor="E6ECDE" height="22">상품재고</td>
										<td width=490 align="left" bgcolor="ffffff">${productdetail.p_desc}</td>
									</tr>
									<tr>
										<td width=150 align=center bgcolor="E6ECDE" height="22">상품이름</td>
										<td width=490 align="left" bgcolor="ffffff">${productdetail.p_name}</td>
										<td width=150 align=center bgcolor="E6ECDE" height="22">상품가격</td>
										<td width=490 align="left" bgcolor="ffffff">${productdetail.p_price}</td>
									</tr>
									<tr>
										<td width=150 align=center bgcolor="E6ECDE" height="22">상품설명</td>
										<td width=490 align="left" bgcolor="ffffff" colspan="3">${productdetail.p_content}</td>
									</tr>
								</table>
							</form>
							<br />
						 	<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="목록" onclick="golist();">
									<input type="button" value="수정하기"onClick="product_modifyInfo();"> 
								<input type="button" value="삭제하기"onClick="deleteproduct();"></td>
 								</tr>
							</table>
						</td> 
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>