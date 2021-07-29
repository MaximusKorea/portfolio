<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.point.PointService"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${PAGE_TITLE}</title>
<style type="text/css">
	.pay {
		background: white;
	}
	
	#info_M {
		font-weight: bold;
		color: black;
		background: #ff8080;/* lightgray; */
	}
	
	#orderP {
		margin-top: 20px;
		margin-bottom: 20px;
		/* margin-left: 40px; */
	}
	
	.btn1 {
		padding:12px 20px;
		outline: none;
		margin-right: 10px;
		font-size: 1.2em;
		color:#fff;
		text-decoration: none;
		text-transform: uppercase;
		background: #d8232a;
	}
	
	table, tr, td {
		border-style: solid;
		border-color: black;
		border-width: 1px; 
		color: black;
	}
	
	tr {
		padding: 10px;
	}
</style>
<script src="js/getMovieName.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	function iamport() {
		//가맹점 식별코드
  		IMP.init('imp76326871');
  		IMP.request_pay({
			pg : 'html5_inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '영화예매', //결제창에서 보여질 이름
			amount : ${price}, //실제 결제되는 가격
			buyer_email : '${member.m_email}',
			buyer_name : '${member.m_name}',
			buyer_tel : '${member.m_phone}',
			buyer_addr : '${member.m_address1}',
			buyer_postcode : '${member.m_zipcode}',
			card_quota : [2,3,4,5,6]
		}, function(rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;

				var way;
				way = 'o';
				$.ajax('update_point/'+rsp.paid_amount+'/'+way,{
					success : function(result){
						alert(result+'포인트 적립되었습니다.');
					}
				});
				page_move('reserv_create', 'post');
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	
	}
</script>
</head>
<body>
	<div class="pay" align="center">
		<form name="f" id="f">
			<table width="550px" border="1px">
				<tr>
					<td id="info_M" align="center" width="250px">영화명</td>
					<td id="mv_name" width="300px" align="center"></td>
				</tr>
				<tr>
					<td id="info_M" align="center" width="250px">관람 일자</td>
					<td width="300px" align="center">${MovieSchedule.mvs_date}</td>
				</tr>
				<tr>
					<td id="info_M" align="center" width="250px">관람 시간</td>
					<td width="300px" align="center">${MovieSchedule.mvs_time}</td>
				</tr>
				<tr>
					<td id="info_M" align="center" width="250px">관람 인원</td>
					<td id="r_Tcount" width="300px" align="center">${r_count+r_scount}명</td>
				</tr>
				<tr>
					<td id="info_M" align="center" width="250px">상영관</td>
					<td width="300px" align="center">${MovieSchedule.mvs_theater}</td>
				</tr>
				<tr>
					<td id="info_M" align="center" width="250px">선택 좌석</td>
					<td width="300px" align="center">
						<%
							String r_seat = "";
							String[] selectSeat = (String[]) request.getAttribute("SelectedSeat");
							for (int i = 0; i < selectSeat.length; i++) {
								r_seat += selectSeat[i];
						 		if (i != selectSeat.length - 1) {
									r_seat += ",";
						 		}
						 	}
						 %>
						 <%=r_seat %>
					</td>
				</tr>
				<tr>
					<td id="info_M" align="center" width="250px">결제 금액</td>
					<td width="300px" align="center">${price}원</td>
				</tr>
			</table>
			<input type="hidden" name="mv_no" id="mv_no" value="${MovieSchedule.mv_no}">
			<input type="hidden" name="r_count" id="r_count" value="${r_count}">
			<input type="hidden" name="r_scount" id="r_scount" value="${r_scount}">
			<input type="hidden" name="mvs_date" id="mvs_date" value="${MovieSchedule.mvs_date}">
			<input type="hidden" name="mvs_time" id="mvs_time" value="${MovieSchedule.mvs_time}">
			<input type="hidden" name="mvs_theater" id="mvs_theater" value="${MovieSchedule.mvs_theater}">
			<input type="hidden" name="price" id="price" value="${price}">
			<input type="hidden" name="SelectedSeat" id="SelectedSeat" value="<%=r_seat%>">
			<div align="center">
				<input class="btn1" id="order" type="button" value="일반 결제">
				<input class="btn1" id="orderC" type="button" value="카드 결제" onclick="iamport()">
				<input class="btn1" id="orderP" type="button" value="포인트 결제">			
			</div>
		</form>
	</div>
</body>
</html>