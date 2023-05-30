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
/* #msg { text-align: center; }
 .page { max-width:1900px; height: auto;} */
.img_container { height:574px; width: 400vw; transition: transform 0.5s; }
.inner { height:574px; width: 100vw; float: left; }
.inner img { width: 100%; }
#btn { font-size: 12px; margin-left: 5px; border-radius:35px; color:#fff; background-color: #fff; width: 19px; height: 19px; }
.btngroup { position: absolute; margin-left: 780px; margin-top: -50px;  }

.notititle { text-align: center; color:#fff; font-size: 34px; font-weight: 600;}
.notice { width: auto; background-color:rgb(0,154,218); color:#fff; font-size: 18px; }
.media { width: 1200px; text-align: center; display: block; margin: 0 auto;}
#noti { font-size: 22px; font-weight: 550; color:#fff;}
#datedeco { position:absolute; margin-left: 530px; margin-top: -140px; }
.datedecotit { position:absolute; margin-left: 565px; margin-top: -130px; font-size: 20px; vertical-align: middle; }
#dt2 { display: block; font-size: 42px; font-weight: 550; color:#fff; margin-top: -12px;}
#dt3 { margin-top: -12px; margin-left: 4px;  16px; }

.tour { background-image: url("${path1 }/img/tourback.png"); height: 550px; }
.tourwp { width: 1200px; float: left; }
.card { width: 780px; height: 330px; border: solid 1px; margin: 10px auto;}
.cardmap { width: 450px; height: 400px; position:absolute; margin-top: -360px; margin-left: 1050px;}

#togu { height: 500px; }
.togu { width: 1200px; height: 500px; position: relative; }
#togu1 { width: 1200px; height: 500px; border: solid 1px; margin: 0; 
		background-image: url("${path1 }/img/togu1.png"); }
#togu2 { width: 400px; height: 500px; border: solid 1px; margin-top: -500px; margin-left: 1205px;
		background-color: #09b;	}
</style>
</head>
<body style="margin: 0">
<%@ include file="/header.jsp" %>
<div class="main_page">
	<div style="overflow: hidden">
	<br>
		<div class="img_container">
			<div class="inner">
				<img alt="main1" src="${path1 }/img/main1.jpg">
			</div>
			<div class="inner">
				<img alt="main2" src="${path1 }/img/main2.jpg">
			</div>
			<div class="inner">
				<img alt="main3" src="${path1 }/img/main3.jpg">
			</div>
			<div class="inner">
				<img alt="main4" src="${path1 }/img/main4.jpg">
			</div>
		</div>
	</div>
	<div class="btngroup">
		<button id="btn" class="btn1">1</button>
		<button id="btn" class="btn2">2</button>
		<button id="btn" class="btn3">3</button>
		<button id="btn" class="btn4">4</button>
	</div>
	<script> 
	/* btn 누르면 transform: translate(-?vw) */ 
	 document.querySelector('.btn1').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-0vw)'; });
	 document.querySelector('.btn2').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-100vw)'; });
	 document.querySelector('.btn3').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-200vw)'; });
	 document.querySelector('.btn4').addEventListener('click', function(){
		document.querySelector('.img_container').style.transform = 'translate(-300vw)'; });
	</script>
	<div class="notice">
	<br><br><h2 class="notititle">함안소식 알림</h2><br><br>
	<img id="datedeco" alt="datedeco" src="${path1 }/img/fpr1deco1.png">
	<span class="datedecotit">2023<strong id="dt2">05</strong><p id="dt3">may</p></span> 
    <article class="media">
      <figure class="media-left">
        <p class="image is-128x128">
          <img src="https://bulma.io/images/placeholders/96x96.png">
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
            <strong id="noti">함안소식 1</strong>
            <br>
            Sed convallis scelerisque mauris, non pulvinar nunc mattis vel. Maecenas varius felis sit amet magna vestibulum euismod malesuada cursus libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus lacinia non nisl id feugiat.
            <br>
          </p>
        </div>
      </div>
    </article>
    <article class="media">
      <figure class="media-left">
        <p class="image is-128x128">
          <img src="https://bulma.io/images/placeholders/96x96.png">
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
            <strong id="noti">함안소식 2</strong>
            <br>
            Sed convallis scelerisque mauris, non pulvinar nunc mattis vel. Maecenas varius felis sit amet magna vestibulum euismod malesuada cursus libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus lacinia non nisl id feugiat.
            <br>
          </p>
        </div>
      </div>
    </article>
    <article class="media">
      <figure class="media-left">
        <p class="image is-128x128">
          <img src="https://bulma.io/images/placeholders/96x96.png">
        </p>
      </figure>
      <div class="media-content">
        <div class="content">
          <p>
            <strong id="noti">함안소식 3</strong>
            <br>
            Sed convallis scelerisque mauris, non pulvinar nunc mattis vel. Maecenas varius felis sit amet magna vestibulum euismod malesuada cursus libero. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Phasellus lacinia non nisl id feugiat.
            <br>
          </p>
          <br><br>
        </div>
      </div>
    </article>
  </div>
	<div class="tour">
			<br><br>
			<h2 class="title" style="text-align: center;">함안으로 떠나자!</h2>
		<div class="tourwp">
			<div class="card">
			</div>
			<div class="cardmap">
				<img alt="map" src="${path1 }/img/map.png">
			</div>
		</div>
	</div>
	<div id="togu">
		<ul class="togu">
			<li id="togu1">
				<strong>권역여행 지도</strong>
			</li>
			<li id="togu2">
				<strong>여행도우미</strong>
			</li>
		</ul>
		<br><br>
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>