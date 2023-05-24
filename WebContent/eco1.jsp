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
.cont_sec {width:100%; min-height : 750px; background-color:rgb(81,154,56)}
.cont_art {padding:20px;}
.cont_adr {float:right; text-align:right}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<div style="text-align:right; float:right">
		<h2 class="is-size-2" style="color:rgb(88,173,64);font-weight:bold">함안악양둑방</h2>
		<hr style="width:265px;margin:0;background-color:lightgray">
	</div>
<section class="img_sec">
	<div class="img1_wrap"><img src="/img/eco/hamandookbang3.jpg" class="img1"></div>
	<div class="img23_wrap">
	<img src="/img/eco/hamandookbang3.jpg" class="sm_img1">
	<img src="/img/eco/hamandookbang3.jpg" class="sm_img2">
	<img src="/img/eco/hamandookbang3.jpg" class="sm_img3">
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
	주소 : 경남 함안군 법수면 악양길 49-10
관리처  : 함안군 농업기술센터 과수화훼담당
문의전화 : 055-580-4521</span>
	</pre>
	</article>
</section>

</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>