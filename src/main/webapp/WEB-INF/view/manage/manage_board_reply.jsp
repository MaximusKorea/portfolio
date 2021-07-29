<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<% request.setCharacterEncoding("UTF-8"); %>

<html>
<head>
<link href="css/manage_styles.css" rel="stylesheet" type="text/css" />
<link href="css/manage.css" rel="stylesheet" type="text/css" />
<link href="css/manage_main_stylesheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function board_reply_write_action() {
		f.action="board_reply_write_action";
		f.submit();
	}
	function cancel() {
		f.action="board_view_admin";
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
				<form name="f">
					<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
							<input type="text" name="board_writer"></input></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
							<input type="text" name="board_title" value="[답변]${readBoard.board_title}"></input></td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
							<input type="text" name="board_content" value=">>${readBoard.board_content}"></input></td>
						</tr>
						<input type="hidden" name="board_no" value="${readBoard.board_no}">
						<input type="hidden" name="pageno" value="${pageno}">
					</table>
					<input type="button" onClick="board_reply_write_action();" value="완료">
					<input type="button" onClick="cancel();" value="취소">
				</form>
			</div>
		</div>
	</div>
</body>				
</html>