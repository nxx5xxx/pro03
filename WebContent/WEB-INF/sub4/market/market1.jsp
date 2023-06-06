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
<title>관광안내 > 관광지도 > 전통시장</title>
<style>
.title { padding-top:36px;}
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 250px; height: 160px; }

.mid_img {width:43%;margin-right:30px;margin-left:30px}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>

	<!-- value에 관광지이름 넣으면 알아서 적용돼요 -->
	<c:set var="mapname" value="가야전통시장" />
	<!-- 이곳에 지도주소넣기 -->
	<c:set var="mapaddr" value="경남 함안군 가야읍 가야8길 8" />
	<input type="hidden" id="hamAddr" value="${mapaddr }">
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<article class="agree_fr">
			<div class="box" style="width: 1000px">
		<h2 class="title is-size-2" style="text-align: center;line-height:20px">"${mapname }"</h2>
		<hr style="width:300px; margin: 0 auto;margin-bottom:20px;background-color: lightgray">
			<div style="width:500px;margin: 0 auto"><img src="${path1 }/data/market/m1_1.jpg"></div>
			<pre style="font-weight:bold;background-color:transparent;text-align:center">
관내 5일장 중 가장 큰 장으로 외지상인들이 많이 찾는다. 
장날에는 아침 일찍부터 해질 무렵까지 장이 서며 쌀, 고추, 참깨, 마늘, 배추 등
 주변에서 생산된 신선하고 청결한 농산물과 어물전, 의복류 등 기타 생활 필수품들이 거래되고 있다.</pre>
 <hr>
	 <div style="width:900px;margin: 0 auto;text-align:center">
		 <img src="${path1 }/data/market/m1_2.jpg" class="mid_img">
		 <img src="${path1 }/data/market/m1_3.jpg" class="mid_img">
		 <p style="padding-top:20px"><strong>운영일 :</strong> 매월 5일, 10일, 15일, 20일, 25일, 30일((말일이 31일인 경우 31일)</p>
	 </div>
	 <hr>
	 <div style="width:900px;margin: 0 auto;text-align:center">
 		 <p style="padding:20px"><strong>주소 : </strong>${mapaddr }</p>
 		 <div id="map" style="width:100%;height:600px;"></div>
 	 </div>
 
			</div>
			
		</article>		
	</div>
</div>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4e5844a91d6f6ebd1c2d952b89252020&libraries=services"></script>

<script>
$(document).ready(function(){ 
	var hamanMapName = $("#hamAddr").val();
	//alert(hamanMapName);
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	var mapContainer = document.getElementById('map'), 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567),
	        level: 3 
	    };  
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var ps = new kakao.maps.services.Places(); 
		ps.keywordSearch(hamanMapName, placesSearchCB); 
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       
        map.setBounds(bounds);
    } 
}
function displayMarker(place) {
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    kakao.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}
});
</script>
<%@ include file="/footer.jsp" %>
</body>
</html>