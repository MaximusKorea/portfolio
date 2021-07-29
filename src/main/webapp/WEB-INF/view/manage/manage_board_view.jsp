<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<link href="css/manage_styles.css" rel="stylesheet" type="text/css" />
<link href="css/manage.css" rel="stylesheet" type="text/css" />
<link href="css/manage_main_stylesheet.css" rel="stylesheet" type="text/css" />
<title>관리자 페이지</title>
<script type="text/javascript">
	function previous() {
		history.go(-1)();
	}
	function remove() {
		f.action = "board_delete_admin";
		f.submit();
	}
	function update() {
		f.action = "board_update_admin";
		f.submit();
	}
	function reply_write() {
		f.action = "board_reply_write";
		f.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp" />
		</div>
		<div id="navigation">
			<jsp:include page="include_common_left.jsp" />
		</div>
		<div id="wrapper">
			<div id="content">
				<form name="f" method="post">
					<input type="hidden" name="board_no" value="${readBoard.board_no}">
					<input type="hidden" name="pageno" value="${pageno}">
					<input type="hidden" name="board_type" value="${readBoard.board_type}">
					<table border="0" cellpadding="0" cellspacing="1" style="height: min-content;" bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">${readBoard.board_writer}</td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
							<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">${readBoard.board_title}</td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
							<td width=490 bgcolor="ffffff" height="180px" style="padding-left: 10px" align="left">${readBoard.board_image}${readBoard.board_content}<br />
							</td>
						</tr>
						<input type="button" value="이전으로" onClick="previous();">
						<c:if test="${sessionScope['sUserId'] eq 'admin'}">
							<input type="button" value="답글쓰기" onClick="reply_write();">
							<input type="button" value="수정" onClick="update();">
							<input type="button" value="삭제" onClick="remove();">
						</c:if>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>