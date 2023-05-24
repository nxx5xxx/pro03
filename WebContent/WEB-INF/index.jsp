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
#msg { text-align: center; }
.page { height: auto;}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="page" id="msg">
	<hr><br><br>
	<strong>메인 슬라이드 영역</strong>
	<br><br><br><hr>
	<br><br><br>
	<strong>공지사항 함안소식 / 슬라이드(선택)</strong>
	<br><br><br><hr>
	<br><br><br>
	<strong>함안으로 떠나자 / 지역별 관광지 / 지도</strong>
	<br><br><br><hr>
	<br><br><br>
	<strong>월간일정 / 여행도우미</strong>
	<br><br><br><hr>
	<br><br><br>
	<strong>권역여행 지도</strong>
	<br><br><br>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>