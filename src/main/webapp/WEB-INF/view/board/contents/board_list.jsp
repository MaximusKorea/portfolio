<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="pagebean.ListResultBeanType"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel=stylesheet href="css/styles.css" type="text/css">
<style type="text/css">
	#containerboard { background-color: white; }
</style>
<style>
	.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
	.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
	.map_wrap {position:relative;width:100%;height:500px;}
	#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
	.bg_white {background:#fff;}
	#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
	#menu_wrap .option{text-align: center;}
	#menu_wrap .option p {margin:10px 0;}  
	#menu_wrap .option button {margin-left:5px;}
	#placesList li {list-style: none;}
	#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
	#placesList .item span {display: block;margin-top:4px;}
	#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
	#placesList .item .info{padding:10px 0 10px 55px;}
	#placesList .info .gray {color:#8a8a8a;}
	#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
	#placesList .info .tel {color:#009900;}
	#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
	#placesList .item .marker_1 {background-position: 0 -10px;}
	#placesList .item .marker_2 {background-position: 0 -56px;}
	#placesList .item .marker_3 {background-position: 0 -102px}
	#placesList .item .marker_4 {background-position: 0 -148px;}
	#placesList .item .marker_5 {background-position: 0 -194px;}
	#placesList .item .marker_6 {background-position: 0 -240px;}
	#placesList .item .marker_7 {background-position: 0 -286px;}
	#placesList .item .marker_8 {background-position: 0 -332px;}
	#placesList .item .marker_9 {background-position: 0 -378px;}
	#placesList .item .marker_10 {background-position: 0 -423px;}
	#placesList .item .marker_11 {background-position: 0 -470px;}
	#placesList .item .marker_12 {background-position: 0 -516px;}
	#placesList .item .marker_13 {background-position: 0 -562px;}
	#placesList .item .marker_14 {background-position: 0 -608px;}
	#placesList .item .marker_15 {background-position: 0 -654px;}
	#pagination {margin:10px auto;text-align: center;}
	#pagination a {display:inline-block;margin-right:10px;}
	#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<script type="text/javascript">
	function previous() {
		location.href = "index";
	}
	function boardCreate() {
		location.href = "board_write";
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
										<font color="#FF0000">${boardListPage.totalRecordCount}
									</font> 건 | 현재페이지( <font color="#FF0000">${boardListPage.selectPageNo}
									</font> / <font color="#0000FF">${boardListPage.totalPageCount }</font>
										)
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
											<select name="selectType" size="1" class="TXTFLD">
												<option value="CONTENT">내용</option>
												<option value="TITLE">제목</option>
											</select>
										</td>
										<td><input type="hidden" name="pageno" value="1"></td>
										<td><input type="hidden" name="board_type" value="${boardListPage.board_type}"></td>
										<td><input type="text" name="search" align="left"></td>
										<td><input type="submit" value="검색" align="right"></td>
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
									<td align="left">
										<input type="button" value="이전으로" class="btn btn-default" onclick="previous();"/>
									</td>
									<td align="right">
										<input type="button" value="게시물 생성" class="btn btn-default" onclick="boardCreate();"/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

	<c:if test="${boardListPage.board_type eq '1:1'}">
		<div style="margin-top: 20px; margin-bottom: 20px; border-bottom: solid 1px #cacac1;"></div>
	
		<div class="tit-heading-wrap tit-evt" style="height: 51px; border-bottom: 3px solid #241d1e;">
		    <h3 style="color: gray;">찾아가는 길</h3>
		</div>
		<br>
		<!-- kakao map -->
		<div class="map_wrap">
		    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	
		    <div id="menu_wrap" class="bg_white">
		        <div class="option">
		            <div>
		                <form onsubmit="searchPlaces(); return false;">
		                    검색 : <input type="text" value="CGV 서울" id="keyword" size="15">
		                    <button type="submit">검색하기</button>
		                </form>
		            </div>
		        </div>
		        <hr>
		        <ul id="placesList"></ul>
		        <div id="pagination"></div>
		    </div>
		</div>
		
		<div style="margin-top: 20px; border-top: solid 1px #cacac1;"></div>
		
		<ul class="tel_inquiry" style="margin-top: 20px; list-style: none; margin-left: 0; padding-left: 0; border-left: 0;">
			<li>CGV 고객센터 : 1544-1122<span class="time">(상담가능 시간, 월~금 09:00~18:00) *이 외 시간은 자동 응답 안내 가능</span></li>
		</ul>
	</c:if>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95e529070e7d7f7895efff43950d9739&libraries=services"></script>
	<script>
	// 마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	    var keyword = document.getElementById('keyword').value;
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);
	
	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });
	
	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	</script>
	
</body>
</html>