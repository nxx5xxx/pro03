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
<title>축제행사 > 함안수박축제</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.img_sec {width:600px;height:705px; background-color:rgb(0,154,218);margin:10px 200px;float:right}
.img1 {display:inline-block;width:570px; height:488px;margin:15px ;}
#img_btn1:checked ~ .img1 {background: url(${path1 }/img/event/ev1_1.jpg) no-repeat;background-size:570px 488px;}
#img_btn2:checked ~ .img1 {background: url(${path1 }/img/event/ev1_2.jpg) no-repeat;background-size:570px 488px;}
#img_btn3:checked ~ .img1 {background: url(${path1 }/img/event/ev1_3.jpg) no-repeat;background-size:570px 488px;}
.img23_wrap {width:570px;height :155px; margin:13.5px 15px;text-align:center }
.sm_img1,.sm_img2,.sm_img3 {width:180px; height:155px}
.sm_img1 {float:left}
.sm_img3 {float:right}

.btn_hidden {display:none}

.content_blank {width:100%; height :592px ;background-color:transparent;}
.cont_sec {width:100%; background-color:rgb(122, 196, 227)}
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
	<c:set var="mapname" value="함안수박축제" />
	<!-- 이곳에 지도주소넣기 -->
	<c:set var="mapaddr" value="경남 함안군 가야읍 도항리 249-52" />
	<input type="hidden" id="hamAddr" value="${mapaddr }">
	
	
		<h2 class="is-size-2" style="color:rgb(0,154,218);font-weight:bold">${mapname }</h2>
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
	<label for="img_btn1"><img src="${path1 }/img/event/ev1_1.jpg" class="sm_img1"></label>
	<label for="img_btn2"><img src="${path1 }/img/event/ev1_2.jpg" class="sm_img2"></label>
	<label for="img_btn3"><img src="${path1 }/img/event/ev1_3.jpg" class="sm_img3"></label>
	</div>
</section>
<div class="content_blank">
</div>

<section class="cont_sec">
	<article class="cont_art">
	<div style="height:180px"></div>
	<pre>
◆ 겨울수박의 80%정도의 시장 점유률을 자랑하는 함안수박
전국 수박 생산의 11%, 경남의 36%를 차지하고 있으며 남강과 낙동강의변의 기름진 층적토와 동서간의 폭이 29Km, 
남북간의 길이가 30Km로 겨울철 햇빛쪼임이 좋고 눈(폭설)피해가 없는 온화한 기후에서 생산되고 있으며 
200년 이상의 재배역사성과 대한민국에서도 가장 일찍 출하되는 함안수박은 겨울수박의 80% 정도의 시장 점유률을 자랑하고 있다. 
2010년도 기준 1800여농가에서 1900여 톤을 생산 700억원의 매출을 자랑하고 있으며,
다양한 기능성컬러수박(씨 없는 수박, 유색계 수박)생산의 본고장으로서의 명성이 널리 알려져 있다. 
대한민국 대표수박 함안수박축제는 2009년 제16회 수박축제를 군단위 축제로 격상 성공적으로 추진되었으며, 
2011년도 제18회를 맞이하게 되었다.

◆ 행정구역 및 지리적 위치
- 행정구역
총면적 416.8㎢로 경남의 3.9%에 달하며 해발 10.4m에 위치하고 있음
1읍 9면 88개 법정리와 246개의 행정리, 839개의 반과 460개의 자연마을로 구성되어 있음
- 지리적 위치
서울에서 281Km 대구에서 67Km, 창원에서는 25Km에 위치함
동쪽으로는 창원시, 남동쪽과 동쪽은 마산시, 서쪽은 진주시, 서북쪽은 남강을 경계로하여 의령군이, 
북쪽으로는 창영군이 낙동강을 경계로 접하고 있음

◆ 접근성
함안군은 남해고속국도 및 중부내륙고속국도와 국도 5호선, 79호선이 지역간 연결기능을 담당하고 있어 
대전-통영간 고속국도, 신대구-부산간 고속국도와 연계시 대전, 대구, 부산 등 
주요 관역도시와 1시간 30분 거리에 있는 접근성이 양호한 지역임

◆ 주요행사내용
- 식전행사 : 풍년농사기원제, 수박완 선발대회(수박아줌마 선발 등), 우수농가 시상식
- 전시·홍보전 : 우수농산물전시, 새로운품종 전시, 수박품평회, 수박조각전, 수박화분전시
- 경연대회 : 수박 트렄에 빨리싣기(한국기록원 등제), 수박품평회, 수박요리경연
- 이벤트행사 : 수박축구, 수박씨멀리밷기, 수박빨리먹기, 수박무게·당도 맞추기, 수박퀴즈 등
- 부대행사 및 서비스 : 수박특별 판매장 운영, 무료주점, 돼지고기 시식전, 수박화채제공 등
	
	
	<span class="cont_adr">
	주소 : ${mapaddr }
관리처  : 함안군 농업기술센터
문의전화 : 055-580-4511</span>
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