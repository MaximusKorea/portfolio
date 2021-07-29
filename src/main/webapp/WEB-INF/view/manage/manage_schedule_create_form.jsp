<%@ page import="domain.movie.Movie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/manage_styles.css" type="text/css">
<link rel=stylesheet href="css/manage.css" type="text/css">
<title>관리자 페이지 - 영화 정보</title>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/array.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		if('${msg}' != 0){
			alert('${msg}');
		}
		
		$('.check').click(function(){
			var mvs_date = $('#date').val();
			var mvs_theater = $('#theater').val();
			
			if(mvs_date=="" || mvs_theater==0){
				alert('날짜와 상영관을 선택해주세요.');
				return;
			}
			
			$('#time').children().remove();
	
			$.ajax('movie_schedule_info/' + mvs_date + '/' + mvs_theater,{
				success: function (schedule) {
					var running = parseInt($('.runtime').val()/30) + 1;
					var myList = new ArrayList();
					myList.add("06:00");
					myList.add("06:30");
					myList.add("07:00");
					myList.add("07:30");
					myList.add("08:00");
					myList.add("08:30");
					myList.add("09:00");
					myList.add("09:30");
					myList.add("10:00");
					myList.add("10:30");
					myList.add("11:00");
					myList.add("11:30");
					myList.add("12:00");
					myList.add("12:30");
					myList.add("13:00");
					myList.add("13:30");
					myList.add("14:00");
					myList.add("14:30");
					myList.add("15:00");
					myList.add("15:30");
					myList.add("16:00");
					myList.add("16:30");
					myList.add("17:00");
					myList.add("17:30");
					myList.add("18:00");
					myList.add("18:30");
					myList.add("19:00");
					myList.add("19:30");
					myList.add("20:00");
					myList.add("20:30");
					myList.add("21:00");
					myList.add("21:30");
					myList.add("22:00");
					myList.add("22:30");
					myList.add("23:00");
					myList.add("23:30");
					myList.add("24:00");
					myList.add("24:30");
	
					for (var i = 0; i < myList.size(); i++) {
						for(var j = 0; j < schedule.length; j++){
							if(myList.get(i)==schedule[j].mvs_time){
								for(var k = i; k < i+running; k++){
									myList.remove(i);
								}
							}
						}
					}
					
					if(myList.size()==0){
						$('#time').append($('<option></option>').text('----'));
						alert('해당 날짜의 상영관은 일정이 꽉 찼습니다.');
					}
					
					for (var i = 0; i < myList.size(); i++) {
						var base = $('<option></option>');
						var option = base.attr('value',myList.get(i));
						$('#time').append(option.text(myList.get(i)));
					}
		        }
		    });
		});
	});
			
	function scheduleCreate(){
		f.action = "manage_schedule_create";
		f.method = 'POST';
		f.submit();
	}
	
	function goDetail(){
		f.action = "manage_schedule_info_detail?mv_no="+${movie.mv_no};
		f.method = 'POST'
		f.submit();
	}
</script>
<style>
	.check {
		cursor: pointer;
	}
</style>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>영화일정 추가</b></td>
								</tr>
							</table>
							<form name = "f">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<input type="hidden" name="no" value="${movie.mv_no}"/>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="220" rowspan="5">${movie.mv_name}</td>
										<td width=300 align="center" bgcolor="ffffff" colspan="3" rowspan="5"><img src="${movie.mv_image}" width="200" height="220"></td>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">날짜</td>
											<td width=150 align="left" bgcolor="ffffff">
												<input type="date" name="date" id="date">
											</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">상영관</td>
											<td width=150 align="left" bgcolor="ffffff">
												<select id="theater" name="theater">
													<option value="0">----</option>
													<option value="1관">1관</option>
													<option value="2관">2관</option>
													<option value="3관">3관</option>
													<option value="4관">4관</option>
													<option value="5관">5관</option>
													<option value="6관">6관</option>
												</select>
											</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">시작시간</td>
											<td width=150 align="left" bgcolor="ffffff">
												<select id="time" name="time">
													<option value="0">----</option>
												</select>
											<span class="check">일정확인</span>
											</td>
										</tr>
										<tr>
											<td width=100 align=center bgcolor="E6ECDE" height="22">상영시간</td>
											<input type="hidden" class="runtime" value="${movie.mv_runTime}"/>
											<td width=150 align="left" bgcolor="ffffff">&nbsp;${movie.mv_runTime}분</td>
										</tr>
								</table>
							</form>
							<br/>
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="일정추가" onClick="scheduleCreate();">
									<input type="button" value="뒤로가기" onclick="goDetail();">
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