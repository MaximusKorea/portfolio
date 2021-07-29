<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.table tr>th {
		background-color: yellow;
	}
	
	.table tr>th {
		text-align: center;
	}
	
	.table tr>th:FIRST-CHILD {
		width: 20%;
	}
	
	.table tr>th:NTH-CHILD(2) {
		width: 55%;
	}
	
	.table tr>th:NTH-CHILD(3) {
		width: 25%;
	}
	
	#point {
		text-align: right;
	}
	
	.table-bordered {
		border: 1px solid red;
	}
</style>

<table class="table table-bordered">
	<tr>
		<th>날짜</th>
		<th>사용/적립내용</th>
		<th>잔여포인트</th>
	</tr>
	<c:forEach var="list" items="${pointList.list}" varStatus="status" >
		<tr>
			<c:forEach var="dt" items="${dateList}" begin="${status.index}" end="${status.index}" step='1'> 
				<td>${dt} </td>
			</c:forEach>
			<td style="text-align: center;">
				<c:if test="${list.pt_type eq 0}">
				 	+${list.pt_usedpoint} 
				 	(${list.pt_str})
				 </c:if>
				 <c:if test="${list.pt_type eq 1}">
				 	+${list.pt_usedpoint} 
				 	(${list.pt_str})
				 </c:if>
				 <c:if test="${list.pt_type eq 2}">
				 	-${list.pt_usedpoint}
				 	(${list.pt_str})
				 </c:if>
			</td>
			<td id="point">
				<c:set var="tot" value="${list.pt_point}"></c:set>
				<c:out value="${tot}"></c:out>
			</td>
		</tr>
	</c:forEach>
	
	<table border="0" cellpadding="0" cellspacing="1" width="100%">
		<tr>
			<td align="center">
			<c:if test="${pointList.showFirst}">
				<a href="menu?pageno=1&no=5">◀◀</a>&nbsp; 
			</c:if> 
			
			<c:if test="${pointList.showPreviousGroup}">
				<a href="menu?pageno=${pointList.previousGroupStartPageNo}&no=5">◀</a>&nbsp;&nbsp;
			</c:if> 
			
			<c:forEach var="listPage" begin="${pointList.startPageNo}" end="${pointList.endPageNo}" varStatus="status">
				<c:if test="${pointList.selectPageNo == status.index}">
					<font color='red'><strong>${status.index}</strong></font>&nbsp;
				</c:if>
					
				<c:if test="${pointList.selectPageNo != status.index}">
					<a href="menu?pageno=${status.index}&no=5"><strong>${status.index}</strong></a>&nbsp;
				</c:if>
			</c:forEach> 
			<c:if test="${pointList.showNextGroup}">
				<a href="menu?pageno=${pointList.nextGroupStartPageNo}&no=5">▶&nbsp;</a>
			</c:if>
			<c:if test="${pointList.showLast}">
				<a href="menu?pageno=${pointList.totalPageCount}&no=5">▶▶</a>&nbsp;
			</c:if>
			</td>
		</tr>
	</table>
	
</table>