<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵� Ȯ��</title>
<style type="text/css">
	table {
		border: 4px solid black;
		border-color: tomato;
	}
	td { color: tomato; }
</style>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
	<table>
		<tr>
			<c:if test="${!(msg eq '')}">
				<td>�Է��Ͻ� ������ �����Ͻ� ID�� ${msg} �Դϴ�.</td>
			</c:if>
			<c:if test="${msg eq '' || msg eq null }">
				<td>�ش������� ��ġ�ϴ� ID�� �������� �ʽ��ϴ�.</td>
			</c:if>
		</tr>
	</table>
</body>
</html> 