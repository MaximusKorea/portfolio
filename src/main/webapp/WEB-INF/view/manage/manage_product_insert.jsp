<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>상품 정보 추가</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<script type="text/javascript">
	function xSize(e){
	    e.style.height = '1px';
	    e.style.height = (e.scrollHeight + 12) + 'px';
	}
	
	function input(){
		if(document.product_info.p_name.value == ""){
			alert("상품명을 입력해주세요.");
			product_info.p_name.focus();
			return false;
		}
		if(document.product_info.p_price.value == ""){
			alert("상품가격을 입력해주세요.");
			product_info.p_price.focus();
			return false;
		}
		if(document.product_info.p_content.value == ""){
			alert("상품설명을 입력해주세요.");
			product_info.p_content.focus();
			return false;
		}
	 	product_info.action = "manage_product_insert_action";
		product_info.method="POST";
		product_info.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp"/>
		</div>
		<div id="navigation">
			<jsp:include page="include_common_left.jsp"/>
		</div>
		<div id="wrapper">
			<div id="content">
			<table border=0 cellpadding=0 cellspacing=0>
				<tr>
					<td>
					<br/>
						<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
							<tr>
								<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>상품 정보 추가</b></td>
							</tr>
						</table>
						<form name="product_info" method="post" enctype="multipart/form-data">
							<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
								<input type="hidden" name="p_no" value="${product.p_no}">			
								<tr>
									<td width=100 align=center bgcolor="E6ECDE" height="22">상품명</td>
									<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="p_name" value="${productupdate.p_name}"></input>
									</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="E6ECDE" height="22">상품가격</td>
									<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="p_price" value="${productupdate.p_price}"></input>
									</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="E6ECDE" height="22">상품이미지</td>
									<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="file" name="file" value="${productupdate.p_image}"></input>
									</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="E6ECDE" height="22">상품재고</td>
									<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="p_desc" value="${productupdate.p_desc}"></input>
									</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="E6ECDE" height="22">상품설명</td>
									<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<textarea name="p_content" onkeyup="xSize(this)" >${productupdate.p_content}</textarea>
									</td>
								</tr>
								<tr>
									<td width=100 align=center bgcolor="E6ECDE" height="22">상품분류</td>
									<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="p_type" value="${productupdate.p_type}"></input>
									</td>
								</tr>
							</table>
						</form>
						<br/>
						<table border="0" cellpadding="0" cellspacing="1">
							<tr>
								<td align=center>
									<input type="reset">
									<input type="button" value="작성 완료" onClick="input();">
								</td>
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