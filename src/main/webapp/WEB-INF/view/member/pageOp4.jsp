<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/messages_ko.js" type="text/javascript"></script>

<style type="text/css">
	.register-but input[type="submit"] {
		margin-left: 100px;
	}
	#f{
		margin-top: 130px;
		margin-left : 100px;
	}
</style>
<script type="text/javascript">
   	$(function() {
		$('#f').validate({
			rules : {
				m_password : {
					required : true,
					remote : 'pw_check'
				}
			},
			messages : {
				m_password : {
					required : "비밀번호를 입력하세요",
					remote : $.validator.format('비밀번호가 일치하지 않습니다.')
				}
			},
			onsubmit : true,
			submitHandler : function(form) {
				form.action = "member_out"
				form.submit();
			}
		})
	});
</script> 
<div>
	<form id="f" name="f" method="post" >
		<p>
			회원탈퇴를 위해 비밀번호를 다시 입력해주세요.!
		</p>
		<div>
		    <strong><span>비밀번호<label>*</label></span></strong>
			<input type="password" name="m_password" style="width: 75%;"> 
		</div>
		<div class="register-but">
			<input type="submit" value="회원탈퇴" >
		</div>
	</form>
</div>