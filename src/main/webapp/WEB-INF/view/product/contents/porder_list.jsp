<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.movie-test{
		width: 48%;
	    float: left;
	    margin-bottom: 8px;
	    margin-left: 17px;
	}
	
	#pname{
		display: inline-block;
	}
</style>
  
<script>
 	  $(function() {
		 $('input[name=pp]').click(function() {
			console.log($(this).val());
 			if(confirm("삭제하시겠습니까?") ==true){ 
				location.href="porder_delete?po_no="+$(this).val();
 			}else{
 				return false;
 			}
		})
   	});
	function previous() {location.href = "member_mypage";} 
</script>

<div class="content">
	<h2 class="m_3">
		<strong>주문리스트</strong>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
		<button onclick="previous();">← 뒤로가기</button>
	</h2>
	<div class="movie_top">
		<c:forEach var="porder" items="${po_list}" varStatus="status">
			<div class="movie movie-test movie-test-dark movie-test-left" style="border: 1px solid gray;">
				<div class="movie__images">
					<img width="450px" alt="" src="${porder.p_image}"
						class="img-responsive" alt="" />
				</div>
				<div class="movie__info">
					<strong id="pname" style="width: 160px; margin-right: 100px;">상품이름:${porder.p_name}</strong>
					<input type="image" src="images/xbtn.PNG" name='pp' id='pp' value="${porder.po_no}">
					<p class="movie__option">
						<strong>판매가 : ${porder.p_price}원</strong><br/>
						<strong>수량 : ${porder.po_count}개</strong><br/>
						<strong>주문날짜:${porder.po_date}</strong><br/>
						<strong>총 합계 : ${porder.p_price * porder.po_count}원</strong><br/>
					</p>
					<ul class="list_6"></ul>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="clearfix"></div>
</div>
