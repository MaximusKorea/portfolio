<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$(".in_view").click(function() {
			$('.in_view').removeClass('selected');
			$(this).addClass('selected');
			$(".right").css("visibility", "visible")

			var imgUrl = $('.selected #mvimg').val();
			$("#viewImg").attr("src", imgUrl)

			var mv_no = $('.selected #mvno').val();
			$.ajax('movie_join_list/' + mv_no, {
				success : function(movie) {
					$('#movie_title').text(movie.mv_name);
					$('#movie_genre').text(movie.mv_genre);
					$('#movie_info').html(movie.mv_info);
					$('#movie_runtime').text(movie.mv_runtime);
				}
			});
			var r_no = $('.selected #rno').val();
			$.ajax('reserv_cancel_ava/' + r_no, {
				success : function(r) {
					if (r != 1) {
						$('#delete').hide();
					} else {
						$('#delete').show();
					}
				}
			})
		})

		$('#delete').click(function() {
			var r_no = $('.selected #rno').val();
			var price = $('.selected #price').val();
			$.ajax('reserv_cancel/' + r_no, {
				success : function(result) {
					if (result != 0) {
						$.ajax('update_point/'+price+'/c',{
							success : function(r){
								$('.selected').remove();
								$('.infoM').remove();
								alert('예매 취소가 완료되었습니다.');
								location.reload();
							}
						})
					} else {
						alert('예매 취소 가능 기간이 아닙니다.');
					}
				}
			});
		})
		
	})
</script>

<style type="text/css">
	.rrr {
	    border: 1px solid gray;
	}
	
	.l_view {
		float: left;
		height: 600px;
	}
	
	.in_view {
		margin-left: 3px;
		border: 1px solid gray;
	}
	
	.in_view strong {
		display: inline-block;
	}
	
	.right {
		visibility: visible;
	}
</style>

<div class="l_view" style="width: 49%">
	<c:forEach var="list" items="${res.list}">
		<div class="in_view">
			<strong>상영관</strong>:${list.r_theater}<br />
			<strong>상영날짜</strong>:${list.r_viewdate}<br />
			<strong>상영시간</strong>:${list.r_time}<br /> 
			<strong>가격</strong>:${list.r_price}<br />
			<strong>관람인원</strong>:${list.r_persons}<br /> 
			<strong>영화제목</strong>:${list.mv_name}<br />
			<input type="hidden" value="${list.mv_image }" id="mvimg">
			<input type="hidden" value="${list.mv_no }" id="mvno">
			<input type="hidden" value="${list.r_no}" id="rno">
			<input type="hidden" value="${list.r_price}" id="price">
		</div>
	</c:forEach>
	<div class="clearfix"></div>
</div>

<div class="l_view" style="width: 50% ;">
	<div class="movie-test movie-test-left right" style="width: 90%; height: auto; margin-left: 20px; visibility: hidden;">
		<div class="infoM" style="height: 550px; overflow: scroll;">
			<div class="movie__images" style="display: inline-block; height: -webkit-fill-available; width: fit-content;">
				<img id="viewImg" alt="" src="" alt="" class="img-responsive" style="display: inline-block;" />
			</div>
			<br/><br/><br/>
			<strong style="margin-left: 50px;">영화제목:</strong><span id="movie_title" style="width: auto; color: black;  "></span><br/>
			<strong style="margin-left: 50px;">영화장르:</strong> <span id="movie_genre" style="width: auto; color: black;  "></span>
			<div class="movie__info" style="background:unset;">
				<p><strong style="font-size: large;"><영화 줄거리></strong></p>	
				<p id="movie_info"></p>
			</div>
			<br/>
			<div align="right">
				<button id="delete">
					<strong>예매 취소</strong>
				</button>
			</div>
		</div>
	</div>
</div>

<table border="0" cellpadding="0" cellspacing="1" width="100%">
		<tr>
			<td align="center">
				<c:if test="${res.showFirst}">
					<a href="menu?pageno=1&no=2">◀◀</a>&nbsp; 
				</c:if>
				<c:if test="${res.showPreviousGroup}">
					<a href="menu?pageno=${res.previousGroupStartPageNo}&no=2">◀</a>&nbsp;&nbsp;
				</c:if>
				<c:forEach var="listPage" begin="${res.startPageNo}" end="${res.endPageNo}" varStatus="status">
					<c:if test="${res.selectPageNo == status.index}">
						<font color='red'><strong>${status.index}</strong></font>&nbsp;
					</c:if>
					<c:if test="${res.selectPageNo != status.index}">
						<a href="menu?pageno=${status.index}&no=2"><strong>${status.index}</strong></a>&nbsp;
					</c:if>
				</c:forEach>
				<c:if test="${res.showNextGroup}">
					<a href="menu?pageno=${res.nextGroupStartPageNo}&no=2">▶&nbsp;</a>
				</c:if>
				<c:if test="${res.showLast}">
					<a href="menu?pageno=${res.totalPageCount}&no=2">▶▶</a>&nbsp;
				</c:if>
			</td>
		</tr>
	</table>
<div class="clearfix"></div>