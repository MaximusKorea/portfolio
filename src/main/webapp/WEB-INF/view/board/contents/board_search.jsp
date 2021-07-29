<%@ page import="pagebean.ListResultBeanType"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<style type="text/css">
	#containerboard {
		background-color: white;
	}
</style>
<script type="text/javascript">
	function boardCreate() {
		location.href = "board_write";
	}
	function previous() { 
		location.href = "index";
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<div id="containerboard">
		<div id="wrapper">
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0 width="100%">
					<tr>
						<td>
						<br/>
							<table style="padding-left: 10px; background-color: white" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td height="22">&nbsp;&nbsp; <b>게시판-리스트 - ${boardListPage.board_type}</b></td>
								</tr>
								<c:if test="${sessionScope['sUserId'] eq 'admin'}">
									<tr>
										<td height="20" class="t1" align="right" valign="bottom">♠총
											<font color="#FF0000">${boardListPage.totalRecordCount}</font> 건 | 현재페이지(
											<font color="#FF0000">${boardListPage.selectPageNo}</font> /
											<font color="#0000FF">${boardListPage.totalPageCount }</font> )
										</td>
									</tr>
								</c:if>
							</table>
							<br/>
							<form name="select" method="get">
								<table>
									<tr>
										<th><font size="2">게시글 검색</font></th>
										<td bgcolor="white" width="10">
											<select name="selectType" size="1" class="TXTFLD">
												<option value="CONTENT">내용</option>
												<option value="TITLE">제목</option>
											</select>
										</td>
										<%--
										<input type="hidden" name="pageno" value="1"></td>
										<input type="hidden" name="board_type" value="${boardListPage.board_type}"></td>
										<input type="hidden" name="board_writer" value="${boardListPage.board_writer}"></td>
										--%>
										<td><input type="text" name="search" align="left" ></td>
										<td><input type="button" value="검색" align="right"></td>
									</tr>
								</table>
							</form>
							<form name="f" method="post" action="">
								<table border="1" cellpadding="0" cellspacing="1" width="100%" bgcolor="BBBBBB">
									<tr bgcolor="gray">
										<td width=70 align=center>번호</td>
										<td width=360 align=center>제목</td>
										<td width=120 align=center>글쓴이</td>
										<td width=120 align=center>글쓴날</td>
										<td width=70 align=center>조회수</td>
									</tr>
									<c:forEach var="list" items="${boardListPage.list}" varStatus="status">
										<tr>
											<td width=70 bgcolor="ffffff" style="padding-left: 10px" align="left">${list.board_no}</td>
											<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
												<a href='board_view?board_no=${list.board_no}&pageno=${boardListPage.selectPageNo}&board_type=${list.board_type}'>${list.board_title}</a>
											</td>
											<td width=120 align=center bgcolor="ffffff">
												<a href='board_view?board_no=${list.board_no}&pageno=${boardListPage.selectPageNo}&board_type=${list.board_type}'>${list.board_writer}</a>
											</td>
											<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">${list.board_regDate.toLocaleString()}</td>
											<td width=70 bgcolor="ffffff" align="center">${list.readCount}</td>
										</tr>
									</c:forEach>
								</table>
							</form>
							<br>
							<c:if test="${boardListPage.board_type ne '1:1'}">
								<table border="0" cellpadding="0" cellspacing="1" width="100%">
									<tr>
										<td align="center">
										<c:if test="${boardListPage.showFirst}">
											<a href="board_list?pageno=1">◀◀</a>&nbsp; 
										</c:if>
										<c:if test="${boardListPage.showPreviousGroup}">
											<a href="board_list?pageno=${boardListPage.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
										</c:if>
										<c:forEach var="listPage" begin="${boardListPage.startPageNo}" end="${boardListPage.endPageNo}" varStatus="status">
											<c:if test="${boardListPage.selectPageNo == status.index}">
												<font color='red'><strong>${status.index}</strong></font>&nbsp;
											</c:if>
											<c:if test="${boardListPage.selectPageNo != status.index}">
												<a href="board_list?pageno=${status.index}&board_type=${boardListPage.board_type}"><strong>${status.index}</strong></a>&nbsp;
											</c:if>
										</c:forEach>
										<c:if test="${boardListPage.showNextGroup}">
											<a href="board_list?pageno=${boardListPage.nextGroupStartPageNo}">▶&nbsp;</a>
										</c:if>
										<c:if test="${boardListPage.showLast}">
											<a href="board_list?pageno=${boardListPage.totalPageCount}">▶▶</a>&nbsp;
										</c:if>
										</td>
									</tr>
								</table>
							</c:if>
							<c:if test="${boardListPage.board_type eq '1:1'}">
								<table border="0" cellpadding="0" cellspacing="1" width="100%">
									<tr>
										<td align="center">
										<c:if test="${boardListPage.showFirst}">
											<a href="board_list2?pageno=1">◀◀</a>&nbsp; 
										</c:if>
										<c:if test="${boardListPage.showPreviousGroup}">
											<a href="board_list2?pageno=${boardListPage.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
										</c:if>
										<c:forEach var="listPage" begin="${boardListPage.startPageNo}" end="${boardListPage.endPageNo}" varStatus="status">
											<c:if test="${boardListPage.selectPageNo == status.index}">
												<font color='red'><strong>${status.index}</strong></font>&nbsp;
											</c:if>
											<c:if test="${boardListPage.selectPageNo != status.index}">
												<a href="board_list2?pageno=${status.index}&board_type=${boardListPage.board_type}"><strong>${status.index}</strong></a>&nbsp;
											</c:if>
										</c:forEach>
										<c:if test="${boardListPage.showNextGroup}">
											<a href="board_list2?pageno=${boardListPage.nextGroupStartPageNo}">▶&nbsp;</a>
										</c:if>
										<c:if test="${boardListPage.showLast}">
											<a href="board_list2?pageno=${boardListPage.totalPageCount}">▶▶</a>&nbsp;
										</c:if>
										</td>
									</tr>
								</table>
							</c:if>
							<table border="0" cellpadding="0" cellspacing="1" width="100%">
								<tr>
									<td align="left"><input type="button" value="이전으로" class="btn btn-default" onclick="previous();" /></td>
									<c:if test="${boardListPage.board_type eq '1:1'}">
										<td align="right"><input type="button" value="게시물 생성" class="btn btn-default" onclick="boardCreate();" /></td>
									</c:if>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>