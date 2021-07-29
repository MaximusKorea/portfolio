<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/manage_styles.css" rel="stylesheet" type="text/css" />
<link href="css/manage.css" rel="stylesheet" type="text/css" />
<link href="css/manage_main_stylesheet.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<script type="text/javascript">
	function cancel() {
		history.go(-1)();
	}
	function board_write_action() {
		f.action = "board_write_action_admin";
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
				<form name="f" method="post" enctype="multipart/form-data">
					<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">게시글 분류</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
								<select name="board_type">
									<option value="Notice">공지사항</option>
									<option value="1:1">1:1문의</option>
								</select>
							</td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이:</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
								<input type="text" name="board_writer" value="관리자">
							</td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22" width=400>제목:</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
								<input type="text" name="board_title">
							</td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">이미지:</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
								<input type="file" name="file">
							</td>
						</tr>
						<tr>
							<td width=100 align=center bgcolor="E6ECDE" height="22">내용:</td>
							<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
								<textarea rows="15" cols="50" name="board_content"></textarea>
							</td>
						</tr>
					</table>
					<input type="button" onClick="board_write_action();" value="완료">
					<input type="button" onClick="cancel();" value="취소">
				</form>
			</div>
		</div>
	</div>
</body>
</html>