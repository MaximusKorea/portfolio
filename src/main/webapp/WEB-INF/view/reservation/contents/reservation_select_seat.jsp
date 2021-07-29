<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="domain.schedule.MovieSchedule"%>
<%@ page import="java.util.List"%>
<%@ page import="service.reservation.ReservationService"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 - 좌석 선택</title>
<script src="js/seat.js"></script>

<style type="text/css">
	*, *:before, *:after {
	  box-sizing: border-box;
	}
	html {
	  font-size: 16px;
	}
	.B {
		background-color: lightgray;
	}
	.plane {
	  margin: 20px auto;
	  max-width: 600px;
	  background-color: lightgray;
	}
	.exit {
	  position: relative;
	  height: 50px;
	}
	.exit:before, .exit:after {
	  content: "EXIT";
	  font-size: 14px;
	  line-height: 18px;
	  padding: 0px 2px;
	  font-family: "Arial Narrow", Arial, sans-serif;
	  display: block;
	  position: absolute;
	  background: green;
	  color: white;
	  top: 50%;
	  transform: translate(0, -50%);
	}
	.exit:before {
	  left: 0;
	}
	.exit:after {
	  right: 0;
	}
	.screen{
	  border: 1px solid gray;
	  background-color: gray;
	  font-size: 16px;
	  color: white;
	}
	.btn2 {
		padding:6px 20px;
		outline: none;
		margin-right: -10px;
		margin-bottom: 10px;
		font-size: 1.2em;
		color:#fff;
		text-decoration: none;
		text-transform: uppercase;
		background: #232cd8;
	}
	ol {
	  list-style: none;
	  width: 400px;  
	  padding: 0;
	  margin: 0;
	}
	.seats {
	  display: flex;
	  flex-direction: row;
	  flex-wrap: nowrap;
	  justify-content: flex-start;
	}
	.seat {
	  display: flex;
	  flex: 0 0 14.28571428571429%;
	  padding: 5px;
	  position: relative;
	}
	.seat:nth-child(3) {
	  margin-right: 14.28571428571429%;
	}
	.seat:nth-child(6) {
	  margin-right: 14.28571428571429%;
	}
	.seat input[type=checkbox] {
	  position: absolute;
	  opacity: 0;
	}
	.seat input[type=checkbox]:checked + label {
	  background: #bada55;
	  -webkit-animation-name: rubberBand;
	  animation-name: rubberBand;
	  animation-duration: 300ms;
	  animation-fill-mode: both;
	}
	.seat input[type=checkbox]:disabled + label {
	  background: #dddddd;
	  text-indent: -9999px;
	  overflow: hidden;
	}
	.seat input[type=checkbox]:disabled + label:after {
	  content: "X";
	  text-indent: 0;
	  position: absolute;
	  top: 4px;
	  left: 50%;
	  transform: translate(-50%, 0%);
	}
	.seat input[type=checkbox]:disabled + label:hover {
	  box-shadow: none;
	  cursor: not-allowed;
	}
	.seat label {
	  display: block;
	  position: relative;
	  width: 100%;
	  text-align: center;
	  font-size: 14px;
	  color: black;
	  font-weight: bold;
	  line-height: 1.5rem;
	  padding: 4px 0;
	  background: #F42536;
	  border-radius: 5px;
	  animation-duration: 300ms;
	  animation-fill-mode: both;
	}
	.seat label:before {
	  content: "";
	  position: absolute;
	  width: 75%;
	  height: 75%;
	  top: 1px;
	  left: 50%;
	  transform: translate(-50%, 0%);
	  background: rgba(255, 255, 255, 0.4);
	  border-radius: 3px;
	}
	.seat label:hover {
	  cursor: pointer;
	  box-shadow: 0 0 0px 2px #5C6AFF;
	}
	@-webkit-keyframes rubberBand {
	  0% {
	    -webkit-transform: scale3d(1, 1, 1);
	    transform: scale3d(1, 1, 1);
	  }
	  30% {
	    -webkit-transform: scale3d(1.25, 0.75, 1);
	    transform: scale3d(1.25, 0.75, 1);
	  }
	  40% {
	    -webkit-transform: scale3d(0.75, 1.25, 1);
	    transform: scale3d(0.75, 1.25, 1);
	  }
	  50% {
	    -webkit-transform: scale3d(1.15, 0.85, 1);
	    transform: scale3d(1.15, 0.85, 1);
	  }
	  65% {
	    -webkit-transform: scale3d(0.95, 1.05, 1);
	    transform: scale3d(0.95, 1.05, 1);
	  }
	  75% {
	    -webkit-transform: scale3d(1.05, 0.95, 1);
	    transform: scale3d(1.05, 0.95, 1);
	  }
	  100% {
	    -webkit-transform: scale3d(1, 1, 1);
	    transform: scale3d(1, 1, 1);
	  }
	}
	@keyframes rubberBand {
	  0% {
	    -webkit-transform: scale3d(1, 1, 1);
	    transform: scale3d(1, 1, 1);
	  }
	  30% {
	    -webkit-transform: scale3d(1.25, 0.75, 1);
	    transform: scale3d(1.25, 0.75, 1);
	  }
	  40% {
	    -webkit-transform: scale3d(0.75, 1.25, 1);
	    transform: scale3d(0.75, 1.25, 1);
	  }
	  50% {
	    -webkit-transform: scale3d(1.15, 0.85, 1);
	    transform: scale3d(1.15, 0.85, 1);
	  }
	  65% {
	    -webkit-transform: scale3d(0.95, 1.05, 1);
	    transform: scale3d(0.95, 1.05, 1);
	  }
	  75% {
	    -webkit-transform: scale3d(1.05, 0.95, 1);
	    transform: scale3d(1.05, 0.95, 1);
	  }
	  100% {
	    -webkit-transform: scale3d(1, 1, 1);
	    transform: scale3d(1, 1, 1);
	  }
	}
	.rubberBand {
	  -webkit-animation-name: rubberBand;
	  animation-name: rubberBand;
	}
	h5 {
		color: lightgray; 
	}
</style>
</head>
<body>
	<div class="B">
		<div class="plane">
		<h5 align="center">1</h5>
		<div class="screen" align="center">SCREEN</div>
		<div class="exit exit--front fuselage"></div>
			<form id="f" name="f">
				<ol class="cabin fuselage">
					<li class="row row--1">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--2">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--3">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--4">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--5">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--6">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--7">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--8">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--9">
						<ol class="seats" type="A">

						</ol>
					</li>
					<li class="row row--10">
						<ol class="seats" type="A">

						</ol>
					</li>
				</ol>
				<div class="exit exit--back fuselage"></div>
				<div class="info_h">
					<input type="hidden" id="mv_no" name="mv_no" value="${MovieSchedule.mv_no}">
					<input type="hidden" id="mvs_date" name="mvs_date" value="${MovieSchedule.mvs_date}">
					<input type="hidden" id="mvs_time" name="mvs_time" value="${MovieSchedule.mvs_time}">
					<input type="hidden" id="mvs_theater" name="mvs_theater" value="${MovieSchedule.mvs_theater}">
					<input type="hidden" id="r_count" name="r_count" value="${r_count}">
					<input type="hidden" id="r_scount" name="r_scount" value="${r_scount}">
					<input type="hidden" id="price" name="price" value="${price}">
				</div>
				<div align="right">
					<input class="btn2" type="button" value="결제하기" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>