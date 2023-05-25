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
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.img_sec {width:600px;height:700px; background-color:rgb(88,173,64);margin:10px 200px;float:right}
.img1 {width:570px; height:488px;margin:15px}
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
	<c:set var="mapname" value="입곡문화공원" />
	<!-- 이곳에 지도주소넣기 -->	
	<c:set var="mapaddr" value="경남 함안군 산인면 입곡리 1089" />
	<input type="hidden" id="hamAddr" value="${mapaddr }">
	
	
		<h2 class="is-size-2" style="color:rgb(88,173,64);font-weight:bold">${mapname }</h2>
		<hr style="width:265px;margin:0;background-color:lightgray">
	</div>
<section class="img_sec">
	<div class="img1_wrap"><img src="${path1 }/img/eco/hamandookbang1.jfif" class="img1"></div>
	<div class="img23_wrap">
	<img src="${path1 }/img/eco/hamandookbang1.jfif" class="sm_img1">
	<img src="${path1 }/img/eco/hamandookbang2.jfif" class="sm_img2">
	<img src="${path1 }/img/eco/hamandookbang3.jpg" class="sm_img3">
	</div>
</section>
<div class="content_blank">
</div>

<section class="cont_sec">
	<article class="cont_art">
	<div style="height:180px"></div>
	<pre>
함안군 산인면 입곡리 1089번지 일원에 소재한 입곡문화공원은 입곡군립공원 공설운동장 안 골짜기에 위치하고 있으며 60,250㎡의 면적에 연못, 산책로, 무늬화단, 유리온실, 미로원 등을 조성하여 함안군의 새로운 관광지로 발돋움하고 있다.

화려함과 은은함이 조화를 이루는 드넓은 야생화 꽃밭과 낙엽교목과 상록교목이 교차하는 녹지, 철 따라 운치가 살아나는 연못, 산책로가 멋지게 펼쳐져 있으며,

유리온실에는 먼나무, 녹나무, 굴거리나무, 하귤나무 등의 교목류와 소펄, 관음죽, 멀꿀, 중대 가리나무, 탐라산수국, 돈나무 등의 관목류 5와 지피식물인 애란, 모람 등이 심겨져 있어 아름다운 꽃들과 다양한 식물들을 구경할 수 있다.

야생화 꽃밭에는 원추리, 상사화, 기린초, 쑥부쟁이, 꽃창포, 털부처꽃, 수선화 등 아름다운 우리 꽃 17종류 3만 5000뿌리 심겨져 자연이 가진 아름다움을 마음껏 누리고 사진에 담을 수 있는 사진촬영의 명소가 될 전망이다.


	<span class="cont_adr">
	주소 : ${mapaddr }
관리처  : 함안군 공원관리사업소
문의전화 : 055-580-3411</span>
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