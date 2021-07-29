<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	.row .movie:nth-child(2n+3) {
		clear: both;
	}
	
	.row .movie:nth-child(2n+1) {
		border-right: 3px solid #edeff0;
	}
	
	.row .movie:nth-child(2n) {
		border-left: 3px solid #edeff0;
	}
	
	.movie__images {
		height: 224px;
	}
	
	@media screen and (max-width: 400px) {
		.movie__images {
			height: 20px;
		}
	}
	
	@media screen and (min-width: 401px) and (max-width: 1199px) {
		.movie__images {
			height: 1px;
		}
	}
	
	.movie__images img {
		max-height: 214px;
		vertical-align: middle;
		display: inline-block;
	}
	
	.movie__images:before {
		content: ' ';
		display: inline-block;
		vertical-align: middle;
		height: 100%;
	}
	
	.ribbon {
		position: absolute;
		left: -5px;
		top: -5px;
		z-index: 1;
		overflow: hidden;
		width: 75px;
		height: 75px;
		text-align: right;
	}
	
	.ribbon span {
		font-family: 'Nanum Gothic';
		font-size: 14px;
		font-weight: bold;
		color: #000;
		text-transform: uppercase;
		text-align: center;
		line-height: 20px;
		transform: rotate(-45deg);
		width: 100px;
		display: block;
		background: #79A70A;
		background: linear-gradient(#9BC90D 0%, #79A70A 100%);
		box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
		position: absolute;
		top: 19px;
		left: -21px;
	}
	
	.ribbon span::before {
		content: "";
		position: absolute;
		left: 0px;
		top: 100%;
		z-index: -1;
		border-left: 3px solid #79A70A;
		border-right: 3px solid transparent;
		border-bottom: 3px solid transparent;
		border-top: 3px solid #79A70A;
	}
	
	.ribbon span::after {
		content: "";
		position: absolute;
		right: 0px;
		top: 100%;
		z-index: -1;
		border-left: 3px solid transparent;
		border-right: 3px solid #79A70A;
		border-bottom: 3px solid transparent;
		border-top: 3px solid #79A70A;
	}
</style>

<div class="content" style="padding-top: 1px;">
	<div class="movie_top">
		<div class="col-md-12 movie_box">
			<div class="row">
				<c:forEach var="shopRental" items="${shopRentalList.listRental}">
					<div class="movie movie-test movie-test-dark movie-test-left col-md-6">
						<div class="movie__images">
							<a href="shop_rental_view?mv_rt_no=${shopRental.mv_rt_no}" class="movie-beta__link">
								<img height="214px" alt="" src="${shopRental.mv_rt_image}" class="img-responsive" alt="" />
							</a>
						</div>
						<div class="movie__info">
							<a href="shop_rental_view?mv_rt_no=${shopRental.mv_rt_no}" class="movie__title">${shopRental.mv_rt_name}</a>
							<p class="movie__option">${shopRental.mv_rt_date.toLocaleString().replaceFirst("오전 12:00:00","")}개봉<br/>
							<p class="movie__time"><strong>${shopRental.mv_rt_runTime}분</strong></p>
							<strong>감독</strong> : ${shopRental.mv_rt_director}<br/>
							<strong>배우</strong>: ${shopRental.mv_rt_actor}<br/>
							<strong>장르</strong> : ${shopRental.mv_rt_genre}
						</div>
					</div>
				</c:forEach>
			</div>
			<table border="0" cellpadding="0" cellspacing="1" width="100%">
				<tr>
					<td align="center">
						<c:if test="${shopRentalList.showFirst}">
							<a href="shop_list_choice?pageno=1">◀◀</a>&nbsp; 
						</c:if> 
						<c:if test="${shopRentalList.showPreviousGroup}">
							<a href="shop_list_choice?pageno=${shopRentalList.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
						</c:if> 
						<c:forEach var="listPage" begin="${shopRentalList.startPageNo}" end="${shopRentalList.endPageNo}" varStatus="status">
							<c:if test="${shopRentalList.selectPageNo == status.index}">
								<font color='red'><strong>${status.index}</strong></font>&nbsp;
							</c:if>
							<c:if test="${shopRentalList.selectPageNo != status.index}">
								<a href="shop_list_choice?pageno=${status.index}"><strong>${status.index}</strong></a>&nbsp;
							</c:if>
						</c:forEach>
						<c:if test="${shopRentalList.showNextGroup}">
							<a href="shop_list_choice?pageno=${shopRentalList.nextGroupStartPageNo}">▶&nbsp;</a>
						</c:if>
						<c:if test="${shopRentalList.showLast}">
							<a href="shop_list_choice?pageno=${shopRentalList.totalPageCount}">▶▶</a>&nbsp;
						</c:if>
					</td>
				</tr>
			</table>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>