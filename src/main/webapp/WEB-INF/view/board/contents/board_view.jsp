<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#content {
		background-color: lightgray;
	}
</style>
<script type="text/javascript">
	function previous() {
		history.go(-1)();
	}
	function remove() {
		f.action = "board_delete";
		f.submit();
	}
	function update() {
		f.action = "board_update";
		f.submit();
	}
	function reply_write() {
		f.action = "board_reply_write";
		f.submit();
	}
</script>
</head>
<body>
	<div id="content">
		<br/>
		<table style="padding-left: 10px; background-color: lightgray" border=0 cellpadding=0 cellspacing=0>
			<tr>
				<td height="22">&nbsp;&nbsp; <b>게시판 - ${readBoard.board_type} </b></td>
			</tr>
		</table>
		<br/>
		<form name="f" method="post">
			<input type="hidden" name="board_no" value="${readBoard.board_no}">
			<input type="hidden" name="pageno" value="${pageno}">
			<input type="hidden" name="board_type" value="${readBoard.board_type}">
			<table border="1" cellpadding="0" cellspacing="1" width="100%" bgcolor="BBBBBB">
				<tr>
					<td width=100 align=center bgcolor="gray" height="22">글쓴이</td>
					<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">${readBoard.board_writer}</td>
				</tr>
				<tr>
					<td width=100 align=center bgcolor="gray" height="22">제목</td>
					<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">${readBoard.board_title}</td>
				</tr>
				<tr>
					<td width=100 align=center bgcolor="gray" height="22">내용</td>
					<td width=490 bgcolor="ffffff" height="180px" style="padding-left: 10px" align="left"><img src="${readBoard.board_image}"><br />
						${readBoard.board_content}<br/>
					</td>
				</tr>
			</table>
			<input type="button" value="이전으로" class="btn btn-default" onClick="previous();">
			<c:if test="${readBoard.board_type eq '1:1' && sessionScope['sUserId'] eq readBoard.board_writer}">
				<input type="button" value="수정" class="btn btn-default" onClick="update();">
				<input type="button" value="삭제" class="btn btn-default" onClick="remove();">
			</c:if>
		</form>
	</div>
</body>
</html>