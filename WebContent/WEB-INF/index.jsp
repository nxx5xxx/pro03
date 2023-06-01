<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
.img_container { height:574px; width: 400vw; transition: transform 0.5s; }
.inner { height:574px; width: 100vw; float: left; }
.inner img { width: 100%; }
#btn { font-size: 12px; margin-left: 5px; border-radius:35px; color:#fff; background-color: #fff; width: 19px; height: 19px; }
.btngroup { position: absolute; left: 47%; margin-top: -50px;  }

.notititle { text-align: center; color:#fff; font-size: 34px; font-weight: 600;}
.notice { width: auto; background-color:rgb(0,154,218); color:#fff; font-size: 18px; }
.media { width: 1200px; text-align: center; display: block; margin: 0 auto;}
#noti { font-size: 22px; font-weight: 550; color:#fff;}
#datedeco { position:absolute; margin-left: 530px; margin-top: -140px; }
.datedecotit { position:absolute; margin-left: 565px; margin-top: -130px; font-size: 20px; vertical-align: middle; }
#dt2 { display: block; font-size: 42px; font-weight: 550; color:#fff; margin-top: -12px;}
#dt3 { margin-top: -12px; margin-left: 4px;  16px; }

.tour { background-image: url("${path1 }/img/tourback.png"); min-height: 600px; }
.tourwp { width: 1800px; margin-left: 150px; }
.cardli { float: left; margin: 20px; }
.card { width: 500px; height: 400px; margin: 10px auto;}
#cardimg { margin-top: -23px; width: 499px; height: 320px; padding: 5px;}


#togu { height: 500px; }
.togu { width: 1200px; height: 500px; position: relative; }
#togu1 { width: 1200px; height: 500px; border: solid 1px; margin: 0; 
		background-image: url("${path1 }/img/togu1.png"); }
#togu2 { width: 400px; height: 500px; border: solid 1px; margin-top: -500px; margin-left: 1205px;
		background-color: #09b;	}

/* 0601추가부분 */
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:80%;height:650px; margin:20px auto; border:2px solid black}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(${path1}/data/map/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
/* //0601추가부분  */
</style>
</head>
<body style="margin: 0">
<%@ include file="/header.jsp" %>
<div class="main_page">
	<div style="overflow: hidden">
	<br>
		<div class="img_container">
			<div class="inner">
				<img alt="main1" src="${path1 }/img/main1.jpg">
			</div>
			<div class="inner">
				<img alt="main2" src="${path1 }/img/main2.jpg">
			</div>
			<div class="inner">
				<img alt="main3" src="${path1 }/img/main3.jpg">
			</div>
			<div class="inner">
				<img alt="main4" src="${path1 }/img/main4.jpg">
			</div>
		</div>
	</div>
	<div class="btngroup">
		<button id="btn" class="btn1">1</button>
		<button id="btn" class="btn2">2</button>
		<button id="btn" class="btn3">3</button>
		<button id="btn" class="btn4">4</button>
	</div>
	<script> 
	/* btn 누르면 transform: translate(-?vw) */ 
	 document.querySelector('.btn1').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-0vw)'; });
	 document.querySelector('.btn2').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-100vw)'; });
	 document.querySelector('.btn3').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-200vw)'; });
	 document.querySelector('.btn4').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-300vw)'; });
	</script>
	<div class="notice">
	<br><br><h2 class="notititle">함안소식 알림</h2><br><br>
	<img id="datedeco" alt="datedeco" src="${path1 }/img/fpr1deco1.png">
	<span class="datedecotit">2023<strong id="dt2">05</strong><p id="dt3">may</p></span> 
    <br>
    <c:forEach items="${notList }" var="note" varStatus="cnt">
    <c:if test="${cnt.first }">  <c:set var="count" value="${note.nno }" /></c:if>
    <c:if test="${note.nno == count || note.nno == (count-1) || note.nno == (count-2) }">
    <article class="media">
      <figure class="media-left">
        <p class="imageis">
          <img src="${note.file1 }" style="width: 200px; height: 220px;">
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
			<a style="color:#fff" href="${path1 }/GoNoticeDetail.do?nno=${note.nno}">
			<strong id="noti">${note.title }</strong><br>
            <br>
            ${note.content }
            <br>
            </a>
          </p>
        </div>
      </div>
    </article>
    </c:if>
    </c:forEach>
            <br><br>
  </div>
	<div class="tour">
			<br><br>
			<h2 class="title" style="text-align: center;">함안으로 떠나자!</h2>
		<div class="tourwp">
			<ul class="cardul">
				<li class="cardli">
					<div class="card">
						<p style="text-align: center; font-size: 18px;">
							<br><strong>[축제행사]</strong> 함안낙화놀이
						</p>
						<hr>
						<a href="${path1 }/Event2.do">
							<img id="cardimg" alt="함안낙화놀이 이미지" src="${path1 }/img/event/ev2_1.jpg">
						</a>
					</div>
				</li>
				<li class="cardli">
					<div class="card">
						<p style="text-align: center; font-size: 18px;">
							<br><strong>[생태관광]</strong> 연꽃테마파크
						</p>
						<hr>
						<a href="${path1 }/Eco4.do">
							<img id="cardimg" alt="연꽃테마파크 이미지" src="${path1 }/img/eco/temapark1.jpg">
						</a>
					</div>
				</li>
				<li class="cardli">
					<div class="card">
						<p style="text-align: center; font-size: 18px;">
							<br><strong>[역사여행]</strong> 함안악양루
						</p>
						<hr>
						<a href="${path }/History2.do">
							<img id="cardimg" alt="함안악양루 이미지" src="${path1 }/img/his/akyangroo1.jpg">
						</a>
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	
	<!-- 0601추가부분 -->
	<br><br><h2 class="notititle" style="color:#363636">함안 주변 지도</h2><br><br>
	<div class="map_wrap">
	    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
	    <ul id="category">
	        <li id="CT1" data-order="0"> 
	            <span class="category_bg bank"></span>
	            문화시설
	        </li>       
	        <li id="AT4" data-order="1"> 
	            <span class="category_bg mart"></span>
	            관광명소
	        </li>  
	        <li id="AD5" data-order="2"> 
	            <span class="category_bg pharmacy"></span>
	            숙박
	        </li>  
	        <li id="FD6" data-order="3"> 
	            <span class="category_bg oil"></span>
	           음식점
	        </li>  
	        <li id="OL7" data-order="4"> 
	            <span class="category_bg cafe"></span>
	            주유소
	        </li>  
	        <li id="PM9" data-order="5"> 
	            <span class="category_bg store"></span>
	            약국
	        </li>      
	    </ul>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e5844a91d6f6ebd1c2d952b89252020&libraries=services"></script>
		<script>
		var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		    contentNode = document.createElement('div'),
		    markers = [], currCategory = '';		 
		var mapContainer = document.getElementById('map'),
		    mapOption = {
		        center: new kakao.maps.LatLng(35.272463385486475, 128.40652120224922),
		        level: 5
		    };  
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var ps = new kakao.maps.services.Places(map); 
		kakao.maps.event.addListener(map, 'idle', searchPlaces);
		contentNode.className = 'placeinfo_wrap';
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
		placeOverlay.setContent(contentNode);  
		addCategoryClickEvent();
		function addEventHandle(target, type, callback) {
		    if (target.addEventListener) {
		        target.addEventListener(type, callback);
		    } else {
		        target.attachEvent('on' + type, callback);
		    }
		}
		function searchPlaces() {
		    if (!currCategory) {
		        return;
		    }
		    placeOverlay.setMap(null);
		    removeMarker();
		    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
		}
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
		        displayPlaces(data);
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {		
		    } else if (status === kakao.maps.services.Status.ERROR) {		        
		    }
		}
		function displayPlaces(places) {
		    var order = document.getElementById(currCategory).getAttribute('data-order');
		    for ( var i=0; i<places.length; i++ ) {
		            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
		            (function(marker, place) {
		                kakao.maps.event.addListener(marker, 'click', function() {
		                    displayPlaceInfo(place);
		                });
		            })(marker, places[i]);
		    }
		}
		function addMarker(position, order) {
		    var imageSrc = '${path1}/data/map/places_category.png',
		        imageSize = new kakao.maps.Size(27, 28),
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(72, 208),
		            spriteOrigin : new kakao.maps.Point(46, (order*36)),
		            offset: new kakao.maps.Point(11, 28)
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position,
		            image: markerImage 
		        });
		
		    marker.setMap(map);
		    markers.push(marker);
		
		    return marker;
		}
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		function displayPlaceInfo (place) {
		    var content = '<div class="placeinfo">' +
		                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
		
		    if (place.road_address_name) {
		        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		    }  else {
		        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		    }                
		   
		    content += '    <span class="tel">' + place.phone + '</span>' + 
		                '</div>' + 
		                '<div class="after"></div>';
		
		    contentNode.innerHTML = content;
		    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		    placeOverlay.setMap(map);  
		}
		function addCategoryClickEvent() {
		    var category = document.getElementById('category'),
		        children = category.children;
		
		    for (var i=0; i<children.length; i++) {
		        children[i].onclick = onClickCategory;
		    }
		}
		function onClickCategory() {
		    var id = this.id,
		        className = this.className;
		
		    placeOverlay.setMap(null);
		
		    if (className === 'on') {
		        currCategory = '';
		        changeCategoryClass();
		        removeMarker();
		    } else {
		        currCategory = id;
		        changeCategoryClass(this);
		        searchPlaces();
		    }
		}
		function changeCategoryClass(el) {
		    var category = document.getElementById('category'),
		        children = category.children,
		        i;
		
		    for ( i=0; i<children.length; i++ ) {
		        children[i].className = '';
		    }
		
		    if (el) {
		        el.className = 'on';
		    } 
		} 
	</script>
	<!-- //0601 추가부분 -->
	
	
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>