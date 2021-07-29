<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/messages_ko.js" type="text/javascript"></script>
<title>관리자 페이지 - 회원 정보</title>
<style type="text/css">
	label.error {
		margin-left: 10px;
		color: red;
	}
</style>
<script type="text/javascript">
	$(function() {
    	$('#memberAction').validate({
            rules: {
                m_password: {
                	required: true, 
                	eng_number:true, 
                	minlength:6, 
                	maxlength:16
                },
       			m_point:{
                	required:true,
                	number:true,
                	min:0
                }
            },
           	messages:{
           	    m_pass: {
                   	minlength:"패스워드는{0}자 이상 입력해야합니다.",
                   	maxlength: "패스워드는{0}자 이하 입력해야합니다.",
                   },
              		m_point:{
              			min:"{0}이하는 입력 할 수 없습니다."
              		}
           	},
            onsubmit:true
            /* 
            ,
            submitHandler: function(form){
            	form.action="manage_member_info_modify_action"
            	form.submit();
            }
           	*/
        });
    	$("#updateB").click(function(){
			if(		$('input[name=m_password]').val().trim() != ''
				&&	$('input[name=m_point]').val().trim() != ''){
				
				memberAction.action = "manage_member_info_modify_action"; memberAction.submit();
			}
        });
    });
	
	function previous(){
		memberAction.action = "manage_member_info_detail";
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
							<form name="memberAction" id="memberAction" method="post">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">번호</td>
										<td width=490 align="left" bgcolor="ffffff">
										<input type="hidden" name="m_no" value="${member.m_no}">&nbsp;${member.m_no}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">아이디</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp;${member.m_id}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">비밀번호</td>
										<td width=490 align="left" bgcolor="ffffff">
										<input type="text" name="m_password" value="${member.m_password}"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이름</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp;${member.m_name}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">생년월일</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp;${member.m_birth}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">전화번호</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp;${member.m_phone}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">주소</td>
										<td width=490 align="left" bgcolor="ffffff">
										&nbsp;${member.m_zipcode}<br/>
										&nbsp;${member.m_address1}<br/>
										&nbsp;${member.m_address2}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">이메일</td>
										<td width=490 align="left" bgcolor="ffffff">&nbsp;${member.m_email}</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">포인트</td>
										<td width=490 align="left" bgcolor="ffffff">
										<input type="text" name="m_point" value="${member.pt_point}"></td>
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
							<input type="submit" value="수정하기" id="updateB">
							<input type="button" value="뒤로가기" onClick="previous();">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>