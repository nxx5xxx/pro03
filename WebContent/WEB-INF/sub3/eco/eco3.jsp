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
<title>입곡군립공원</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.img_sec {width:600px;height:705px; background-color:rgb(88,173,64);margin:10px 200px;float:right}
.img1 {display:inline-block;width:570px; height:488px;margin:15px ;}
#img_btn1:checked ~ .img1 {background: url(${path1 }/img/eco/goonlip1.jpg) no-repeat;background-size:570px 488px;}
#img_btn2:checked ~ .img1 {background: url(${path1 }/img/eco/goonlip2.jfif) no-repeat;background-size:570px 488px;}
#img_btn3:checked ~ .img1 {background: url(${path1 }/img/eco/goonlip3.jfif) no-repeat;background-size:570px 488px;}
.btn_hidden {display:none}

.img23_wrap {width:570px;height :155px; margin:13.5px 15px;text-align:center }
.sm_img1,.sm_img2,.sm_img3 {width:180px; height:155px}
.sm_img1 {float:left}
.sm_img3 {float:right}

.content_blank {width:100%; height :592px ;background-color:transparent;}
.cont_sec {width:100%; background-color:rgb(81,154,56)}
.cont_art {padding:20px;}
.cont_adr {float:right; text-align:right}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<div style="text-align:right; float:right">
	
	<!-- value에 관광지이름 넣으면 알아서 적용돼요 -->
	<c:set var="mapname" value="입곡군립공원" />
	<!-- 이곳에 지도주소넣기 -->	
	<c:set var="mapaddr" value="경남 함안군 산인면 입곡리 1180-1" />
	<input type="hidden" id="hamAddr" value="${mapaddr }">
	
	
		<h2 class="is-size-2" style="color:rgb(88,173,64);font-weight:bold">${mapname }</h2>
		<hr style="width:265px;margin:0;background-color:lightgray">
	</div>
	
<section class="img_sec">
	<div class="img1_wrap">
		<input type="radio" name="img_btn" id="img_btn1" checked class="btn_hidden">
		<input type="radio" name="img_btn" id="img_btn2" class="btn_hidden">
		<input type="radio" name="img_btn" id="img_btn3" class="btn_hidden">
	<div class="img1"></div>
	</div>
	<div class="img23_wrap">
	<label for="img_btn1"><img src="${path1 }/img/eco/goonlip1.jpg"  class="sm_img1"></label>
	<label for="img_btn2"><img src="${path1 }/img/eco/goonlip2.jfif" class="sm_img2"></label>
	<label for="img_btn3"><img src="${path1 }/img/eco/goonlip3.jfif" class="sm_img3"></label>
	</div>
</section>
<div class="content_blank">
</div>

<section class="cont_sec">
	<article class="cont_art">
	<div style="height:180px"></div>
	<pre>
함안군 산인면에는 뱀이 기어가듯, 구불구불 흐르는 입곡저수지가 있다. 저수지 상류에는 자연생태 그대로 보존된 
'입곡군립공원'이 형성돼 있어, 군민과 시민들에게 쉼터를 제공하고 있다.

일제시대에 농업용수로 사용하기 위해 협곡을 가로막은 입곡저수지는 저수지 양 끝이 보이지 않을 만큼 제법 큰 규모를 자랑한다. 
저수지를 중심으로 왼편에는 깎아지른 절벽에 우거진 송림이, 오른편으로는 완만한 경사지에 활엽수림과 침엽수림이 멋진 조화를 이룬다.

크고 작은 산봉우리들이 저수지를 중심으로 협곡을 이루고 있는 이곳에는 수려한 자연풍광과 함께 전설을 간직하고 있는 
형형색색의 바위와 기암절벽이 그대로 보존돼 있어, 신비로움을 더한다.

공원 입구에 들어서면 은빛으로 반짝이는 저수지가 제일 먼저 눈에 들어온다. 저수지 중앙을 가로 지르는 길이 112m, 
폭 1.5m의 출렁다리를 건너 산책로 일주는 그야말로 일품이다. 버드 나뭇잎이 수면에 길게 늘어져 있고, 
이름모를 꽃과 나무들이 저수지를 끼고 산책로를 따라 둘러쳐져 있다. 간혹 백로가 수려한 자태를 뽐내기도 하는데, 
한 폭의 그림이 따로 없다.

산책로를 돌아나와 운동장에 들어서면 절벽쪽에 인공폭포가 설치되어 있다. 인공폭포는 하절기에 주로 가동되고 있어
 여름철에도 방문객이 끊이지 않는 곳이다.

◆ 소재지 : 함안군 산인면 입곡리, 함안면 대산리 일원
◆ 면적 : 960,695㎡
◆ 시설현황
- 기본시설 : 산림욕장(45ha), 주차장 2개소 158면, 화장실 4개소
- 체육시설 : 다목적운동장 1면, 허리돌리기, 윗몸일으키기, 조합놀이대, 데크휴게소 등
- 편의시설 : 산책로, 팔각정자, 산림욕대, 원목의자, 출렁다리, 인공폭포 등
- 체험시설 : 아라힐링카페(무빙보트 15대, 아라힐링사이클 6라인)

인공폭포 운영 안내
◆ 폭포현황
- 제1폭포 : 폭 12~26m × 높이 35m (2단)
- 제2폭포 : 폭 15m × 높이 10m (1단)

◆ 폭포 운영시간
- 4월 ~ 10월(7개월)
토·일·공휴일 : 11시,13시,14시,15시,16시(5회, 회당 10분정도)
우천시에는 폭포를 운영하지 않습니다.
- 11월 ~ 익년 3월(5개월) : 가동중단

	<span class="cont_adr">
	주소 : ${mapaddr }
관리처  : 함안군 공원관리사업소
문의전화 :  055-580-3423</span>
	</pre>
	</article>
</section>
<section>
	<div id="map" style="width:100%;height:600px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e5844a91d6f6ebd1c2d952b89252020&libraries=services"></script>

<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
$(document).ready(function(){ 
	var hamanMapName = $("#hamAddr").val();
	//alert(hamanMapName);
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 장소를 검색합니다
		 // 경남 함안군 법수면 악양길 49-10
		ps.keywordSearch(hamanMapName, placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
});
</script>

		
</section>

</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>