<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>영화 정보 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function xSize(e){
	    e.style.height = '1px';
	    e.style.height = (e.scrollHeight + 12) + 'px';
	}
	function input(){	
		if(document.movie_info.mv_date.value == ""){
			alert("개봉 날짜를 입력해주세요.");
			movie_info.mv_name.focus();
			return false;
		}
		movie_info.action = "manage_movie_info_modify_action";
		movie_info.method="POST";
		movie_info.submit();
	}	
	function golist(){
		movie_info.action = "manage_movie_info_list?pageno=1";
		movie_info.method="POST";
		movie_info.submit();
	}
	function reset() {
		var inp = document.getElementsByTagName('input');
		for (var i=0; i<inp.length; i++) {
			if (inp[i].type == 'text' || inp[i].type == 'date') {
				inp[i].value = '';
			}
		}
		var inp = document.getElementsByTagName('textarea');
		for (var i=0; i<inp.length; i++) {
			inp[i].value = '';
		}
		$('select[name=mv_age]').val('');
		$('input[name=file]').val('');
		$("select[name=mv_age] option:eq(0)").prop("selected", true);
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp"/>
		</div>
		<div id="navigation">
			<jsp:include page="include_common_left.jsp"/>
		</div>
		<div id="wrapper">
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<br/>
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>영화 정보 입력</b></td>
								</tr>
							</table>
							<form name="movie_info" method="post" enctype="multipart/form-data">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<input type="hidden" name="mv_no" value="${movie.mv_no}">			
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">영화명</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="mv_name" value="${movie.mv_name}"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제작국가</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="mv_state" value="${movie.mv_state}"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">감독</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="mv_director" value="${movie.mv_director}"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">배우</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="mv_actor" value="${movie.mv_actor}"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상영시간</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="mv_runTime" value="${movie.mv_runTime}"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">영화정보</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<textarea name="mv_info" onkeyup="xSize(this)" style="width:300px; height:36px; overflow-y:hidden" >${movie.mv_info}</textarea></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">개봉날짜</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="date" name="mv_date"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">관람가</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<select name="mv_age">
											<option value="전체">전체</option>
											<option value="12세">12세</option>
											<option value="15세">15세</option>
											<option value="19세">19세</option>
										</select>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">영화이미지</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="file" name="file" value="${movie.mv_image}"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">트레일러(url)</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px"
										><input type="text" name="mv_trailer" value="${movie.mv_trailer}"></input></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">장르</td>
										<td width=490 align="left" bgcolor="ffffff" style="padding-left: 10px">
										<input type="text" name="mv_genre" value="${movie.mv_genre}"></input></td>
									</tr>
								</table>
							</form>
							<br/>
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
										<input type="button" value="목록" onclick="golist();">
										<input type="reset" onclick="reset();">
										<input type="button" value="수정 완료" onClick="input();">
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