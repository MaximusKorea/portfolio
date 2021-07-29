<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/messages_ko.js" type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 
<style type="text/css">
	input.postAddr{
		background: #df1f26;
		color: #FFF;
		font-size: 1em;
		padding: 7px 20px;
		transition: 0.5s all;
		-webkit-transition: 0.5s all;
		-moz-transition: 0.5s all;
		-o-transition: 0.5s all;
		display: inline-block;
		text-transform: uppercase;
		border: none;
		outline: none;
	}
	
	input.postAddr:HOVER{
		background:#3f444e;
	}
	
	input.error, textarea.error {
		border: 1px solid red;
	}
	
	label.error {
		margin-left: 10px;
		color: red;
		font-weight: 
	}
</style>
 
 <script type="text/javascript">
	$(function() {
		$('#f').validate({
            rules: {
                m_password: {required: true, 
                	eng_number:true, 
                	minlength:6, 
                	maxlength:16
                },
            	m_name: {
            		required: true
            	},
                m_phone: {
                	required:true, 
                	number:true,
                	minlength:11,
                	maxlength:11
                },
                m_email: {
                	required:true, 
                	email:true
                },
                m_address1: {
                	required:true, 
                	maxlength:50
                },
                m_address2: {
                	required:true, 
                	maxlength:50
                },
                m_birth: {
                	required:true,
                	dateISO:true
                }
            },
            	messages:{
            		m_password: {
                    	minlength:"패스워드는{0}자 이상 입력해야합니다.",
                    	maxlength: "패스워드는{0}자 이하 입력해야합니다.",
                    },
                    m_name:	{},
                    m_phone:{
                    	number: "숫자로만 입력해주세요",
                    	minlength:"휴대폰 번호를 제대로 입력해주세요",
                    	maxlength: "휴대폰 번호를 제대로 입력해주세요"
                    },
                    m_email:{
                    	email: "이메일 형태로 작성해주세요."
                    }
            	},
            onsubmit:true,
            submitHandler: function(form){
            	form.action="member_modify"
            	form.submit();
            }
        });
    });
 
 	function postAddr(){
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        	var addr = '';
	            if(data.userSelectedType === 'R'){
	            	addr = data.roadAddress;
	            }else{
	            	addr = data.jibunAddress;
	            }
	            
	            $('input[name=m_zipcode]').attr('value',data.zonecode);
	            $('input[name=m_address1]').attr('value',addr);
	            
	            document.getElementById('m_addr2').focus();
	        }
	    }).open();
	}
 </script>

<form id="f" name="f" method="post">
	<div style="color: red; font-weight: bold;">* 카카오 로그인 사용자는 반드시 정보수정이 필요합니다!</div>
	<input type="hidden" name="m_no" value="${loginMember.m_no}">
	<input type="hidden" name="m_id" value="${loginMember.m_id}">
	<div>
		<strong><span>비밀번호<label>*</label></span></strong>
		<input type="password" name="m_password" value="${loginMember.m_password}">
	</div>
	<div>
		<strong><span>이름<label>*</label></span></strong>
		<input type="text" name="m_name" value="${loginMember.m_name}">
	</div>
	<div>
		<strong><span>생년월일<label>*</label></span></strong>
		<input type="text" name="m_birth" value="${loginMember.m_birth}">
	</div>
	<div>
		<strong><span>전화번호<label>*</label></span></strong>
		<input type="text" name="m_phone" value="${loginMember.m_phone}">
	</div>
	<div class="register-but" style="margin-bottom: 0">
		<input type="text" id="m_zipcode" name="m_zipcode" style="float: left;" readonly="readonly" value="${loginMember.m_zipcode }">
		<input class="postAddr" type="button" value="우편번호" onclick="postAddr()">
	</div>
	<input type="text" name="m_address1" readonly="readonly" value="${loginMember.m_address1}">
	<input type="text" id="m_addr2" name="m_address2" value="${loginMember.m_address2}">
	<div>
		<strong><span>이메일<label>*</label></span></strong>
		<input type="text" name="m_email" value="${loginMember.m_email}">
	</div>
	<div class="register-but">
		<div>
			<input type="submit" value="수정">
		</div>
	</div>
</form>