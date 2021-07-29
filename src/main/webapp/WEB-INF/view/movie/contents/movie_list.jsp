<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" />
<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css" />
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.plugin/jquery.validate.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.ui/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="https://img.cgv.co.kr/R2014/js/jquery.utils.js"></script>

<style>
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	.row .movie:nth-child(2n+3) {
		clear: both;
	}
	
	.row .movie:nth-child(2n+1) {
		border-right: 3px solid #edeff0;
	}
	
	.row .movie:nth-child(2n) {
		border-left: 3px solid #edeff0;
	}
	
	.movie__images {
		height: 224px;
	}
	
	@media screen and (max-width: 400px) {
		.movie__images {
			height: 20px;
		}
	}
	
	@media screen and (min-width: 401px) and (max-width: 1199px) {
		.movie__images {
			height: 1px;
		}
	}
	
	.movie__images img {
		max-height: 214px;
		vertical-align: middle;
		display: inline-block;
	}
	
	.movie__images:before {
		content: ' ';
		display: inline-block;
		vertical-align: middle;
		height: 100%;
	}
	
	.ribbon {
		position: absolute;
		left: -5px;
		top: -5px;
		z-index: 1;
		overflow: hidden;
		width: 75px;
		height: 75px;
		text-align: right;
	}
	
	.ribbon span {
		font-family: 'Nanum Gothic';
		font-size: 14px;
		font-weight: bold;
		color: #000;
		text-transform: uppercase;
		text-align: center;
		line-height: 20px;
		transform: rotate(-45deg);
		width: 100px;
		display: block;
		background: #79A70A;
		background: linear-gradient(#9BC90D 0%, #79A70A 100%);
		box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
		position: absolute;
		top: 19px;
		left: -21px;
	}
	
	.ribbon span::before {
		content: "";
		position: absolute;
		left: 0px;
		top: 100%;
		z-index: -1;
		border-left: 3px solid #79A70A;
		border-right: 3px solid transparent;
		border-bottom: 3px solid transparent;
		border-top: 3px solid #79A70A;
	}
	
	.ribbon span::after {
		content: "";
		position: absolute;
		right: 0px;
		top: 100%;
		z-index: -1;
		border-left: 3px solid transparent;
		border-right: 3px solid #79A70A;
		border-bottom: 3px solid transparent;
		border-top: 3px solid #79A70A;
	}
</style>

<!-- 무비 파인더 START -->
<style>
	div[class^="sect-"] {
	    clear: both;
	    zoom: 1;
	}
	.sect-finder {
	    width: 1100px;
	    height: 480px;
	    background: #29353d;
	    margin:0 auto; 
	}
	.sect-finder h3 {
	    height: auto;
	    margin: 0;
	    padding: 15px 0 10px;
	    background: none;
	    line-height: 1.2;
	}
	h3 {
	    text-align: center;
	    font-weight: 500;
	}
	legend {
	    font: 0/0 a;
	    position: absolute;
	    right: -999em;
	    top: -999em;
	    zoom: 1;
	}
	table caption {
	    font: 0/0 a;
	    zoom: 1;
	}
	caption, th, td {
	    font-weight: 300;
	    line-height: 1.5em;
	    text-align: center;
	    vertical-align: middle;
	}
	.sect-finder table .finder-col01 {
	    width: 107px;
	}
	col {
	    display: table-column;
	}
	.sect-finder table {
	    border-collapse: collapse;
	}
	body, input, textarea, select, button, table {
	    font-size: 13px;
	    line-height: 1.2;
	    color: #666;
	    /* font-family: 'CJONLYONENEW', '맑은 고딕', '돋움', Dotum, sans-serif; */
	    /* font-weight: 300; */
	}
	table {
	    border-spacing: 0;
	}
	html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
	    font-size: 100%;
	    margin: 0;
	    padding: 0;
	    border: 0;
	    vertical-align: baseline;
	    word-break: break-all;
	}
	tbody {
	    display: table-row-group;
	}
	tr {
	    display: table-row;
	}
	.sect-finder th {
	    padding-left: 34px;
	    text-align: left;
	}
	.sect-finder th, .sect-finder td {
	    padding: 11px 0;
	    border-top: 1px solid #3e484f;
	    color: #fdfcf0;
	    font-size: 13px;
	    vertical-align: middle;
	}
	ol, ul {
	    list-style: none;
	}
	.sect-finder td ul:first-child li:first-child {
	    width: 14%;
	    margin: 0;
	}
	.sect-finder td li {
	    float: left;
	    width: 14%;
	}
	input, select, img {
	    vertical-align: middle;
	}
	button, input {
	    overflow: visible;
	}
	input[type="checkbox" i] {
	    background-color: initial;
	    cursor: default;
	    appearance: auto;
	    box-sizing: border-box;
	    margin: 3px 3px 3px 4px;
	    padding: initial;
	    border: initial;
	}
	input {
	    -webkit-writing-mode: horizontal-tb !important;
	    text-rendering: auto;
	    letter-spacing: normal;
	    word-spacing: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    display: inline-block;
	    text-align: start;
	    -webkit-rtl-ordering: logical;
	    font: 400 13.3333px Arial;
	}
	.sect-finder td label {
	    display: inline-block;
	    padding: 1px 0;
	}
	.sect-finder td .collage {
	    color: #23b7e8;
	    width: 86%;
	}
	.sect-finder .slider-range {
	    width: 328px;
	    margin-right: 30px;
	}
	.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {
	    border-bottom-right-radius: 4px;
	}
	.ui-corner-all, .ui-corner-bottom, .ui-corner-left, .ui-corner-bl {
	    border-bottom-left-radius: 4px;
	}
	.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {
	    border-top-right-radius: 4px;
	}
	.ui-corner-all, .ui-corner-top, .ui-corner-left, .ui-corner-tl {
	    border-top-left-radius: 4px;
	}
	.ui-widget-content {
	    border: 1px solid #aaa;
	    color: #222;
	}
	.ui-widget {
	    font-family: Verdana,Arial,sans-serif;
	    font-size: 1.1em;
	}
	.ui-slider-horizontal {
	    height: .8em;
	}
	.ui-slider {
	    position: relative;
	    text-align: left;
	}
	.slider-range {
	    display: inline-block;
	    height: 1px !important;
	    margin: 10px 0;
	    background: #101518 !important;
	    vertical-align: top;
	}
	.sect-finder .yeartype + td ul {
	    margin: 0 -21px 0 -21px;
	}
	.sect-finder th.yeartype + td li:first-child {
	    width: 41px;
	}
	.sect-finder .yeartype + td li {
	    position: relative;
	    width: 41px;
	    padding-top: 10px;
	    color: #d3d3cb;
	    font-size: 9px;
	    font-family: Verdana, Geneva, sans-serif;
	    text-align: center;
	}
	.sect-finder .yeartype + td li:after {
	    content: '';
	    position: absolute;
	    top: 11px;
	    left: 50%;
	    width: 1px;
	    height: 3px;
	    background: #d3d4cc;
	}
	.ui-slider .ui-slider-range {
	    position: absolute;
	    z-index: 1;
	    font-size: .7em;
	    display: block;
	    border: 0;
	}
	.slider-range .ui-slider-range {
	    top: -1px !important;
	    height: 3px !important;
	    background: #e71a0f !important;
	}
	.ui-slider .ui-slider-handle {
	    position: absolute;
	    z-index: 2;
	    cursor: default;
	}
	.slider-range .ui-slider-handle {
	    top: -10px !important;
	    width: 22px !important;
	    height: 22px !important;
	    margin-left: -11px !important;
	    border: none !important;
	    background: url(https://img.cgv.co.kr/R2014/images/sprite/sprite_btn.png) 0 -37px no-repeat !important;
	    font: 0/0 a;
	    zoom: 1;
	}
	.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default {
	    font-weight: normal;
	    color: #555;
	}
	input[type='text'], input[type='password'] {
	    display: inline-block;
	    height: 25px;
	    line-height: 22px;
	    padding-left: 10px;
	    border: 1px solid #b5b5b5;
	}
	input[type="text" i] {
	    padding: 1px 2px;
	}
	.sect-finder .wrap-submit {
	    padding-top: 10px;
	    text-align: center;
	}
	.sect-finder .wrap-submit .round {
	    width: 71px;
	}
	.sect-finder .wrap-submit > button {
	    margin: 0 3px;
	}
	.round.inred {
	    background: #e71a0f;
	    border: 2px solid #e71a0f;
	    color: #ffffff;
	    line-height: 21px;
	}
	.round {
	    line-height: 23px;
	    font-weight: 500;
	    font-size: 12px;
	    text-align: center;
	    vertical-align: middle;
	}
	.round, .round > * {
	    display: inline-block;
	    position: relative;
	}
	button {
	    appearance: auto;
	    -webkit-writing-mode: horizontal-tb !important;
	    text-rendering: auto;
	    letter-spacing: normal;
	    word-spacing: normal;
	    text-transform: none;
	    text-indent: 0px;
	    text-shadow: none;
	    align-items: flex-start;
	    box-sizing: border-box;
	    font: 400 13.3333px Arial;
	}
	.sect-finder .wrap-submit .round.inred:before, .sect-finder .wrap-submit .round.inred:after, .sect-finder .wrap-submit .round.inred > *:before, .sect-finder .wrap-submit .round.inred > *:after {
	    background-color: #29353d;
	}
	.round.inred:before {
	    left: -2px;
	    top: -2px;
	    background-position: 0 -10px;
	    z-index: 1;
	}
	.round:before, .round:after, .round > *:before, .round > *:after {
	    content: '';
	    display: block;
	    position: absolute;
	    width: 5px;
	    height: 5px;
	    background: #fdfcf0 url(https://img.cgv.co.kr/R2014/images/sprite/sprite_corner01.png) no-repeat;
	}
	.round.inred > * {
	    border: 1px solid #ea5b50;
	}
	.round > * {
	    box-sizing: border-box;
	    width: 100%;
	    height: 100%;
	    padding: 0 5px 0;
	}
	.round, .round > * {
	    display: inline-block;
	    position: relative;
	}
	.round.inred > *:before {
	    right: -3px;
	    top: -3px;
	    background-position: -5px -10px;
	}
	.round.inred > *:after {
	    right: -3px;
	    bottom: -3px;
	    background-position: -5px -15px;
	}
	.round.inred:after {
	    left: -2px;
	    bottom: -2px;
	    background-position: 0 -15px;
	}
	.round.red {
	    border: 2px solid #e71a0f;
	    color: #e71a0f;
	}
	button, input[type='submit'], input[type='button'] {
	    cursor: pointer;
	    padding: 0;
	}
	button, input[type='submit'], input[type='reset'] {
	    background-color: transparent;
	}
	.round.red:before {
	    left: -2px;
	    top: -2px;
	    background-position: 0 0;
	}
	.sect-finder .wrap-submit .round.red:before, .sect-finder .wrap-submit .round.red:after, .sect-finder .wrap-submit .round.red > *:before, .sect-finder .wrap-submit .round.red > *:after {
	    background-color: #29353d;
	}
	fieldset {
	    display: block;
	    margin-inline-start: 2px;
	    margin-inline-end: 2px;
	    padding-block-start: 0.35em;
	    padding-inline-start: 0.75em;
	    padding-inline-end: 0.75em;
	    padding-block-end: 0.625em;
	    min-inline-size: min-content;
    }
</style>
<!-- 무비 파인더 START -->
<div class="sect-common">
    <div class="sect-finder">
        <h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_finder.png" alt="좋아하는 영화, 찾고싶은 영화를 CGV에서 찾아드립니다!"></h3>
        <form id="frmMovieSearch" novalidate="novalidate">
            <fieldset>
                <legend>무비파인더 - 좋아하는 영화, 찾고싶은 영화를 CGV에서 찾아드립니다!</legend>
                <table cellpadding="0" cellspacing="" summary="무비파인터 영화이름, 장르, 제작국가, 관람등급, 제작년도 를 통해 검색할수 있습니다.">
                    <caption>무비파인더 검색 및 조건</caption>
                    <colgroup>
                        <col class="finder-col01">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th class="searchtype" scope="row">영화검색</th>
                        <td>
                        	<label class="hidden" for="keyword_type">영화검색 목록</label>
                            <select title="영화검색 목록" id="keyword_type">
                                <option value="0" selected="">전체</option>
                                <option value="1">영화제목</option>
                                <option value="2">주연배우</option>
                                <option value="3">감독</option>
                            </select>
                            <input type="text" title="영화검색 키워드입력" id="keyword" minlength="2" maxlength="20" style="width:410px;" placeholder="키워드를 입력해 주세요" value="">
                        </td>
                    </tr>
                    <tr>
                        <th class="genretype" scope="row">장르</th>
                        <td>
                            <ul>
        	                    <li><input type="checkbox" id="all_genre" name="all-genre" value="all"><label for="all_genre">전체</label></li>
                                <li class="collage"><input type="checkbox" name="indi_genre" id="is_indi" value="1"><label for="is_indi">아트하우스</label></li>
                                
                                    <li><input type="checkbox" id="genre226" name="genre" value="226"><label for="genre226">가족</label></li>
                                
                                    <li><input type="checkbox" id="genre217" name="genre" value="217"><label for="genre217">공포/호러</label></li>
                                
                                    <li><input type="checkbox" id="genre723" name="genre" value="723"><label for="genre723">드라마</label></li>
                                
                                    <li><input type="checkbox" id="genre721" name="genre" value="721"><label for="genre721">SF</label></li>
                                
                                    <li><input type="checkbox" id="genre1228" name="genre" value="1228"><label for="genre1228">멜로/로맨스</label></li>
                                
                                    <li><input type="checkbox" id="genre732" name="genre" value="732"><label for="genre732">코미디</label></li>
                                
                                    <li><input type="checkbox" id="genre727" name="genre" value="727"><label for="genre727">애니메이션</label></li>
                                
                                    <li><input type="checkbox" id="genre228" name="genre" value="228"><label for="genre228">느와르</label></li>
                                
                                    <li><input type="checkbox" id="genre223" name="genre" value="223"><label for="genre223">단편</label></li>
                                
                                    <li><input type="checkbox" id="genre722" name="genre" value="722"><label for="genre722">다큐멘터리</label></li>
                                
                                    <li><input type="checkbox" id="genre1883" name="genre" value="1883"><label for="genre1883">로드무비</label></li>
                                
                                    <li><input type="checkbox" id="genre724" name="genre" value="724"><label for="genre724">무협</label></li>
                                
                                    <li><input type="checkbox" id="genre218" name="genre" value="218"><label for="genre218">뮤지컬</label></li>
                                
                                    <li><input type="checkbox" id="genre1884" name="genre" value="1884"><label for="genre1884">뮤직</label></li>
                                
                                    <li><input type="checkbox" id="genre219" name="genre" value="219"><label for="genre219">미스터리</label></li>
                                
                                    <li><input type="checkbox" id="genre222" name="genre" value="222"><label for="genre222">범죄</label></li>
                                
                                    <li><input type="checkbox" id="genre1885" name="genre" value="1885"><label for="genre1885">옴니버스</label></li>
                                
                                    <li><input type="checkbox" id="genre1886" name="genre" value="1886"><label for="genre1886">서부</label></li>
                                
                                    <li><input type="checkbox" id="genre725" name="genre" value="725"><label for="genre725">스릴러</label></li>
                                
                                    <li><input type="checkbox" id="genre1887" name="genre" value="1887"><label for="genre1887">스포츠</label></li>
                                
                                    <li><input type="checkbox" id="genre726" name="genre" value="726"><label for="genre726">시대극/사극</label></li>
                                
                                    <li><input type="checkbox" id="genre225" name="genre" value="225"><label for="genre225">아동</label></li>
                                
                                    <li><input type="checkbox" id="genre224" name="genre" value="224"><label for="genre224">액션</label></li>
                                
                                    <li><input type="checkbox" id="genre728" name="genre" value="728"><label for="genre728">어드벤처</label></li>
                                
                                    <li><input type="checkbox" id="genre1888" name="genre" value="1888"><label for="genre1888">역사</label></li>
                                
                                    <li><input type="checkbox" id="genre1889" name="genre" value="1889"><label for="genre1889">전기</label></li>
                                
                                    <li><input type="checkbox" id="genre731" name="genre" value="731"><label for="genre731">전쟁</label></li>
                                
                                    <li><input type="checkbox" id="genre1890" name="genre" value="1890"><label for="genre1890">종교</label></li>
                                
                                    <li><input type="checkbox" id="genre1891" name="genre" value="1891"><label for="genre1891">재난</label></li>
                                
                                    <li><input type="checkbox" id="genre1892" name="genre" value="1892"><label for="genre1892">청춘영화</label></li>
                                
                                    <li><input type="checkbox" id="genre1893" name="genre" value="1893"><label for="genre1893">퀴어</label></li>
                                
                                    <li><input type="checkbox" id="genre227" name="genre" value="227"><label for="genre227">환타지</label></li>
                                
                                    <li><input type="checkbox" id="genre1894" name="genre" value="1894"><label for="genre1894">학원물</label></li>
                                
                                    <li><input type="checkbox" id="genre729" name="genre" value="729"><label for="genre729">에로</label></li>
                                
                                    <li><input type="checkbox" id="genre1895" name="genre" value="1895"><label for="genre1895">없음</label></li>
                                
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="maketype" scope="row">제작국가</th>
                        <td>
                            <ul>
                                <li><input type="checkbox" name="all-national-code" id="all_national_code"><label for="all_national_code">전체</label></li>
                                
                                    <li><input type="checkbox" id="national_code_164" name="national-code" value="164"><label for="national_code_164">한국</label></li>
                                
                                    <li><input type="checkbox" id="national_code_102" name="national-code" value="102"><label for="national_code_102">미국</label></li>
                                
                                    <li><input type="checkbox" id="national_code_141" name="national-code" value="141"><label for="national_code_141">일본</label></li>
                                
                                    <li><input type="checkbox" id="national_code_143" name="national-code" value="143"><label for="national_code_143">중국</label></li>
                                
                                    <li><input type="checkbox" id="national_code_167" name="national-code" value="167"><label for="national_code_167">홍콩</label></li>
                                
                                    <li><input type="checkbox" id="national_code_161" name="national-code" value="161"><label for="national_code_161">프랑스</label></li>
                                
                                    <li><input type="checkbox" id="national_code_128" name="national-code" value="128"><label for="national_code_128">영국</label></li>
                                
                                    <li><input type="checkbox" id="national_code_93" name="national-code" value="93"><label for="national_code_93">독일</label></li>
                                
                                    <li><input type="checkbox" id="national_code_139" name="national-code" value="139"><label for="national_code_139">인도</label></li>
                                
                                    <li><input type="checkbox" id="national_code_1000" name="national-code" value="1000"><label for="national_code_1000">기타</label></li>
                                
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="gradetype" scope="row">관람등급</th>
                        <td>
                            <ul>
                                <li><input type="checkbox" id="all_grade" name="all-grade" value="233"><label for="all_grade">전체</label></li>
                                
                                    <li><input type="checkbox" id="grade233" name="grade" value="233"><label for="grade233">전체관람가</label></li>
                                
                                    <li><input type="checkbox" id="grade230" name="grade" value="230"><label for="grade230">12세 관람가</label></li>
                                
                                    <li><input type="checkbox" id="grade231" name="grade" value="231"><label for="grade231">15세 관람가</label></li>
                                
                                    <li><input type="checkbox" id="grade232" name="grade" value="232"><label for="grade232">청소년 관람불가</label></li>
                                
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th class="yeartype" scope="row"><label for="amount1">제작년도</label></th>
                        <td>
                            <div class="slider-range ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" id="slider-range" aria-disabled="false">
                                <ul>
                                    <li></li>
                                    <li>1960</li>
                                    <li>1970</li>
                                    <li>1980</li>
                                    <li>1990</li>
                                    <li>2000</li>
                                    <li>2010</li>
                                    <li>2020</li>
                                    <li></li>
                                </ul>
                            <div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 12.5%; width: 75%;"></div><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" title="좌,우 키보드 조절가능" style="left: 12.5%;">시작년도</a><a class="ui-slider-handle ui-state-default ui-corner-all" href="#" title="좌,우 키보드 조절가능" style="left: 87.5%;">종료년도</a></div>
                            <input type="text" id="year_start" name="year_start" style="width:118px;" value="1960" maxlength="4" placeholder="시작년도 입력해주세요." title="시작년도 입력해주세요." number="number"> - 
                            <input type="text" id="year_end" name="year_end" style="width:118px;" value="2021" maxlength="4" placeholder="시작년도 입력해주세요." title="시작년도 입력해주세요." number="number">  년
                        </td>
                    </tr>
                    </tbody>
                </table>
                    <div class="wrap-submit">
                    <button type="submit" class="round inred" id="btn_submit"><span>검색</span></button>
                    <button type="reset" class="round red" id="btn_reset"><span>초기화</span></button>
                </div>
            </fieldset>
        </form>
    </div>
</div>
<form id='frm' method='post' action='movie_list' >
    <input type="hidden" id="s" name="s" value="False" />
    <input type="hidden" id="kt" name="kt" value="0" />
    <input type="hidden" id="searchtxt" name="searchtxt" value=""/>
    <input type="hidden" id="genre" name="genre" value=""/>
    <input type="hidden" id="indi" name="indi" value="False"/>
    <input type="hidden" id="national" name="national" value="" />
    <input type="hidden" id="grade" name="grade" value="" />
    <input type="hidden" id="sdate" name="sdate" value="1960" />
    <input type="hidden" id="edate" name="edate" value="2021" />
    <input type="hidden" id="year_start" name="year_start" value="1960" />
    <input type="hidden" id="year_end" name="year_end" value="2021" />
    <input type="hidden" id="page" name="page" />
    <input type="hidden" id="pageno" name="pageno" value="1" />
</form>
<script type="text/javascript">
//<![CDATA[
	(function ($) {
		$(function () {
            $('#slider').visualMotion({ limit: 1, duration: 500, term: 500, autoStart: true });

            $('#all_genre').checkboxGroup({
                parent: function () { return this.closest('ul'); },
                selector: 'input[name=genre]'
            });
            
            $('#all_national_code').checkboxGroup({
                parent: function () { return this.closest('ul'); },
                selector: 'input[name=national-code]'
            });

            $('#all_grade').checkboxGroup({
                parent: function () { return this.closest('ul'); },
                selector: 'input[name=grade]'
            });

            $('#slider-range').rangeSlider({
                'start': $("#year_start"),
                'end': $("#year_end")
            });
			
			/* 충스크립트 */
			function rangehandle(){
				$('#slider-range').find('.ui-slider-handle').eq(0).attr('title','좌,우 키보드 조절가능').text('시작년도').next().attr('title','좌,우 키보드 조절가능').text('종료년도');
			};
			rangehandle();

			
            //default check/////
            $('#all_genre').click();$('#all_national_code').click();$('#all_grade').click();

            $('#btn_reset').on('click', function () {
                location = "movie_list?pageno=1";
                return false;
            });

            // novalidate version.
            var $frm = $('#frmMovieSearch');
            $frm.validate({
                submitHandler: function (form) {
                	
                    var $obj_year_start = $("#year_start");
                    if(isNaN($obj_year_start.val())){
                        alert('숫자만 입력가능합니다.');
                        $obj_year_start.val(1960);
                        $obj_year_start.focus();
                        return false;
                    }
                    if($obj_year_start.val() < 1950 || $obj_year_start.val() > 2030){
                        alert('입력가능한 범위가 아닙니다.');
                        $obj_year_start.val(1960);
                        $obj_year_start.focus();
                        return false;
                    }

                    var $obj_year_end = $("#year_end");
                    if(isNaN($obj_year_end.val())){
                        alert('숫자만 입력가능합니다.');
                        $obj_year_start.val(2030);
                        $obj_year_start.focus();
                        return false;
                    }
                    if($obj_year_end.val() < 1950 || $obj_year_end.val() > 2030){
                        alert('입력가능한 범위가 아닙니다.');
                        $obj_year_start.val(2020);
                        $obj_year_start.focus();
                        return false;
                    }
                    
                    searchMovie();
                }
            });
			
			function searchMovie() {
                // 초기화
                $('#s').val('');
                $('#kt').val('');
                $('#searchtxt').val('');
                $('#genre').val('');
                $('#indi').val('');
                $('#national').val('');
                $('#grade').val('');
                $('#sdate').val('');
                $('#edate').val('');
				
                //장르체크
                var genre;
                if($('#all_genre').is(":checked") || $(":checkbox[name='genre']:checked").length == 0) {
                    genre = "";
                } else {
                    genre = $(":checkbox[name='genre']:checked").map(function() { return this.value; }).get();
                }
                $('#genre').val(genre);

                //제작국가
                var national;
                if($('#all_national_code').is(":checked") || $(":checkbox[name='national-code']:checked").length == 0) {
                    national = "";
                } else {
                    national = $(":checkbox[name='national-code']:checked").map(function() { return this.value; }).get();
                }
                $('#national').val(national);

                //등급
                var grade;
                if($('#all_grade').is(":checked") || $(":checkbox[name='grade']:checked").length == 0) {
                    grade = "";
                } else {
                    grade = $(":checkbox[name='grade']:checked").map(function() { return this.value; }).get();
                }
                $('#grade').val(grade);

                $('#s').val('true');
                if($("#keyword").val().trim() != ''){
                    $('#kt').val($("#keyword_type option:selected").val())
                    $('#searchtxt').val($("#keyword").val().trim());
                }
                if($('#is_indi').is(":checked")){
                    $('#indi').val('true');
                }else {
                    $('#indi').val('false');
                }

                $('#sdate').val(escape($("#year_start").val()))
                $('#edate').val(escape($("#year_end").val()));

                goSearch(1);
			}
		});
	})(jQuery);

    function goSearch(page) {
        if(page > 1) {
            $('#page').val(page); 
        } else {
			$('#page').val(1); 
		}

        $('#frm').submit();
    }
//]]>
</script>
<!-- 무비 파인더 END -->
<br>
<div class="content">
	<h2 class="m_3">
		<strong>무비리스트</strong>
	</h2>
	<div class="movie_top">
		<div class="col-md-12 movie_box">
			<div class="row">
				<c:forEach var="movie" items="${movieList.list}">
					<div class="movie movie-test movie-test-dark movie-test-left col-md-6">
						<div class="movie__images">
							<a href="movie_view?mv_no=${movie.mv_no}" class="movie-beta__link">
								<img height="214px" alt="" src="${movie.mv_image}" class="img-responsive" alt="" />
							</a>
						</div>
						<div class="movie__info">
							<a href="movie_view?mv_no=${movie.mv_no}" class="movie__title">${movie.mv_name}</a>
							<p class="movie__option">${movie.mv_date.toLocaleString().replaceFirst("오전 12:00:00","")}개봉<br/>
							<p class="movie__time"><strong>${movie.mv_runTime}분</strong></p>
							<strong>감독</strong> : ${movie.mv_director}<br/>
							<strong>배우</strong>: ${movie.mv_actor}<br/>
							<strong>장르</strong> : ${movie.mv_genre}
						</div>
					</div>
				</c:forEach>
				<c:forEach var="movieF" items="${movieListFinder.listFinder}">
					<div class="movie movie-test movie-test-dark movie-test-left col-md-6">
						<div class="movie__images">
							<a href="movie_view?mv_no=${movieF.mv_no}" class="movie-beta__link">
								<img height="214px" alt="" src="${movieF.mv_image}" class="img-responsive" alt="" />
							</a>
						</div>
						<div class="movie__info">
							<a href="movie_view?mv_no=${movieF.mv_no}" class="movie__title">${movieF.mv_name}</a>
							<p class="movie__option">${movieF.mv_date.toLocaleString().replaceFirst("오전 12:00:00","")}개봉<br/>
							<p class="movie__time"><strong>${movieF.mv_runTime}분</strong></p>
							<strong>감독</strong> : ${movieF.mv_director}<br/>
							<strong>배우</strong>: ${movieF.mv_actor}<br/>
							<strong>장르</strong> : ${movieF.mv_genre}
						</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${movieListFinder.s ne 'true' || movieListFinder.s eq null}">
			<table border="0" cellpadding="0" cellspacing="1" width="100%">
				<tr>
					<td align="center">
						<c:if test="${movieList.showFirst}">
							<a href="movie_list?pageno=1">◀◀</a>&nbsp; 
						</c:if> 
						<c:if test="${movieList.showPreviousGroup}">
							<a href="movie_list?pageno=${movieList.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
						</c:if> 
						<c:forEach var="listPage" begin="${movieList.startPageNo}" end="${movieList.endPageNo}" varStatus="status">
							<c:if test="${movieList.selectPageNo == status.index}">
								<font color='red'><strong>${status.index}</strong></font>&nbsp;
							</c:if>
							<c:if test="${movieList.selectPageNo != status.index}">
								<a href="movie_list?pageno=${status.index}"><strong>${status.index}</strong></a>&nbsp;
							</c:if>
						</c:forEach>
						<c:if test="${movieList.showNextGroup}">
							<a href="movie_list?pageno=${movieList.nextGroupStartPageNo}">▶&nbsp;</a>
						</c:if>
						<c:if test="${movieList.showLast}">
							<a href="movie_list?pageno=${movieList.totalPageCount}">▶▶</a>&nbsp;
						</c:if>
					</td>
				</tr>
			</table>
			</c:if>
			<c:if test="${movieListFinder.s eq 'true'}">
			<table border="0" cellpadding="0" cellspacing="1" width="100%">
				<tr>
					<td align="center">
						<c:if test="${movieListFinder.showFirst}">
							<a href="movie_list?pageno=1">◀◀</a>&nbsp; 
						</c:if> 
						<c:if test="${movieListFinder.showPreviousGroup}">
							<a href="movie_list?pageno=${movieListFinder.previousGroupStartPageNo}">◀</a>&nbsp;&nbsp;
						</c:if> 
						<c:forEach var="listPage1" begin="${movieListFinder.startPageNo}" end="${movieListFinder.endPageNo}" varStatus="status">
							<c:if test="${movieListFinder.selectPageNo == status.index}">
								<font color='red'><strong>${status.index}</strong></font>&nbsp;
							</c:if>
							<c:if test="${movieListFinder.selectPageNo != status.index}">
								<a href="movie_list?pageno=${status.index}"><strong>${status.index}</strong></a>&nbsp;
							</c:if>
						</c:forEach>
						<c:if test="${movieListFinder.showNextGroup}">
							<a href="movie_list?pageno=${movieListFinder.nextGroupStartPageNo}">▶&nbsp;</a>
						</c:if>
						<c:if test="${movieListFinder.showLast}">
							<a href="movie_list?pageno=${movieListFinder.totalPageCount}">▶▶</a>&nbsp;
						</c:if>
					</td>
				</tr>
			</table>
			</c:if>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>