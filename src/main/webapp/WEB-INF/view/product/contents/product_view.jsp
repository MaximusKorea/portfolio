<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript">
	function counting(num) {
		var x = document.f;
		var y = Number(x.count.value) + num;
		if (y < 1)
			y = 1;
		x.count.value = y;

		$('#tot').text(document.f.calc.value * y);
	}

    $(function() {
		$('#orderBtn').click(function() {
			var y1 = document.f.count.value;
			
			if(y1 == ""){
				alert("상품은 한개이상 선택해야합니다.");
				return false;
			}
			
	 	 	if(${op} == 2){
				alert('주문이 확인되었습니다.');
				var x1 = document.f.count.value;
				location.href = "porder_finish?p_no="+${product.p_no}+"&count="+x1;
			}else{
				alert('로그인해주세요');
			} 
			 
		})
	});
</script>

<div class="content">
	<div class="movie_top">
		<div class="col-md-6 movie_box">
			<div>
				<div class="movie_image">
					<img src="${product.p_image}" class="img-responsive" alt="" />
				</div>
				<form action="" class="sky-form">
					<fieldset></fieldset>
				</form>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="desc1 col-md-6">
			<p class="movie_option">
				<strong><h1>${product.p_name}</h1></strong>
			</p>
			<br/>

			<p class="movie__option" style="font-size: 25px">
				<strong>판매가 : ${product.p_price}원</strong>
			<hr/>
			</p>
			<br/>
			<p class="movie_option">
				<strong><h3>상품설명</h3></strong><br /> <br/>${product.p_content}<br/>
			</p>
			<br/><br/><br/>

			<form name="f">
				<input type="hidden" value="${product.p_price}" name="calc">
				<table>
					<h3>
						<strong>수량&nbsp;&nbsp;&nbsp;</strong>
						<img src='images/minus.PNG' onclick='counting(-1);'>
						<input type='text' name='count' value='' size='6' readonly>
						<img src='images/plus.PNG' onclick='counting(1);' style="border-top:">
						<br/><br/>
						총 금액 &nbsp;&nbsp;&nbsp;<span id="tot" style="color: red;"></span>
					</h3>
				</table>
			</form>
			<br/>
		</div>

		<div class="clearfix"></div>
		<p class="m_4"></p>
		<ul>
			<h4><strong>상품이용안내</strong></h4>
			<li><strong>구매 후 전송 받으신 기프트콘 중,</strong><br /> 매점상품: 매점상품은 각
				영화관의 매점에서 실제 상품으로 교환하실 수 있습니다.<br /> (각 영화관 매점에서 기프트콘 제시 > 해당 매점
				제품으로 교환)<br /> 콤보 中 팝콘을 고소팝콘 이외의 팝콘으로 바꿀 경우, 추가 비용이 발생할 수 있습니다. <br />
				영화관람권: 영화관람권은 홈페이지, 영화관 매표소를 통해 영화를 예매하실 수 있습니다.<br />
			</li>
			<li><strong>기프트콘 상품은 일부극장에서 사용이 불가능합니다.</strong><br /> 기프트콘 상품은
				현금으로 환불은 불가능합니다.<br />
			</li>
			<li><strong>기프트콘은 부분 환불이 불가합니다.</strong><br /> 기프트콘의 사용기한은 기프트콘
				발송일로부터 6개월입니다.<br />
			</li>
		</ul>

		<form method="post" action="contact-post.html">
			<div class="clearfix"></div>
		</form>
	</div>

	<div class="down_btn2">
		<a class="btn1" href="product_list?p_type=${product.p_type}"><span></span>목록으로</a>
		<input type="button" id="orderBtn" class="btn1" value="주문하기"><span></span>
	</div>

	<div class="clearfix"></div>
</div>
