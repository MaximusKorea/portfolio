<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	 function cancel() {
		history.go(-1)();
	} 
	function board_write_action() {
		f.action = "board_write_action";
		f.submit();
	}
</script>
</head>
<body>
	<form name="f">
		<table>
			<tr>
				<td bgcolor="white"> 게시글 분류
				<c:if test="${sessionScope['sUserId'] eq 'admin'}">
					<select name="board_type">
						<option value="Notice">공지사항</option>
						<option value="1:1">1:1문의</option>
					</select>
				</c:if>
				<c:if test="${sessionScope['sUserId'] ne 'admin' && sessionScope['sUserId'] ne null}">
				<input type="hidden" name="board_type" value="1:1">
					1:1문의
				</c:if>
				</td>
			</tr>
			<tr>
				<c:if test="${sessionScope['sUserId'] ne 'admin'}">
					<td width=490>글쓴이:<input readonly="readonly" type="text" name="board_writer" value="${sessionScope['sUserId']}"></td>
				</c:if>
				<c:if test="${sessionScope['sUserId'] eq 'admin'}">
					<td width=490>글쓴이:<input type="text" name="board_writer" value="관리자"></td>
				</c:if>
			</tr>
			<tr>
				<td width=490>제목:<input type="text" name="board_title"></td>
			</tr>
			<tr>
				<td width=490>내용:<br />
					<textarea rows="15" cols="50" name="board_content"></textarea>
				</td>
			</tr>
		</table>
		<input type="button" onClick="board_write_action();" value="완료">
		<input type="button" onClick="cancel();" value="취소">
	</form>
</body>
</html>