<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="css/reset.css?t=20170411">
<link rel="stylesheet" type="text/css" href="css/common.css?t=20170719001">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script> var st_date = new Date().toISOString().substr(0, 10).replace('T', ' '); </script>
<script type="module">
	import * as THREE from 'https://threejsfundamentals.org/threejs/resources/threejs/r127/build/three.module.js';
	
	function main() {
	  const canvas = document.querySelector('#c');
	  const renderer = new THREE.WebGLRenderer({canvas});
	
	  const fov = 75;
	  const aspect = 2;  // the canvas default
	  const near = 0.1;
	  const far = 100;
	  const camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
	  camera.position.z = 3;
	
	  const scene = new THREE.Scene();
	
	  function addLight(...pos) {
	    const color = 0xFFFFFF;
	    const intensity = 1;
	    const light = new THREE.DirectionalLight(color, intensity);
	    light.position.set(...pos);
	    scene.add(light);
	  }
	  addLight(-1, 2, 4);
	  addLight( 2, -2, 3);
	
	  function makeSpherePositions(segmentsAround, segmentsDown) {
	    const numVertices = segmentsAround * segmentsDown * 6;
	    const numComponents = 3;
	    const positions = new Float32Array(numVertices * numComponents);
	    const indices = [];
	
	    const longHelper = new THREE.Object3D();
	    const latHelper = new THREE.Object3D();
	    const pointHelper = new THREE.Object3D();
	    longHelper.add(latHelper);
	    latHelper.add(pointHelper);
	    pointHelper.position.z = 1;
	    const temp = new THREE.Vector3();
	
	    function getPoint(lat, long) {
	      latHelper.rotation.x = lat;
	      longHelper.rotation.y = long;
	      longHelper.updateMatrixWorld(true);
	      return pointHelper.getWorldPosition(temp).toArray();
	    }
	
	    let posNdx = 0;
	    let ndx = 0;
	    for (let down = 0; down < segmentsDown; ++down) {
	      const v0 = down / segmentsDown;
	      const v1 = (down + 1) / segmentsDown;
	      const lat0 = (v0 - 0.5) * Math.PI;
	      const lat1 = (v1 - 0.5) * Math.PI;
	
	      for (let across = 0; across < segmentsAround; ++across) {
	        const u0 = across / segmentsAround;
	        const u1 = (across + 1) / segmentsAround;
	        const long0 = u0 * Math.PI * 2;
	        const long1 = u1 * Math.PI * 2;
	
	        positions.set(getPoint(lat0, long0), posNdx);  posNdx += numComponents;
	        positions.set(getPoint(lat1, long0), posNdx);  posNdx += numComponents;
	        positions.set(getPoint(lat0, long1), posNdx);  posNdx += numComponents;
	        positions.set(getPoint(lat1, long1), posNdx);  posNdx += numComponents;
	
	        indices.push(
	          ndx, ndx + 1, ndx + 2,
	          ndx + 2, ndx + 1, ndx + 3,
	        );
	        ndx += 4;
	      }
	    }
	    return {positions, indices};
	  }
	
	  const segmentsAround = 24;
	  const segmentsDown = 16;
	  const {positions, indices} = makeSpherePositions(segmentsAround, segmentsDown);
	
	  const normals = positions.slice();
	
	  const geometry = new THREE.BufferGeometry();
	  const positionNumComponents = 3;
	  const normalNumComponents = 3;
	
	  const positionAttribute = new THREE.BufferAttribute(positions, positionNumComponents);
	  positionAttribute.setUsage(THREE.DynamicDrawUsage);
	  geometry.setAttribute(
	      'position',
	      positionAttribute);
	  geometry.setAttribute(
	      'normal',
	      new THREE.BufferAttribute(normals, normalNumComponents));
	  geometry.setIndex(indices);
	
	  function makeInstance(geometry, color, x) {
	    const material = new THREE.MeshPhongMaterial({
	      color,
	      side: THREE.DoubleSide,
	      shininess: 100,
	    });
	
	    const cube = new THREE.Mesh(geometry, material);
	    scene.add(cube);
	
	    cube.position.x = x;
	    return cube;
	  }
	
	  const cubes = [
	    makeInstance(geometry, 0xFF0000, 0),
	  ];
	
	  function resizeRendererToDisplaySize(renderer) {
	    const canvas = renderer.domElement;
	    const width = canvas.clientWidth;
	    const height = canvas.clientHeight;
	    const needResize = canvas.width !== width || canvas.height !== height;
	    if (needResize) {
	      renderer.setSize(width, height, false);
	    }
	    return needResize;
	  }
	
	  const temp = new THREE.Vector3();
	
	  function render(time) {
	    time *= 0.001;
	
	    if (resizeRendererToDisplaySize(renderer)) {
	      const canvas = renderer.domElement;
	      camera.aspect = canvas.clientWidth / canvas.clientHeight;
	      camera.updateProjectionMatrix();
	    }
	
	    for (let i = 0; i < positions.length; i += 3) {
	      const quad = (i / 12 | 0);
	      const ringId = quad / segmentsAround | 0;
	      const ringQuadId = quad % segmentsAround;
	      const ringU = ringQuadId / segmentsAround;
	      const angle = ringU * Math.PI * 2;
	      temp.fromArray(normals, i);
	      temp.multiplyScalar(THREE.MathUtils.lerp(1, 1.4, Math.sin(time + ringId + angle) * .5 + .5));
	      temp.toArray(positions, i);
	    }
	    positionAttribute.needsUpdate = true;
	
	    cubes.forEach((cube, ndx) => {
	      const speed = -0.2 + ndx * .1;
	      const rot = time * speed;
	      cube.rotation.y = rot;
	    });
	
	    renderer.render(scene, camera);
	
	    requestAnimationFrame(render);
	  }
	
	  requestAnimationFrame(render);
	}
	
	main();
</script>
<script>
	function golink(i) {
		location.href="shop_list_choice?pageno=1";
	}
	
	<!-- 트레일러 변경 -->
	$(document).ready(function () {
		$('.mvTit').click(function(){
	        if ($(this).hasClass('selected')) return;
	        
	        $('.mvTit').removeClass('selected');
			$(this).addClass('selected');
			
			var movie = $('.selected').first().text();
			
			$.ajax('movie_info_name/' + movie,{
				success: function (movie) {
					$('.video iframe').attr('src',movie.mv_trailer);
		        }
		    })
		});
	});
</script>
<style>
	.col-md-8 {
		width: 69.66666667%;
		padding-right: 0px;
		padding-left: 0px;
		float: left;
	}
	.col-md-4 {
		width: 30%;
		height: 295px;
		padding-right: 0px;
		padding-left: 0px;
		margin-right: 26px;
	}
	.col-md-2 {
		width: 30.3%;
		padding-right: 0px;
		padding-left: 0px;
		float: right;
	}
	.bottom {
		padding-top: 25px;
		height: 320px;
	}
	.on{
		cursor:pointer;
	}
	.box_2{
		height: auto;
	}
	
	
	
    #imgDiv {
        width:  238px;
        height: 295px;
        position:   absolute;        
    }
    #imgDiv img {
		/*
        width:  238px;
        height: 295px;
		*/
        position:   absolute;
    }
    #imgDiv > #funny {
        opacity:    0;
        transition: opacity 1s
    }
    #imgDiv:hover > #funny {
        opacity:    1;
    }



	@media screen and (max-width: 400px) {
		.main_key_visual .office{
			width:150px;
		}
	}
	@media screen and (min-width: 401px) and (max-width: 1199px) {
		.col-md-4 {
			width: 29.3%;
		}
		.main_key_visual {
			width:290px;
		}
		.main_key_visual .office {
			width:290px;
		}
		#imgDiv {
			width:190px;
		}
		#imgDiv img {
			width:190px;
		}
	}
	p.main_banner_text2.type1 {
	    color: #497b67;
	}
	p.main_banner_text2 {
	    position: absolute;
	    left: 200px;
	    top: 300px;
	    width: 265px;
	    font-size: 13px;
	    color: #553124;
	    line-height: 22px;
	    text-align: center;
	    font-weight: 500;
	    letter-spacing: -0.03em;
	}
	
	
	
	/* Tab */
	.tab-menu li:first-child {
		padding-left: 20px;
    	background: url(https://img.cgv.co.kr/R2014/images/sprite/sprite_corner.png) 0 -20px no-repeat;
	}
	.tab-menu li {
	    display: inline-block;
	    margin-left: -4px;
	}
	.tab-menu li:first-child a {
	    background: #e71a0f;
	}
	.tab-menu li a {
	    display: inline-block;
	    position: relative;
	    height: 39px;
	    padding: 0 15px;
	    background: #e71a0f url(https://img.cgv.co.kr/R2014/images/common/bg/bg_tebmenu-line.gif) 0 12px no-repeat;
	    color: #ffffff;
	    font-size: 15px;
	    font-weight: 500;
	    text-align: center;
	    line-height: 39px;
	    text-decoration: none;
	}
	.tab-menu .last {
	    padding-right: 19px;
	    background: url(https://img.cgv.co.kr/R2014/images/common/bg/ribon_right.png) right 0 no-repeat;
	}
	.sect-event > ul {
		display: flex;
		justify-content: center;
		width: 1100px;
		text-align: center;
		margin-left: auto;
  		margin-right: auto;
  		padding-bottom: 25px;
		border-bottom: 3px solid black;
	}
	
	
	
	/* Banner */
	.cols-banner {
		overflow: hidden;
		display: flex;
		justify-content: center;
	}
	.cols-banner .col-ad, .cols-banner .col-hd, .cols-banner .col-collage {
	    float: left;
	}
	.cols-banner .box-com {
		/*
		width: 228px;
	    height: 261px;
		*/
	    padding: 3px;
	    border: 3px solid #241d1e;
	}
	.cols-banner .box-com .box-inner {
	    width: 226px;
	    height: 259px;
	    border: 1px solid #241d1e;
	    text-align: center;
	}
	.cols-banner .box-com .box-inner iframe, .cols-banner .box-com .box-inner a {
	    display: block;
	    width: 226px;
	    height: 259px;
	}
	.cols-banner .col-hd {
	    position: relative;
	    width: 486px;
	    height: 273px;
	    margin: 0 7px;
	}
	
	
	
	/* Three.js */
	html, body {
	  margin: 0;
	}
	#c {
	  width: 100%;
	  display: block;
	}
	
	
	
	/* 현재 날씨, 온도 */
	@import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Cabin:ital,wght@0,700;1,400;1,500;1,600&family=Indie+Flower&family=Lobster&display=swap');
	.js-wea {
		font-family: 'Abril Fatface', cursive;
		font-family: 'Cabin', sans-serif;
		font-family: 'Indie Flower', cursive;
		font-family: 'Lobster', cursive;
	}
	
	
	
	/* 날씨 위젯 */
	.lb-widget {
	  display: block;
	  margin: 64px auto;
	  width: 50%;
	}
	
	.lb-widget .lb-dropdown-select-city {
	  float: none;
	}
	
	.lb-widget .lb-dropdown-select-city.wide {
	  width: 105% !important;
	  margin: -35px auto;
	  margin-left: -5px;
	}
	
	.lb-widget .lb-dropdown-select-city .lbdsc-searchbox {
	  width: 98% !important;
	}
	
	.lb-widget-01 {
	  display: flex;
	  align-items: center;
	  justify-content: center;
	}
	.lb-main-01 {
	  /* margin: 32px; */
	  margin: 22px;
	  max-width: 240px;
	  width: 100%;  
	  /* height: 253px; */
	  height: 30px;
	}
	@media(max-width:1200px) {
	  .lb-main-01 {
	    min-width: 120px;
	    width: auto;
	  }
	}
	
	.lb-left-weather iframe {
	  display: block;
	  border: 0;
	  width: 100%;
	  height: 245px;
	}
	
	select {
	  display: none !important;
	}
	
	.lb-dropdown-select-city {
	  background-color: #fff;
	  border-radius: 6px;
	  border: solid 1px #eee;
	  box-shadow: 0px 2px 5px 0px rgba(155, 155, 155, 0.5);
	  box-sizing: border-box;
	  cursor: pointer;
	  display: block;
	  float: left;
	  font-size: 14px;
	  font-weight: normal;
	  height: 42px;
	  line-height: 40px;
	  outline: none;
	  padding-left: 18px;
	  padding-right: 30px;
	  position: relative;
	  text-align: left !important;
	  transition: all 0.2s ease-in-out;
	  -webkit-user-select: none;
	  -moz-user-select: none;
	  -ms-user-select: none;
	  user-select: none;
	  white-space: nowrap;
	  width: auto;
	}
	
	.lb-dropdown-select-city:focus {
	  background-color: #fff;
	}
	
	.lb-dropdown-select-city:hover {
	  background-color: #fff;
	}
	
	.lb-dropdown-select-city:active,
	.lb-dropdown-select-city.open {
	  background-color: #fff !important;
	  border-color: #bbb;
	  box-shadow: 0 1px 4px rgba(0, 0, 0, 0.05) inset;
	}
	
	.lb-dropdown-select-city:after {
	  height: 0;
	  width: 0;
	  border-left: 4px solid transparent;
	  border-right: 4px solid transparent;
	  border-top: 4px solid #777;
	  -webkit-transform: origin(50% 20%);
	  transform: origin(50% 20%);
	  transition: all 0.125s ease-in-out;
	  content: '';
	  display: block;
	  margin-top: -2px;
	  pointer-events: none;
	  position: absolute;
	  right: 10px;
	  top: 50%;
	}
	
	.lb-dropdown-select-city.open:after {
	  -webkit-transform: rotate(-180deg);
	  transform: rotate(-180deg);
	}
	
	.lb-dropdown-select-city.open .list {
	  -webkit-transform: scale(1);
	  transform: scale(1);
	  opacity: 1;
	  pointer-events: auto;
	}
	
	.lb-dropdown-select-city.open .list::-webkit-scrollbar {
	  display: none;
	}
	
	.lb-dropdown-select-city.open .option {
	  cursor: pointer;
	}
	
	.lb-dropdown-select-city.wide {
	  width: 100%;
	}
	
	.lb-dropdown-select-city.wide .list {
	  left: 0 !important;
	  right: 0 !important;
	}
	
	.lb-dropdown-select-city .list {
	  box-sizing: border-box;
	  transition: all 0.15s cubic-bezier(0.25, 0, 0.25, 1.75), opacity 0.1s linear;
	  -webkit-transform: scale(0.75);
	  transform: scale(0.75);
	  -webkit-transform-origin: 50% 0;
	  transform-origin: 50% 0;
	  box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.09);
	  background-color: #fff;
	  border-radius: 6px;
	  margin-top: 4px;
	  padding: 3px 0;
	  opacity: 0;
	  overflow: hidden;
	  pointer-events: none;
	  position: absolute;
	  top: 100%;
	  left: 0;
	  z-index: 999;
	  max-height: 183px;
	  overflow: auto;
	  border: 1px solid #ddd;
	}
	
	.lb-dropdown-select-city .list:hover .option:not(:hover) {
	  background-color: transparent !important;
	}
	
	.lb-dropdown-select-city .lbdsc-search {
	  overflow: hidden;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  margin: 8px 18px;
	}
	
	.lb-dropdown-select-city .lbdsc-searchbox {
	  width: 100%;
	  padding: 8px;
	  border: 1px solid #bbb;
	  border-color: #bbb;
	  border-radius: 4px;
	  outline: none;
	}
	
	.lb-dropdown-select-city .lbdsc-searchbox:focus {
	  border-color: #0088ff;
	}
	
	.lb-dropdown-select-city .list ul {
	  padding: 0;
	}
	
	.lb-dropdown-select-city .option {
	  cursor: default;
	  line-height: 40px;
	  outline: none;
	  padding-left: 26px;
	  padding-right: 29px;
	  text-align: left;
	  transition: all 0.2s;
	  list-style: none;
	}
	.lb-dropdown-select-city .option:hover,
	.lb-dropdown-select-city .option:focus {
	  background-color: #f6f6f6 !important;
	}
	
	.lb-dropdown-select-city .option.selected {
	  color: #0088ff;
	
	.lb-dropdown-select-city .option.selected:focus {
	  background: #f6f6f6;
	}
	
	.lb-dropdown-select-city a{
	  color: #aaa;
	  text-decoration: none;
	  transition: all 0.2s ease-in-out;
	}
	
	.lb-dropdown-select-city a:hover {
	  color: #666;
	}
</style>
<div class="slider">
    <div class="callbacks_container">
        <ul class="rslides" id="slider">
            <li>
            	<a href="http://www.cgv.co.kr/culture-event/event/" target="_blank">
	            	<img src="https://img.cgv.co.kr/banner/main/mainbig_new_1.jpg" class="img-responsive" alt="LET'S PLAY AT CGV!" style="width: 100%; height: 100%;"/>
					<p class="main_banner_text2 type1"><br>즐겁고 재밌는 무언가를 찾고 있나요?<br>CGV에서 같이 놀아요!</p>
				</a>
            </li>
            <li><a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=32483&amp;menu=001" target="_blank"><img src="https://img.cgv.co.kr/Front/Main/2021/0623/16244092604450.jpg" class="img-responsive" alt="인더하이츠_시크릿 컷"></a></li>
            <li><a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=32496" target="_blank"><img src="https://img.cgv.co.kr/Front/Main/2021/0618/16239787731570.jpg" class="img-responsive" alt="시크릿컷_발신제한"></a></li>
            <li><a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=32307" target="_blank"><img src="https://img.cgv.co.kr/Front/Main/2021/0518/16213281620710.jpg" class="img-responsive" alt="분노의 질주 N차 챌린지"/></a></li>
            <li><a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=30717" target="_blank"><img src="https://img.cgv.co.kr/Front/Main/2021/0511/16207179879480.jpg" class="img-responsive" alt="5월의 아이스콘"/></a></li>
            <li><a href="http://www.cgv.co.kr/culture-event/event/detailViewUnited.aspx?seq=32468&amp;menu=001" target="_blank"><img src="https://img.cgv.co.kr/Front/Main/2021/0617/16238925173630.jpg" class="img-responsive" alt="파코니플레이_발신제한"></a></li>
        </ul>
    </div>
</div>

<div class="content" style="background: none;">
    <div class="box_1">
        <h3 style="background:url(https://img.cgv.co.kr/R2014/images/common/bg/bg_h3_line.jpg) repeat-x 0 50%; line-height: 41px; text-align: center; font-weight: 500;">
        	<img src="https://img.cgv.co.kr/R2014/images/title/h3_movie_selection.gif" alt="MOVIE SELECTION" style="padding: 0 8px; background-color: #fdfcf0;">
        </h3>
        <div class="clearfix"></div>
    </div>
</div>

<div class="box_2">
   	<div class="video col-md-8">
   		<iframe width="100%" height="400px" src="https://www.youtube.com/embed/11nQ2Z8LyII" frameborder="0" allowfullscreen></iframe>
  	</div>
  	<div class="col-md-2">
	  	<div class="mKeyVi">
	      <div class="main_key_visual" style="">
	         <div class="office">
	            <div class="officeTop">
	               <h2><img src="images/h2_boxoffice.png" alt="BOX OFFICE"></h2>
	            </div>
	            <div class="officeCont">
	                <ol class="officeRk">
	                   <c:forEach var="movie" items="${movieList.list}" begin="0" end="9" varStatus="status">	                   
	                      <li class="active">
	                         <a href="javascript:void(0)" class="tit"><em>${status.index+1}.</em>
	                            <span>
		                            <c:choose>
			                            <c:when test="${movie.mv_age eq '전체'}">
			                               <img src="images/bg_grade_A.png">
			                            </c:when>
			                            <c:when test="${movie.mv_age eq '12세'}">
			                               <img src="images/bg_grade_12.png">
			                            </c:when>
			                            <c:when test="${movie.mv_age eq '15세'}">
			                               <img src="images/bg_grade_15.png">
			                            </c:when>
			                            <c:when test="${movie.mv_age eq '19세'}">
			                               <img src="images/bg_grade_19.png">
			                            </c:when>
		                            </c:choose>
								</span>
	                            <span class="mvTit">${movie.mv_name}</span>
	                         </a>
							 <span class="memRk">예매율<em>${movie.mv_reserveRate}%</em></span>
	                      </li>
	                   </c:forEach>
	                </ol>
	            </div>
	         </div>
	      </div>
	   </div>
		<br>
		<!-- 현재 날씨 -->
		<div style="border: 3px solid silver; padding: 10px 30px 10px;"><span class="js-wea" style="font-size: 17px; color: navy;"></span></div>
		<!-- 날씨 위젯-->
		<div class="lb-main-01">
			<select class="beom" id="select-box-01" name="">
				<option value="1">서울</option>
				<option value="2">인천</option>
				<option value="3">대전</option>
				<option value="4">광주</option>
				<option value="5">대구</option>
				<option value="6">울산</option>
				<option value="7">부산</option>
				<option value="8">제주</option>
				<option value="9">일본 도쿄</option>
				<option value="10">미국 워싱턴D.C</option>
				<option value="11">미국 뉴욕</option>
				<option value="12">프랑스 파리</option>
				<option value="13">스페인 마드리드</option>
				<option value="14">이탈리아 로마</option>
				<option value="15">영국 런던</option>
				<option value="16">독일 베를린</option>
				<option value="17">호주 캔버라</option>
				<option value="18">캐나다 오타와</option>
			</select>
		</div>
		<div class="lb-widget-01">
			<div id="lbl-1" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=37.5266&lon=127.0403&name=서울&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-2" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=37.4496&lon=126.7074&name=인천&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-3" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=36.3512&lon=127.3954&name=대전&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-4" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=35.1787&lon=126.8974&name=광주&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-5" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=35.8759&lon=128.5964&name=대구&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-6" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=35.538&lon=129.324&name=울산&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-7" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=35.1334&lon=129.1058&name=부산&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-8" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=33.5007&lon=126.5288&name=제주&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-9" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=35.6803&lon=139.7691&name=일본도쿄&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-10" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=38.8954&lon=-77.0353&name=미국워싱턴D.C&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-11" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=40.7060&lon=-74.0092&name=미국뉴욕&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-12" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=48.8598&lon=2.3382&name=프랑스파리&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-13" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=40.4176&lon=-3.7128&name=스페인마드리드&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-14" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=41.8911&lon=12.4930&name=이탈리아로마&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-15" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=51.5075&lon=-0.1284&name=영국런던&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-16" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=52.5153&lon=13.3807&name=독일베를린&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-17" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=-35.2815&lon=149.1318&name=호주캔버라&color=&font=&units=si"></iframe>
			</div>
			<div id="lbl-18" class="lb-left-weather">
				<iframe src="https://forecast.io/embed/#lat=45.4212&lon=-75.7006&name=캐나다오타와&color=&font=&units=si"></iframe>
			</div>
		</div>
	</div>
  	<div class="col-md-8 bottom" style="height: 650px;">
  		<c:forEach var="movie" items="${movieList.list}" end="10" varStatus="status">
	  		<div class="col-md-4">
	  			<img src="${movie.mv_image}" style="width: 100%; height: 100%;">
	  			<div id="imgDiv" class="sover">
					<img id="funny" src="images/main_slide_hover.png">
					<p class="sage">
						<span class="a12">${movie.mv_age}</span> ${movie.mv_name} <br><br>
						<span>상영일 : ${movie.mv_date.toLocaleString().replaceFirst('오전 12:00:00','')}</span> <br>
						<span><img src="" alt=""> ${movie.mv_runTime}분</span><br>
						<span>예매율 : ${movie.mv_reserveRate} %</span>
					</p>
					<p class="slbtn">
						<a href="movie_list?pageno=1">예매</a>
						<a href="http://www.cgv.co.kr/magazine/">뉴스</a>
					</p>
				</div>
	  		</div>
	  		<c:if test="${status.index eq 2}">
  			<div><p>&nbsp;</p></div>
  			</c:if>
  		</c:forEach>
  	</div>
  	<canvas id="c" onclick="golink(1)"></canvas>
</div>
<!-- 현재 날씨 -->
<script src="js/weather.js"></script>
<!-- 날씨 위젯-->
<script src="js/weather-widget.js"></script>