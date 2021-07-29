<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>비밀번호 확인</title>
<style type="text/css">
	table {
		border: 4px solid black;
		border-color: tomato;
	}
	td { color: tomato; } 
</style>
</head>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<body>
	<form name="f" method="post" action="mailSending">
	 	<table>
	 		<c:if test="${!(msg eq '')}">
	 			<tr>
	 				<td>입력하신 정보와 일치하는 password가 존재합니다.
	 					확인버튼을 누르시면 가입하신 메일로 비밀번호가 전송됩니다.
	 				</td>
	 			</tr>
 				<input type="text" name="email" value="${emailAddr}">
 				<input type="hidden" name="pwd" value="${pwpwpw}">
 				<input type="submit" name="sendEmail" value="확인"  >
	 		</c:if>
 			<c:if test="${msg eq '' || msg eq null }">
 				<tr><td>해당정보와 일치하는 password는 존재하지 않습니다.</td></tr>
 			</c:if>
	 	</table>
	 </form>	
</body>
</html> 