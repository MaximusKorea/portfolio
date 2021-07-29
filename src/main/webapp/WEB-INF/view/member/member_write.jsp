<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/module.css" />
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
	}
</style>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/messages_ko.js" type="text/javascript"></script>
<!-- <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	$(function() {
    	$('#f').validate({
            rules: {
                m_id: {
                	required:true,
                	eng_number:true,
                	remote:'member_check',
                	minlength:5,
                	maxlength:20 
                },
                m_password: {
                	required:true, 
                	eng_number:true, 
                	minlength:6, 
                	maxlength:16
                },
            	m_name: {
            		required:true
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
           	messages: {
           		m_id: {
					minlength:"아이디는 {0}자 이상입력 해야합니다.",
					maxlength:"아이디는 {0}자 이하입력 해야합니다.",
					remote:$.validator.format('{0} 은 이미 사용중인 아이디입니다')
           		},
           	    m_pass: {
                   	minlength:"패스워드는{0}자 이상 입력해야합니다.",
                   	maxlength:"패스워드는{0}자 이하 입력해야합니다.",
				},
				m_name:	{},
				m_phone: {
					number:"숫자로만 입력해주세요",
					minlength:"휴대폰 번호를 제대로 입력해주세요",
					maxlength:"휴대폰 번호를 제대로 입력해주세요"
				},
				m_email: {
					email:"이메일 형태로 작성해주세요."
				}
           	},
            onsubmit: true,
            debug: true
            /*
            ,
            submitHandler: function(form) {
            	form.action="member_write_action";
            	form.submit();
            }
           	*/
        });
    	$("#saveB").click(function(){
			if(		$('input[name=m_id]').val().trim() != ''
				&&	$('input[name=m_password]').val().trim() != ''
				&&	$('input[name=m_name]').val().trim() != ''
				&&	$('input[name=m_birth]').val().trim() != ''
				&&	$('input[name=m_phone]').val().trim() != ''
				&&	$('input[name=m_zipcode]').val().trim() != ''
				&&	$('input[name=m_address1]').val().trim() != ''
				&&	$('input[name=m_address2]').val().trim() != ''
				&&	$('input[name=m_email]').val().trim() != ''
				&&  $('input[name=m_email]').val().match(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i) != null){
				
				f.action = "member_write_action"; f.submit();
			}
        });
    });

	function cancel() {
		f.action = "main";
		f.submit();
		return false;
	}
	
	function postAddr() {
		new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            var addr = '';
	            if(data.userSelectedType === 'R') {
	            	addr = data.roadAddress;
	            } else {
	            	addr = data.jibunAddress;
	            }
	            $('input[name=m_zipcode]').attr('value',data.zonecode);
	            $('input[name=m_address1]').attr('value',addr);
	            document.getElementById('m_addr2').focus();
	        }
	    }).open();
	}
</script>

<div class="content">
	<div class="register">
		<form id="f" name="f" method="post">
			<h2><strong>개인 정보</strong></h2> 
			<div class="col-md-6 view-left">
				<div>
				<strong>
					<input type="text" id="m_id" name="m_id" placeholder="아이디"><br/>
					<input type="password"  name="m_password" placeholder="비밀번호"><br/>
					<input type="text" name="m_name" placeholder="이름"><br/>
					<input type="text" name="m_birth" placeholder="생일(Ex : 2000/01/01 or 2000-01-01)"><br/>
					<input type="text" name="m_phone" placeholder="휴대폰번호"><br/>
					
					<div class="register-but" style="margin-bottom: 0">
						<input type="text" id="m_zipcode" name="m_zipcode" style="float: left;" readonly="readonly" placeholder="우편번호">
						<input class="postAddr" type="button" value="우편번호" onclick="postAddr()">
					</div>
					 
					<input type="text" name="m_address1" readonly="readonly" placeholder="주소">
					<input type="text" id="m_addr2" name="m_address2" placeholder="상세주소">
					 
					<input type="text" name="m_email" placeholder="이메일">
			
					<div class="register-but">
						<input type="submit" value="회원가입" id="saveB">
						<input type="submit" value="취소" onclick="cancel()">
					</div>
				</strong>					
				</div>
				<div class="clearfix"></div>
			</div>
			
			<div class="col-md-6 view-right">
				<div>
					<h4><strong>영화 그 이상의 감동! MOVIE STORE에 오신걸 환영합니다.</strong></h4>
					<br/>
					<p>
						국내 최초로 멀티플렉스 개념을 도입하여 영화관람의 새로운 트렌드를 이끌어 온 MOVIE STORE는  고객을 향한 온리
						원 서비스와 최고의 운영노하우로 글로벌 문화, 엔터테인먼트 플랫폼으로 도약하고 있습니다.
					</p>
				</div>
				<div class="box-joininfo">
					<div class="box-inner">
						<h4><strong>
							♥MOVIE STORE 회원가입안내♥
						</strong></h4>
						<p>
							MOVIE STORE는 CGV의 제휴 브랜드이며, MOVIE STORE 회원으로 가입하시면 빠르고 간편하게 서비스를 모두
							이용하실 수 있습니다. <br /> MOVIE STORE 회원은 MOVIE STORE 제휴 브랜드 상품/서비스 구매 시 0.1%
							~ 5% 포인트 적립혜택을 누리실 수 있습니다. <br /> 적립된 MOVIE STORE 포인트는 모든 CGV
							제휴 브랜드 매장에서 현금처럼 사용 가능합니다.
						</p>
					</div>
				</div>
			</div>
		</form>
		<div class="clearfix"></div>
	</div>
</div>