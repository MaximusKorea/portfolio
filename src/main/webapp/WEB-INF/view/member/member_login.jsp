<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style type="text/css">
	input.error, textarea.error {
		border: 1px solid red;
	}
	label.error {
		margin-left: 10px;
		color: red;
	}
</style>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/messages_ko.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	$('#f').validate({
		rules: {
			m_id:{
				required:true,
			},
			m_pass:{
				required:true
			},
			answer:{
				required:true
			}
		},
		messages:{
			m_id:{
				required: "아이디를 입력하세요.",
			},
			m_pass:{
				required: "패스워드를 입력하세요."
			},
			answer:{
				required: "자동 로그인 방지 문자를 입력하세요."
			}
		},
		onsubmit:true,
		submitHandler:function(form){
			form.action="member_login_action";
			form.submit();
		}
	});
});
</script>

<!-- kakao login -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
	Kakao.init('95e529070e7d7f7895efff43950d9739');
	console.log(Kakao.isInitialized());
	//카카오로그인
	function kakaoLogin() {
		window.Kakao.Auth.login({
			  scope:'profile, account_email'
			, success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url: '/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						location.href =
							'member_kakaologin_action?m_id='+res.id
								+'&m_name='+kakao_account.profile.nickname
								+'&m_email='+kakao_account.email
								+"&no=1&pageno=1";
					}
				});
			}
		});
	}
	
	// 자동로그인방지
	function audio(){
		var rand = Math.random();
        var url = 'captchaAudio';
        $.ajax({
            url: url,
            type: 'POST',
            dataType: 'text',
            data: 'rand=' + rand,
            async: false,
            success: function(resp) {
                var uAgent = navigator.userAgent;
                var soundUrl = 'captchaAudio?rand=' + rand;
                if(uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
                    winPlayer(soundUrl);
                } else if (!!document.createElement('audio').canPlayType) {
                    try{
                        new Audio(soundUrl).play();
                    } catch(e) {
                        winPlayer(soundUrl);
                    }
                }else {
                    window.open(soundUrl, '', 'width=1, height=1');
                }
            }    
        });
    }
	function refreshBtn(type){
        var rand = Math.random();
        var url = "captchaImg?rand=" + rand;
        $('#captchaImg').attr("src", url);
    }
    function winPlayer(objUrl){
        $('#captchaAudio').html('<vgsound src="' + objUrl + '">');
    }
</script>

<div class="content">
	<div class="register">
		<div class="col-md-6 login-left">
			<h2><strong>처음 오셨나요?</strong></h2>
			<p><strong> CGV 에 오신것을 환영합니다.</strong></p>
			<a class="acount-btn" href="member_write">아이디 만들기</a>
		</div>
		<div class="col-md-6 login-right">
			<h2><strong>회원 로그인</strong></h2>
			<p><strong>아이디가 있는 고객은 로그인하여주세요.<hr/></strong></p>
			<form id="f" name="f" method="post">
				<div>
					<strong><span>아이디<label>*</label></span></strong>
					<input type="text" name="m_id">
					<br/>
					<strong style="color: red">${MSG}</strong>
				</div>
				<div>
					<strong><span>비밀번호<label>*</label></span></strong>
					<input type="password" name="m_pass">
					 <br/>
					 <strong style="color: red">${MSG1}</strong>
				</div>
				<strong><span><label for="captcha" style="display:block;">자동 로그인 방지*</label></span></strong>
				<div class="captcha">
					<img id="captchaImg" title="캡차 이미지" src="captchaImg" alt="캡차 이미지" />
					<div id="captchaAudio" style="display:none;"></div>&emsp;&emsp;
					<a onclick="javascript:refreshBtn()" class="refreshBtn"><input type="button" value="새로고침"/></a>
					<a onclick="javascript:audio()" class="refreshBtn"><input type="button" value="음성듣기"/></a>
					<br><br>
					<input type="text" name="answer" id="answer" class="form-control"/>
                </div>
				<input type="hidden" name="returnurl" value="${returnurl}"/>
				<input type="hidden" name="no" value="1">
				<input type="hidden" name="pageno" value="1">
				<strong><a class="forgot" href="member_find">아이디찾기/</a></strong>
				<strong><a class="forgot" href="memberpw_find">비밀번호찾기</a></strong>
				<input type="submit" value="로그인">
				&emsp;&emsp;&emsp;&emsp;&nbsp;
				<a href="javascript:kakaoLogin();"><img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="207"/></a>
			</form>
		</div>
		<div class="clearfix"></div>
	</div>
</div>