<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="css/animate.css"/>
<link href="css/shop-homepage.css" rel="stylesheet">
<script src="js/tooltip.js"></script>
<script>
    addEventListener("load", function(){
		setTimeout(hideURLbar, 0);
	}, false);
    function hideURLbar(){
		window.scrollTo(0, 1);
    }

    $(function(){
    	$('.btn2').click(function(){
    		alert('로그인 해주세요');
			/* location.href = 'member_login'; */
    	});
    })
</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function iamport() {
		if (confirm("대여 하시겠습니까?") == true) {

			//가맹점 식별코드
	  		IMP.init('imp76326871');
	  		IMP.request_pay({
				pg : 'html5_inicis',
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '영화대여', //결제창에서 보여질 이름
				amount : 2300, //실제 결제되는 가격
				buyer_email : '${Smember.m_email}',
				buyer_name : '${Smember.m_id}',
				buyer_tel : '01011119999',
				//buyer_addr : '${member.m_address1}',
				//buyer_postcode : '${member.m_zipcode}',
				card_quota : [2,3,4,5,6]
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;

					var mv_rt_no = $('#mv_rt_no').val();
					var mv_rt_name = $('#mv_rt_name').val();
					var price = $('#price').val();
					var way = $('#way').val();
					
					page_move('reserv_shop', 'GET');

				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});

        } else {
            alert('취소하였습니다');
        }
	}
	
	function page_move(url, method) {
	    var form = $('#f');
	    form.attr('action', url);
	    form.attr('method', method);
	    form.submit();
	}
</script>
<style>
    .movie_image1 { margin: auto; }
    .tooltip.bottom .tooltip-inner { background-color:red; }
    .tooltip.bottom .tooltip-arrow { border-bottom-color: red; }
</style>

<div class="content">
	<form name="f" id="f">
	    <div class="movie_top">
	        <div class="col-md-3 movie_box">
	            <div>
	                <div class="movie_image1">
	                    <img src="${shopRental.mv_rt_image}" class="img-responsive" alt=""/>
	                </div>
	                <form action="" class="sky-form">
	                    <fieldset></fieldset>
	                </form>
	                <div class="clearfix"></div>
	            </div>
	        </div>
	        <div class="desc1 col-md-9">
	            <p class="movie_option">
	                &nbsp;<strong> <font size="6">${shopRental.mv_rt_name}</font></strong> 
	            </p>
	            <c:if test="${sessionScope['Smember'] ne null }">
		        <div class="box_2">
		        	<div class="video col-md-8">
			        <c:choose>
						<c:when test="${pay_ok ne 'pay_success' }">
				        	<!-- 트레일러 -->
					   		<iframe width="100%" height="400px" src="${shopRental.mv_rt_trailer}" frameborder="0" allowfullscreen></iframe>
					  	</c:when>
						<c:otherwise>
					  		<!-- 풀영상 -->
					   		<iframe width="100%" height="400px" src="https://player.vimeo.com/video/566829129" frameborder="0" allowfullscreen></iframe>        
							<!-- 
							<video width="470" height="400" autoplay="autoplay" controls>
								<source src="mp4/John.Wick.3.mp4" type="video/mp4">
							</video>
							-->
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				</c:if>
	            <p class="movie_option">
	                <strong>감독 : ${shopRental.mv_rt_director}<br/></strong>
	            </p>
	            <p class="movie_option">
	                <strong>배우 : ${shopRental.mv_rt_actor}<br/> </strong>
	            </p>
	            <p class="movie_option">
	                <strong>장르 : ${shopRental.mv_rt_genre} (${shopRental.mv_rt_runTime}분)</strong>
	            </p>
	            <p class="movie_option">
	                <strong>등급 : ${shopRental.mv_rt_age}이용가, ${shopRental.mv_rt_state}</strong>
	            </p>
	            <p class="movie_option">
	                <strong>개봉일 : ${shopRental.mv_rt_date.toLocaleString().replaceFirst("오전 12:00:00","")}</strong>
	            </p>
	            <br/>
	            <div class="down_btn">
	            	<c:choose>
						<c:when test="${sessionScope['Smember'] ne null }">
							<input type="hidden" name="mv_rt_no" id="mv_rt_no" value="${shopRental.mv_rt_no}">
							<input type="hidden" name="mv_rt_name" id="mv_rt_name" value="${shopRental.mv_rt_name}">
							<input type="hidden" name="price" id="price" value="2300">
							<input type="hidden" name="way" id="way" value="pay_success">
							<c:choose>
								<c:when test="${pay_ok ne 'pay_success' }">
									<input class="btn1" id="order" type="button" value="대여하기" onclick="iamport()">
								</c:when>
								<c:otherwise>
									<a href="shop_list_choice?pageno=1"><input class="btn1" id="back" type="button" value="리스트 이동"></a>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
						    <a class="btn2"><span> </span>대여금지</a>
						</c:otherwise>
					</c:choose>
	            </div>
	            <br>
	            <div><span style="color: red; font-size: 14px; font-weight: bold;"> ( * '대여하기' 시 풀영상이 제공됩니다. ) </span></div>
	        </div>
	        
	        <div class="clearfix"></div>
	                
	        <p class="m_4">${shopRental.mv_rt_info}</p>
	    </div>
    </form>
    <div class="clearfix"></div>
</div>
