<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
 	$(function() {
	 	$('#comboBtn').click(function() { location.href="product_list?p_type=1"; })
	 	$('#popBtn').click(function() { location.href="product_list?p_type="+2; })
	 	$('#bevBtn').click(function() { location.href="product_list?p_type="+3; })
	 	$('#snBtn').click(function() { location.href="product_list?p_type="+4; })
	});
</script>
 <style>
	.bttn{
		margin-left:320px ;
	}
	.btn{
		background-color: pink;
		width: 100px;
		height: 100px;
	}
	.movie:nth-child(2n+3) {
		clear: both;
	}
	.movie {
		width: 49%;
		margin-right: 8px;
	}
</style>

<div class="content">
	<input type="button" id="comboBtn" class="btn btn-default bttn" value="COMBO" style="font-weight: bolder;">
	<button type="button" id="popBtn" class="btn btn-default" style="font-weight: bolder;">POPCORN</button>
	<button type="button" id="bevBtn" class="btn btn-default" style="font-weight: bolder;">BEVERAGE</button>
	<button type="button" id="snBtn" class="btn btn-default" style="font-weight: bolder;">SNACK</button>
	<h2 class="m_3">
		<strong>SNACK BAR</strong>
	</h2>
	<div class="movie_top">
		<c:forEach var="product" items="${p_list}">
			<div class="movie movie-test movie-test-dark movie-test-left">
				<div class="movie__images">
					<a href="product_view?p_no=${product.p_no}" class="movie-beta__link"> <img width="450px" alt="" src="${product.p_image}" class="img-responsive" alt="" />
					</a>
				</div>
				<div class="movie__info">
					<a href="product_view?p_no=${product.p_no}" class="movie__title">${product.p_name}</a>
					<p class="movie__option">
						<strong>판매가 : ${product.p_price}원</strong><br />
					</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
		<div class="clearfix"></div>
	</div>
	<div class="clearfix"></div>
</div>