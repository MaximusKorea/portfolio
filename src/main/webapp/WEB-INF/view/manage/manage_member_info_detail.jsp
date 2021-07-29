<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<title>관리자 페이지 - 회원 정보</title>
<script type="text/javascript">
	function member_modify(){
		memberAction.action = "manage_member_info_modify_form";
		memberAction.submit();
	}
	function member_delete(){
		memberAction.action = "managa_member_info_delete";
		memberAction.submit();
	}
	function previous(){
		memberAction.action = "manage_member_info_list";
		memberAction.submit();
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
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
						<br/>
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>관리자 회원페이지</b></td>
								</tr>
							</table>
							<form name="memberAction" method="POST">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">번호</td>
										<td width=490 align="left" bgcolor="ffffff">
											<input type="hidden" name="m_no" value="${member.m_no}">&nbsp;${member.m_no}
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp${member.m_id}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp${member.m_password}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp${member.m_name}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">생년월일</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp${member.m_birth}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp${member.m_phone}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">주소</td>
										<td width=490 align="left" bgcolor="ffffff">
											&nbsp;${member.m_zipcode}<br/>
											&nbsp;${member.m_address1}<br/>
											&nbsp;${member.m_address2}
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이메일</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp${member.m_email}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">포인트</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp${member.pt_point}</td>
									</tr>
								</table>
							</form>
						<br/>
						</td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="1">
					<tr>
						<td align=center>
							<input type="button" value="수정하기" onClick="member_modify()"> 
							<input type="button" value="삭제하기" onClick="member_delete()">
							<input type="button" value="뒤로가기" onClick="previous();">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>