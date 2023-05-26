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
	<c:set var="mapname" value="연꽃테마파크" />
	<!-- 이곳에 지도주소넣기 -->	
	<c:set var="mapaddr" value="경남 함안군 가야읍 가야리 233-1" />
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
◆ 현황
- 위치 : 가야읍 가야리 233-1번지 일원(함주공원 주변)
- 면적 : 109,800㎡
- 조성기간 : 2010. 9. ~ 2013. 8(3년간)
- 주요시설 : 연꽃단지, 방문객센터, 전망대, 분수대, 데크시설, 쉼터, 배수장 등
- 공휴일 : 연중무휴
- 관리처 : 함안군 공원관리사업소
- 전화번호 : 055-580-3431

가야지구의 천연늪지를 자연친화적인 테마공원으로 조성하여 군민과 우리 군을 찾는 관광객에 아라가야의 특색 있는 
휴식공간을 제공함으로서 사계절 관광객 유치와 우리군민의 삶의 질을 향상 시킬 수 있는 친환경적인 테마공원을 
조성하고자 2013년에 개장하게 되었다. 함안 연꽃테마파크는 특히 역사적 의의를 가지고 있는 아라연꽃을 특징화시켜 
아라홍련 외 3종의 연꽃을 주제로 조성하였으며, 가시연꽃의 경우는 조성완료 후 법수홍련 밭에서 자연 발아하여 
군에서 종자를 채취 후 0.1ha 면적에 증식시켰다. 또한 2019년에는 기존 수련 공간 일부에 약50여종의 
기타연꽃을 기증 받아 식재 하였다.

* 아라연꽃이란?
아라연꽃은 2009년 5월 성산산성에서 발굴된 씨앗으로 발아시킨 연꽃으로 성분결과 약 700년전 고려시대 연꽃 씨인 것으로 확인되었다. 
이곳 함안지역이 본래 옛 아라가야가 있던 곳이기 때문에 아라연꽃이라 명명하였으며, 
고려시대 불교 탱화에서 볼 수 있는 연꽃의 형태와 색깔을 간직한 채 2009년 7월 7일에 700년 만에 꽃을 다시 피웠다.


	<span class="cont_adr">
	주소 : ${mapaddr }
관리처  : 함안군 공원관리사업소
문의전화 : 055-580-3431</span>
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