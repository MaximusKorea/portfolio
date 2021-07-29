<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="pagebean.ListResultBeanBasic"%>

<% ListResultBeanBasic movieList = (ListResultBeanBasic) request.getAttribute("movieList");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="css/manage_styles.css" rel="stylesheet" type="text/css" />
<link href="css/manage.css" rel="stylesheet" type="text/css" />
<link href="css/manage_main_stylesheet.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script>
	$(function() {
		$('#updateRate').click(function(){
			$('#updateRate').attr('disabled', 'disabled');
			$.ajax('getMvnoList',{
				success : function(mv_noA){
					for(var i=0; i<mv_noA.length; i++){
						mv_no = mv_noA[i];
						$.ajax('update_reservrate/'+mv_no,{
							success : function(result){
								$('#updateRate').removeAttr('disabled');
								location.reload();
							}
						})
					}
				}
			})
		})
	})
</script>
<title>관리자 페이지</title>
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
				<table id="pi" border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<br/>
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>예매 현황</b></td>
								</tr>
							</table>
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<div id="q1_2005">
											<div id="slider">
												<div id="pie_chart">
													<ul>
														<li id="c1_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c1_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c2_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c2_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c3_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c3_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c4_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c4_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c5_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c5_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c56_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c6_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c7_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c7_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c8_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c8_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c9_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c9_l">
															<p><span class="pie_right"></span></p>
														</li>
														<li id="c10_r">
															<p><span class="pie_left"></span></p>
														</li>
														<li id="c10_l">
															<p><span class="pie_right"></span></p>
														</li>
													</ul>
												</div>
											</div>
											
											<p>버튼을 누른 후 새로고침!</p>
											<button id="updateRate">예매율 갱신</button>
											
											<div id="percentage_lable_box">
												<div id="labels">
													<ul>
													<% for(int i = 0; i < movieList.getEndRowNum(); i++){%>
														<li><span></span><%=movieList.getList().get(i).getMv_name()%></li>
													<% } %>
													</ul>
												</div>
												<div id="percentage_wrapper">
													<div id="percentage">
													<%for(int i = 0; i < movieList.getEndRowNum(); i++){%>
														<p><%=movieList.getList().get(i).getMv_reserveRate()%> %</p>
													<% } %>
													</div>
												</div>
											</div>
										</div>
									</tr>
								</table>
							</form>
							<br/>
							<table border="0" cellpadding="0" cellspacing="1"></table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>