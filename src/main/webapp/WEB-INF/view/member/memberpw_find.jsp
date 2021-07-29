<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/messages_ko.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		$('#findPw').validate({
			rules: {
				m_name: {
					required: true
				},
				m_phone: {
					required: true
				},
				m_birth: {
					required: true
				}
			},
			onsubmit:true,
			submitHandler:function(f){
				var m_id = f.m_id.value;
				var m_name = f.m_name.value;
				var m_phone = f.m_phone.value;
				var m_birth = f.m_birth.value;
				window.open("findPw?m_id="+m_id+"&m_name="+m_name+"&m_phone="+m_phone+"&m_birth="+m_birth,"비밀번호찾기","width=360 height=160 resizable=yes");
				f.submit();
			}
		});
	})
</script>

<div class="content">
	<div class="register">
		<div class="col-md-6 login-left">
			<h2><strong>비밀번호찾기</strong></h2>
			<p><strong>아이디/이름/전화번호/생년월일<strong></p>
			<form id="findPw" name="findPw" method="post">
			  	<div>
					<span>아이디</span>
					<input type="text" name="m_id">
			  	</div>
			 	<div>
					<span>이름</span>
					<input type="text" name="m_name">
				</div>
				<div>
					<span>전화번호</span>
					<input type="text" name="m_phone">
				</div>
				<div>
					<span>생년월일</span>
					<input type="text" name="m_birth">
				</div>
				<input type="submit" value="비밀번호찾기">
			</form>
		</div>
 		<div class="col-md-6 view-right" style="margin-top: 20px;">
 			<div style="padding: 20px; border: 2px solid #d5d4cd; background: #f9f7ec; line-height: 1.8;">
	 			<dl>
	 				<dt>[ 이용문의 ]</dt>
	 				<hr/>
	 				<dd>CGV 고객센터 : 1544-1122</dd>
	 				<dd>상담 가능 시간 : 월~금 09:00~18:00 (이 외 시간은 자동 응답 안내 가능)</dd>
	 			</dl>
 			</div>
 			<div>
 				<a href="http://ad.cgv.co.kr/click/CGV/CGV_201401/sub@Bottom?ads_id%3d28594%26creative_id%3d63394%26click_id%3d83449%26maid%3D%26event%3d" target="_blank">
 					<img src="https://adimg.cgv.co.kr/images/202001/cgvgift/0406_980x240.png" style="width: 100%">
 				</a>
 			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>