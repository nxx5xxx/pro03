<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
a { color: #333; }
#level1 a { color: #fff; }
#level2 a { margin-top: -70px; }
#level3 span { display:block; margin-top: -70px; margin-left: 500px; font-size: 90%;}
.fix_area { position:fixed; z-index:9999; bottom:50px; right:50px; }
.fix_area .cir_box { display:block; width: 60px; height: 60px; text-align:center; color:#fff;
border-radius:35px; box-sizing: border-box; padding: 6px; font-size:15px; 
overflow:hidden; box-shadow:1px 1px 6px #333; }
.fix_area .totop { background-color:rgb(0,154,218); margin-top: 10px; }
</style>
<footer class="footer" style="height: 250px; background-color: #fff;">
	<div class="fix_area">
     <a href="#" class="cir_box totop">↑<br>TOP</a>
	</div>
  <nav class="level" id="level1" style="background-color: rgb(0,154,218); height: 50px;">
  <p class="level-item has-text-centered">
    <a class="link is-info">실과소 바로가기</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info">읍면 바로가기</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info">도,시군청 바로가기</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info">유관기관,단체 바로가기</a>
  </p>
 </nav>
  <nav class="level" id="level2">
  <p class="level-item has-text-centered">
    <img src="./img/foot_logo.png" alt="logo" style="width:190px; height: 62px;">
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info">개인정보 처리방침</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info">저작권정책</a>
  </p>
  <p class="level-item has-text-centered">
    <a class="link is-info">오시는길</a>
  </p>
  <p class="level-item has-text-centered">
    <img src="./img/foot_mark.png" alt="logo" style="width:112px; height: 77px;">
  </p>
  </nav>
  <nav class="level" id="level3">
    <span>(52043) 경상남도 함안군 가야읍 말산로 1 (함안군청) &nbsp;&nbsp;&nbsp; 대표전화 : 055-580-2114 &nbsp;&nbsp;&nbsp; 팩스 : 055-580-2899<br>
  		  본 사이트에 게시된 이메일주소의 자동수집을 거부하며, 이를 위반 시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.<br>
  		Copyright (C) 2019 Haman County Office. All rights reserved.</span>
 </nav>
</footer>