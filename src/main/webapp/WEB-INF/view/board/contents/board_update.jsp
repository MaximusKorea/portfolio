<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function board_update_action() {
		f.action = "board_update_action";
		f.submit();
	}
	function cancel() {
		f.action="board_view";
		f.submit();
	}
</script>
</head>
<body>
<form name="f">
	<table>
		<input type="hidden" name="board_no" value="${readBoard.board_no}">
		<input type="hidden" name="pageno" value="${pageno}">
		<tr>
			<td width=490>제목:<input type="textArea" name="board_title" value="${readBoard.board_title}"></td>
		</tr>
		<tr>
			<td width=490>내용:<br/><textarea rows="15" cols="50" name="board_content">${readBoard.board_content}</textarea></td>
		</tr>
	</table>
	<input type="button" onClick="board_update_action();" value="완료">
	<input type="button" onClick="cancel();" value="취소">
</form>
</body>
</html>