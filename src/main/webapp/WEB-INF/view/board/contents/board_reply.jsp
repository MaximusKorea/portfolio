<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cancel() {
		f.action="board_list";
		f.submit();
	}
	function board_reply_write_action() {
		f.action="board_reply_write_action";
		f.submit();
	}
</script>
</head>
<body>
<form name="f">
	<table>
		<tr>
			<td width=490>글쓴이:<input type="text" name="board_writer"></td>
		</tr>
		<tr>
			<td width=490>제목:<input type="text" name="board_title" value="[답변]${readBoard.board_title}"></td>
		</tr>
		<tr>
			<td width=490>내용:<input type="text" name="board_content" value=">>${readBoard.board_content}"></td>
		</tr>
		<input type="hidden" name="board_no" value="${readBoard.board_no}">
		<input type="hidden" name="pageno" value="${pageno}">
	</table>
	<input type="button" onClick="board_reply_write_action();" value="완료">
	<input type="button" onClick="cancel();" value="취소">
</form>
</body>
</html>