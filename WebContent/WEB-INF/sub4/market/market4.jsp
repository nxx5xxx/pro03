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
	<c:set var="mapname" value="대산전통시장" />
	<!-- 이곳에 지도주소넣기 -->
	<c:set var="mapaddr" value="경남 함안군 대산면 대산중앙로 219" />
	<input type="hidden" id="hamAddr" value="${mapaddr }">
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<article class="agree_fr">
			<div class="box" style="width: 1000px">
		<h2 class="title is-size-2" style="text-align: center;line-height:20px">"${mapname }"</h2>
		<hr style="width:300px; margin: 0 auto;margin-bottom:20px;background-color: lightgray">
			<div style="width:500px;margin: 0 auto"><img src="${path1 }/data/market/m4_1.jpg"></div>
			<pre style="font-weight:bold;background-color:transparent;text-align:center">
1962년도에 개설되어 현재에 이르고 있으며, 
1997년 지역경제 활성화를 위하여 재개발하였으며 창녕군과 의령군이 연접하여 이웃군민이 많이 찾는 장으로, 
각종 생필품이 거래되고 철따라 주변에서 생산되는 채소, 과일 등이 거래되고 있다.</pre>
 <hr>
	 <div style="width:900px;margin: 0 auto;text-align:center">
		 <img src="${path1 }/data/market/m4_2.jpg" class="mid_img">
		 <img src="${path1 }/data/market/m4_3.jpg" class="mid_img">
		 <p style="padding-top:20px"><strong>운영일 :</strong> 정기(매월 1, 6, 11, 16, 21, 26일)</p>
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