<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table{
		border: 4px solid black;
		border-color: tomato;
	}
	
	td {
		color: tomato;
	}
</style>
</head>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<body>
 	<table>
		<tr>
			<c:if test="${!(msg eq '')}">
			<td>입력하신 정보로 가입하신 ID는 ${msg} 입니다.</td>
			</c:if>
			<c:if test="${msg eq '' || msg eq null }">
			<td>해당정보와 일치하는 ID는 존재하지 않습니다.</td>
			</c:if>
		</tr>
 	</table>
</body>
</html> 