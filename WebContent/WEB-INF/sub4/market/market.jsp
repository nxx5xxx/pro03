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
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 250px; height: 160px; }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2 class="title" style="text-align: center;">함안 전통시장 소개</h2>
		<article class="agree_fr">
			<div class="box">
			  <article class="media">
			    <div class="media-left">
			      <figure>
			        <img src="${path1 }/data/market/m1_1.jpg" alt="가야전통시장" class="image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      	<h3>가야전통시장</h3>
				        <p>
							지역 상권의 중심으로 군을 대표하는 전통 재래시장의 명소로 지역민들의 많은 사랑을 받고 있으며 
							상설 및 정기(매월 5일, 10일, 15일, 20일, 25일, 30일(마지막 날))적으로 열리고 있다.
				        </p>
			          	<a class="button is-fullwidth is-info is-light" href="" >자세히보기 ></a>
			    </div>
			    </div>
			  </article>
			  <article class="media">
			    <div class="media-left">
			      <figure>
			        <img src="${path1 }/data/market/m2_1.jpg" alt="칠원전통시장" class="image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      	<h3>칠원전통시장</h3>
				        <p>
							칠원읍 구성리 일원에서 정기적으로 매월 3일, 8일, 13일, 18일, 23일, 28일 열린다. 
							62년에 개설되었으며 주변에서 생산되는 농산물과 어물전, 의복류등이 주종을 이루어 거래되고 있다.
				        </p>
			          	<a class="button is-fullwidth is-info is-light" href="" >자세히보기 ></a>
			    </div>
			    </div>
			  </article>
			  <article class="media">
			    <div class="media-left">
			      <figure>
			        <img src="${path1 }/data/market/m3_1.jpg" alt="군북전통시장" class="image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      	<h3>군북전통시장</h3>
				        <p>
							군북면 중암리에서 정기적으로 매월 4일, 9일, 14일, 19일, 24일, 29일 열린다. 
							1960년 현 위치에 개설되어 오늘에 이르고 있으며, 어물전 및 지역에서 생산되는 농산물과 기타 생활 잡화가 거래되고 있다.
				        </p>
			          	<a class="button is-fullwidth is-info is-light" href="" >자세히보기 ></a>
			    </div>
			    </div>
			  </article>
			  <article class="media">
			    <div class="media-left">
			      <figure>
			        <img src="${path1 }/data/market/m4_1.jpg" alt="대산전통시장" class="image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      	<h3>대산전통시장</h3>
				        <p>
							대산면 구혜리 일원에서 정기적으로 매월 1일, 6일, 11일, 16일, 21일, 26일 열린다. 
							62년도에 개설되어 현재에 이르고 있으며, 창녕군과 의령군이 연접하여 이웃군민이 많이 찾는 장으로, 
							각종 생필품이 거래되고 철따라 주변에서 생산되는 채소, 과일등이 거래되고 있다.
				        </p>
			          	<a class="button is-fullwidth is-info is-light" href="" >자세히보기 ></a>
			   	 </div>
			    </div>
			  </article>
			</div>
		</article>		
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>