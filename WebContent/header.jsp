<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" /> 
<%
	String sid = "";
	if(session!=null) sid = (String) session.getAttribute("sid");  
%>
<link href="source/bulma.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
.navbar-link { margin-right: 50px; }
#adminmode { width: 71%; }
</style>
<header id="header" class="container">
<nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <a href="${path }/">
      <img src="./img/logo.png" alt="logo" width="321px;" height="56px;" style="margin-top: 10px; margin-right: 60px;">
    </a>
    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>
  <div id="navbarBasicExample" class="navbar-menu" style="margin-top: 10px;">
    <div class="navbar-start">
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">공지사항</a>
        <div class="navbar-dropdown">
          <a class="navbar-item" href="${path }/GoNoticeList.do">함안소식</a>
          <c:if test="${sid == null }">
          <a class="navbar-item" href="${path }/UserLogin.do">고객민원</a></c:if>
          <c:if test="${sid != null }">
          <a class="navbar-item" href="${path }/GoComplainList.do">고객민원</a>
          </c:if>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">축제행사</a>
        <div class="navbar-dropdown">
          <a class="navbar-item" href="Event1.do">함안수박축제</a>
          <a class="navbar-item" href="Event2.do">함안낙화놀이</a>
          <a class="navbar-item" href="Event3.do">해바라기축제</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">함안여행</a>
        <div class="navbar-dropdown">
          <span class="navbar-item"><strong>문화재</strong></span>
          <a class="navbar-item" href="${path }/Cultural.do">문화재현황</a>
          <hr class="navbar-divider">
          <span class="navbar-item"><strong>생태관광</strong></span>
          <a class="navbar-item" href="${path }/Eco1.do">함안악양둑방</a>
          <a class="navbar-item" href="${path }/Eco2.do">입곡문화공원</a>
          <a class="navbar-item" href="${path }/Eco3.do">입곡군립공원</a>
          <a class="navbar-item" href="${path }/Eco4.do">연꽃테마파크</a>
          <a class="navbar-item" href="${path }/Eco5.do">악양생태공원</a>
          <hr class="navbar-divider">
		<span class="navbar-item"><strong>역사여행</strong></span>
		<a class="navbar-item" href="${path }/History1.do">함안광심정</a>
		<a class="navbar-item" href="${path }/History2.do">함안악양루</a>
		<a class="navbar-item" href="${path }/History3.do">원효암 칠성각</a>
		<a class="navbar-item" href="${path }/History4.do">장춘사 대웅전</a>
        </div>
      </div>
      <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">관광안내</a>
        <div class="navbar-dropdown">
          <span class="navbar-item"><strong>여행갤러리</strong></span>
          <a class="navbar-item" href="${path }/PhotoList.do">포토갤러리</a>
          <hr class="navbar-divider">
          <span class="navbar-item"><strong>관광지도</strong></span>
          <a class="navbar-item" href="Market.do">전통시장</a>
          <a class="navbar-item" href="Food.do">음식점</a>
          <a class="navbar-item" href="Accom.do">숙박시설</a>
          <hr class="navbar-divider">
		<span class="navbar-item"><strong>교통안내</strong></span>
		<a class="navbar-item" href="${path }/Traffic1.do">시내/시외버스</a>
		<a class="navbar-item" href="${path }/Traffic2.do">공영버스/농어촌버스</a>
		<a class="navbar-item" href="${path }/Traffic3.do">기차/택시</a>
        </div>
      </div>
      </div>
    </div>
    <div class="navbar-end">
      <div class="navbar-item">
        <div class="buttons">
        <c:if test="${empty sid }">
          <a class="button is-primary" href="UserLogin.do"><strong>로그인</strong></a>
          <a class="button is-light" href="UserAgree.do">회원가입</a>
         </c:if>
         <c:if test="${!empty sid && sid!='admin'}">
          <a class="button is-primary" href="MyPage.do"><strong>내 정보</strong></a>
          <a class="button is-light" href="UserLogout.do">로그아웃</a>
         </c:if>
         <c:if test="${sid=='admin' }">
          <a class="button is-warning is-fullwidth" href="#" id="adminmode"><strong>관리자</strong></a>
          <a class="button is-light" href="AdminUser.do">회원관리</a>
          <a class="button is-danger is-light" href="UserLogout.do">로그아웃</a>
         </c:if>
        </div>
      </div>
    </div>
</nav>
</header>