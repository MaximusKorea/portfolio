<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ Ȯ��</title>
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
	 				<td>�Է��Ͻ� ������ ��ġ�ϴ� password�� �����մϴ�.
	 					Ȯ�ι�ư�� �����ø� �����Ͻ� ���Ϸ� ��й�ȣ�� ���۵˴ϴ�.
	 				</td>
	 			</tr>
 				<input type="text" name="email" value="${emailAddr}">
 				<input type="hidden" name="pwd" value="${pwpwpw}">
 				<input type="submit" name="sendEmail" value="Ȯ��"  >
	 		</c:if>
 			<c:if test="${msg eq '' || msg eq null }">
 				<tr><td>�ش������� ��ġ�ϴ� password�� �������� �ʽ��ϴ�.</td></tr>
 			</c:if>
	 	</table>
	 </form>	
</body>
</html> 