<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<link href="css/manage_styles.css" rel="stylesheet" type="text/css" />
<link href="css/manage.css" rel="stylesheet" type="text/css" />
<link href="css/manage_main_stylesheet.css" rel="stylesheet" type="text/css" />
<title>관리자 페이지</title>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function boardCreate() {
		location.href = "board_write_admin";
	}
	function previous() {
		history.go(-1)();
	}
	function getSubmit() {
		var selectForm = document.select;
		if($("select[name=searchType]").val() == 'CONTENT'){
			selectForm.action = "board_search_content";
		}else{
			selectForm.action = "board_search_title";
		}
		selectForm.submit();
	}
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp" />
		</div>
		<div id="navigation">
			<jsp:include page="include_common_left.jsp" />
		</div>
		<div id="wrapper">
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0 style="height: min-content;">
					<tr>
						<td>
						<br/>
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>게시판-리스트 - ${boardListPage.board_type}</b></td>
								</tr>
								<c:if test="${sessionScope['sUserId'] eq 'admin'}">
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">♠총
										<font color="#FF0000">${boardListPage.totalRecordCount}</font>건 | 현재페이지(
										<font color="#FF0000">${boardListPage.selectPageNo}</font>/
										<font color="#0000FF">${boardListPage.totalPageCount }</font>)
									</td>
								</tr>
								</c:if>
							</table>
							<br/>
							<form name="select" method="get" action="">
								<table>
									<tr>
										<th><font size="2">게시글 검색</font></th>
										<td bgcolor="white" width="10">
											<select name="searchType" size="1" class="TXTFLD">
												<option value="CONTENT">내용</option>
												<option value="TITLE">제목</option>
											</select>
										</td>
										<td id="test">
											<input type="hidden" name="pageno" value="1">
											<input type="hidden" name="board_type" value="${boardListPage.board_type}">
											<input type="hidden" name="board_writer" value="관리자">
											<input type="text" name="search" align="left" value="">
											<input type="submit" value="검색" align="right" onClick="getSubmit()">
										</td>
									</tr>
								</table>
							</form>
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<td width=70 align=center bgcolor="E6ECDE">번호</td>
										<td width=360 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴이</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴날</td>
										<td width=70 align=center bgcolor="E6ECDE">조회수</td>
									</tr>
									<c:forEach var="list" items="${boardListPage.list}" varStatus="status">
										<tr>
											<td width=70 bgcolor="ffffff" style="padding-left: 10px" align="left">${list.board_no}</td>
											<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
												<a href='board_view_admin?board_no=${list.board_no}&pageno=${boardListPage.selectPageNo}&board_type=${list.board_type}'>${list.board_title}</a>
											</td>
											<td width=120 align=center bgcolor="ffffff">
												<a href='board_view_admin?board_no=${list.board_no}&pageno=${boardListPage.selectPageNo}&board_type=${list.board_type}'>${list.board_writer}</a>
											</td>
											<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">${list.board_regDate.toLocaleString()}</td>
											<td width=70 bgcolor="ffffff" align="center">${list.readCount}</td>
										</tr>
									</c:forEach>
								</table>
							</form>
							<br>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
									<c:if test="${boardListPage.showFirst}">
										<a href="board_list_admin?pageno=1">◀◀</a>&nbsp; 
									</c:if>
									<c:if test="${boardListPage.showPreviousGroup}">
										<a href="board_list_admin?pageno=${boardListPage.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
									</c:if>
									<c:forEach var="listPage" begin="${boardListPage.startPageNo}" end="${boardListPage.endPageNo}" varStatus="status">
										<c:if test="${boardListPage.selectPageNo == status.index}">
											<font color='red'><strong>${status.index}</strong></font>&nbsp;
										</c:if>
										<c:if test="${boardListPage.selectPageNo != status.index}">
											<a href="board_list_admin?pageno=${status.index}&board_type=${boardListPage.board_type}"><strong>${status.index}</strong></a>&nbsp;
										</c:if>
									</c:forEach>
									<c:if test="${boardListPage.showNextGroup}">
										<a href="board_list_admin?pageno=${boardListPage.nextGroupStartPageNo}">▶&nbsp;</a>
									</c:if>
									<c:if test="${boardListPage.showLast}">
										<a href="board_list_admin?pageno=${boardListPage.totalPageCount}">▶▶</a>&nbsp;
									</c:if>
									</td>
								</tr>
							</table>
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="left"><input type="button" value="이전으로" class="btn btn-default" onclick="previous();" /></td>
									<td align="right"><input type="button" value="게시물 생성" class="btn btn-default" onclick="boardCreate();" /></td>
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