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
<title>함안악양둑방</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.img_sec {width:600px;height:705px; background-color:rgb(88,173,64);margin:10px 200px;float:right}
.img1 {display:inline-block;width:570px; height:488px;margin:15px ;}
#img_btn1:checked ~ .img1 {background: url(${path1 }/img/eco/hamandookbang1.jfif) no-repeat;background-size:570px 488px;}
#img_btn2:checked ~ .img1 {background: url(${path1 }/img/eco/hamandookbang2.jfif) no-repeat;background-size:570px 488px;}
#img_btn3:checked ~ .img1 {background: url(${path1 }/img/eco/hamandookbang3.jpg) no-repeat;background-size:570px 488px;}
.img23_wrap {width:570px;height :155px; margin:13.5px 15px;text-align:center }
.sm_img1,.sm_img2,.sm_img3 {width:180px; height:155px}
.sm_img1 {float:left}
.sm_img3 {float:right}

.btn_hidden {display:none}

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
	<c:set var="mapname" value="함안악양둑방" />
	<!-- 이곳에 지도주소넣기 -->
	<c:set var="mapaddr" value="경남 함안군 법수면 악양길 49-10" />
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
	<label for="img_btn1"><img src="${path1 }/img/eco/hamandookbang1.jfif" class="sm_img1"></label>
	<label for="img_btn2"><img src="${path1 }/img/eco/hamandookbang2.jfif" class="sm_img2"></label>
	<label for="img_btn3"><img src="${path1 }/img/eco/hamandookbang3.jpg" class="sm_img3"></label>
	</div>
</section>
<div class="content_blank">
</div>

<section class="cont_sec">
	<article class="cont_art">
	<div style="height:180px"></div>
	<pre>
탁 트인 드넓은 둔치, 유유히 흐르는 남강과 모래사장이 끝없이 펼쳐져 있다. 울창한 갯버들 숲과 새벽녘 피어나는 물안개, 
해질녘 노을이 어우러져 낭만과 추억을 길어올릴 수 있는 곳. 가요 처녀뱃사공의 사연을 간직한 악양루와 인근 둑방을 함께 
둘러보면 더 없이 좋다.
	
◾ 악양마을 인근 자전거 대여 : 5,000원/시간
◾ 악양 둑방 길 왕복 6.5km
◾ 악양둑방 계절별 화종
- 봄꽃 : 양귀비,수레국화, 안개초, 끈끈이대나물, 콘포피, 튤립, 꽃잔디 등
- 가을꽃 : 코스모스, 국화 등
- 다년생 : 후록스, 원추리, 동국, 구절초 등
	
<주변 구경거리>
풍차주차장, 비행장삼거리, 갯버들군락지, 강변흙길, 자전거대여, 풍차주차장, 악양루, 처녀뱃사공노래비
	
	
	<span class="cont_adr">
	주소 : ${mapaddr }
관리처  : 함안군 농업기술센터 과수화훼담당
문의전화 : 055-580-4521</span>
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