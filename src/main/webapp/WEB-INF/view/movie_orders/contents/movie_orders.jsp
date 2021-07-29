<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/movie_orders.css"/>

<style>
	.mss_time:nth-child(4n+1) {
		clear:both;
		margin-bottom: 20px;
	}
	
	.ms_time {
		cursor: pointer;
	}

	.btn_login {
		float: none;
	    width: 266px;
	    background: #e71a0f;
	    color: #f2f0e5;
	}
</style>
<script src="js/modal.js"></script>
<script src="js/dropdown.js"></script>
<script src="js/alert.js"></script>
<script src="js/reservation.js"></script>

<div class="content">
    <div class="row">
        <span class="title col-md-3"><h1><strong>영 화 예 매</strong></h1></span>
    </div>
    <div class="row orders-title">
        <div class="movie col-md-3">
            <span class="title">영&nbsp;&nbsp;&nbsp;&nbsp;화</span>
        </div>
        <div class="theater col-md-4">
            <span class="title">포&nbsp;스&nbsp;터</span>
        </div>
        <div class="days col-md-1">
            <span class="title">날 짜</span>
        </div>
        <div class="time col-md-4">
            <span class="title">시&nbsp;&nbsp;&nbsp;&nbsp;간</span>
        </div>
    </div>
    <div class="row orders-contents">
        <div id="movie" class="col-md-3">
            <ul>
				<li>
					<span id="movie_title">${movie.mv_name}</span>
					<span id="movie_no" hidden>${movie.mv_no}</span>
				</li>
            </ul>
        </div>
        <div id="poster" class="col-md-4">
            <div id="poster" hidden>
            	<a href="#">
            		<img src="#" width="100%" height="100%"/>
            	</a>
            </div>
        </div>
        <div id="date" class="col-md-1">
        </div>
        <div id="time" class="col-md-4">
        </div>
    </div>
    <div class="row summary">
        <div id="movie_selected" class="col-md-3">
            <div class="def">
                <span>영화선택</span>
            </div>
            <div class="cont" hidden>
                <div id="poster" class="col-md-3">
                    <a href="#">
                        <img src="#" height="90px"/>
                    </a>
                </div>
                <div id="m_detail" class="col-md-9">
                    <a href="#"><span id="m_name">' + movie.mv_name + '</span></a>
                    <br/><br/>
                    <span id="m_time">' + movie.mv_runTime + '분</span><br/><br/>
                    <span id="m_age">' + movie.mv_age + '</span><br/><br/>
                </div>
            </div>
        </div>
        <div id="day_selected" class="col-md-3">
            <div class="def">
                시간선택
            </div>
            <div class="cont">
                <div id="ms_date">
                    <span class="m_title">일시</span>
                    <span class="m_date"></span>
                </div>
                <div id="ms_time">
                    <span class="m_title">시간</span>
                    <span class="m_time"></span>
                </div>
                <br/>
                <div id="ms_theater">
                    <span class="m_title">상영관</span>
                    <span class="m_contents"></span>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
        <div class="col-md-3">
            <button id="payment" type="button" class="btn btn-primary">
                <span>인원선택</span>
            </button>
        </div>
    </div>
    <div class="clearfix"></div>
</div>


<c:if test="${empty(Smember) }">
<div id="count" class="modal fade" role="dialog">
	 <div class="modal-dialog">
		 <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">CGV회원 로그인</h4>
            </div>
            <div class="modal-body">
                <form name="f" class="form-horizontal" action="non_member_login_action">
                	<input type="text" name="mv_no" value="${movie.mv_no}" hidden>
                    <div class="form-group">
                        <label for="t_count" class="col-md-2">아이디</label>
                        <div class="col-md-5">
                            <input type="text" name="m_id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="st_count" class="col-md-2">비밀번호</label>
                        <div class="col-md-5">
                            <input type="text" name="m_pass">
                        </div>
                    </div>
                    <div>
	            		<button type="submit" title="Login" class="btn_login" style="height: 30px;"><span>로그인</span></button>
	                </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="member_write"><button id="order" role="button" class="btn btn-info">회원가입</button></a>
                <!-- <button id="order" role="button" class="btn btn-info">비회원 예매</button> -->
                <a href="member_find"><button id="order" role="button" class="btn btn-info">아아디찾기</button></a>
                <a href="memberpw_find"><button id="order" role="button" class="btn btn-info">비밀번호찾기</button></a>
                <button id="cancel" role="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
</c:if>

<c:if test="${!empty(Smember) }">
<div id="count" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">인원선택</h4>
            </div>
            <div class="modal-body">
                <form name="f" class="form-horizontal" action="">
                    <div class="form-group">
                        <label for="t_count" class="col-md-2">일반</label>
                        <div class="col-md-5">
                            <select name="t_count" id="t_count" class="form-control">
                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <label for="t_count" class="price1 col-md-3"></label>
                        <label for="t_count" class="price2 col-md-2"></label>
                    </div>
                    <div class="form-group">
                        <label for="st_count" class="col-md-2">학생</label>
                        <div class="col-md-5">
                            <select name="st_count" id="st_count" class="form-control">
                                <option>0</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <label for="st_count" class="price1 col-md-3"></label>
                        <label for="st_count" class="price2 col-md-2"></label>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div hidden class="alert alert-danger alert-dismissible col-md-8 count-alert" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    인원을 선택해주세요.
                </div>
                <span class="total_price"></span>
                <button id="order" role="button" class="btn btn-info">예매</button>
                <button id="cancel" role="button" class="btn btn-warning" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>
</c:if>

<div id="overlay">
    <span class="fa fa-refresh fa-spin"></span>
</div>