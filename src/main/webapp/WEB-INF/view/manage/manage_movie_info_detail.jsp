<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.movie.Movie"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<title>관리자 페이지 - 영화 정보 보기</title>
<script type="text/javascript">
	function golist(){
		f.action = "manage_movie_info_list?pageno=1";
		f.method="POST";
		f.submit();
	}
	function deleteMovie(){
		f.action = "manage_movie_info_delete?mv_no="+${movie.mv_no};
		f.method="POST";
		f.submit();
	}
	function modifyInfo(){
		f.action = "manage_movie_info_modify_form?mv_no="+${movie.mv_no};
		f.method="POST";
		f.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp" />
		</div>
		<div id="navigation">
			<jsp:include page="include_common_left.jsp" />
		</div>
		<div id="wrapper">
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
						<br/>
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>영화 상세페이지</b></td>
								</tr>
							</table>
							<form name = "f">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">영화 번호</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_no}번</td>
											<td width=100 align=center bgcolor="E6ECDE" height="220" rowspan="8">포스터</td>
											<td width=300 align="center" bgcolor="ffffff" colspan="3" rowspan="8"><img src="${movie.mv_image}" width="200" height="220"></td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">영화명</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_name}</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">감독</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_director}</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">배우</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_actor}</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">상영시간</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_runTime}분</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">예매율</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_reserveRate}%</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">개봉일</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_date.toLocaleString().replaceFirst("오전 12:00:00","")}</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">관람가</td>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_age}이용가</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">영화 상세정보</td>
											<td width=550 align="left" bgcolor="ffffff" colspan="6">&nbsp;${movie.mv_info}</td>
										</tr>
								</table>
							</form>
							 <br/>
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
										<input type="button" value="목록" onclick="golist();">
										<input type="button" value="수정하기" onClick="modifyInfo();">
										<input type="button" value="삭제하기" onClick="deleteMovie();">
									</td>
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