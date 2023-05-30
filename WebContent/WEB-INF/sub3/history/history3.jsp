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
<title>원효암 칠성각</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.img_sec {width:600px;height:705px; background-color:rgb(241,92,48);margin:10px 200px;float:right}
.img1 {display:inline-block;width:570px; height:488px;margin:15px ;}
#img_btn1:checked ~ .img1 {background: url(${path1 }/img/his/wonhyo1.jpg) no-repeat;background-size:570px 488px;}
#img_btn2:checked ~ .img1 {background: url(${path1 }/img/his/wonhyo2.jfif) no-repeat;background-size:570px 488px;}
#img_btn3:checked ~ .img1 {background: url(${path1 }/img/his/wonhyo3.jfif) no-repeat;background-size:570px 488px;}
.btn_hidden {display:none}
.img23_wrap {width:570px;height :155px; margin:13.5px 15px;text-align:center }
.sm_img1,.sm_img2,.sm_img3 {width:180px; height:155px}
.sm_img1 {float:left}
.sm_img3 {float:right}

.content_blank {width:100%; height :592px ;background-color:transparent;}
.cont_sec {width:100%; background-color:rgb(252,177,49)}
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
	<c:set var="mapname" value="원효암 칠성각" />
	<!-- 이곳에 지도주소넣기 -->
	<c:set var="mapaddr" value="경남 함안군 군북면 사촌리 산 70-1" />
	<input type="hidden" id="hamAddr" value="원효암 칠성각">
	
	
		<h2 class="is-size-2" style="color:rgb(241,92,48);font-weight:bold">${mapname }</h2>
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
	<label for="img_btn1"><img src="${path1 }/img/his/wonhyo1.jpg" class="sm_img1"></label>
	<label for="img_btn2"><img src="${path1 }/img/his/wonhyo2.jfif" class="sm_img2"></label>
	<label for="img_btn3"><img src="${path1 }/img/his/wonhyo3.jfif" class="sm_img3"></label>
	</div>
</section>	
<div class="content_blank">
</div>

<section class="cont_sec">
	<article class="cont_art">
	<div style="height:180px"></div>
	<pre style="white-space: pre-wrap;">

원효암 칠성각은 원효대사와 의상대사가 수도한 곳

함안군 군북면 사촌4길 863 내 위치한 원효암 칠성각(元曉庵 七星閣)은 원효대사와 의상대사가 수도한 곳이라 
전하나 창건연대와 연혁은 알 수 없고, 절의 이름을 원효암이라 하고 의상대(儀湘臺)가 있는 것으로 보아 
의상대사가 창건한 것으로 추정되나 확실하지는 않다.

원효암은 6 · 25때 소실되고 의상대는 소실되지 않았으나, 창건연대는 미상이며, 
사기(寺記)에 의하면 1370년 세운 것으로 기록되어 있다. 1983년 7월 20일 문화재자료 제15호로 지정되어 보호되고 있다.
	<span class="cont_adr">
	주소 : ${mapaddr }
관리처  : 문화유산관광담당관 문화유산담당
문의전화 : 055-580-2551</span>
	</pre>
	</article>
</section>
<section>
	<div id="map" style="width:100%;height:600px;"></div>
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

		
</section>

</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>