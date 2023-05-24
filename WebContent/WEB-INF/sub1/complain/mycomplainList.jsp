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
<title>민원게시판</title>
<style>
.main_wrap {width:1000px; margin:0 auto;min-height:700px}
.blank {height:100px}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}
.colred {color:red}
textarea {resize:none}
table {  border-collapse: separate; border-spacing: 10px 10px;}
tr {margin-left:20px}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<c:if test="${sid == 'admin' }"><h3 class="title is-3 min" style="color:rgb(0,154,218)">●민원 목록</h3></c:if>
	<c:if test="${sid != 'admin' }">	<h3 class="title is-3 min" style="color:rgb(0,154,218)">●나의 민원 목록</h3></c:if>

	<table class="table is-fullwidth">
		<tr>
		<th colspan="3">
		※ 민원인의 개인정보를 위해 민원인의 민원목록은 최대 10개까지만 수집합니다
		</th>
		</tr>
		
		<c:forEach items="${compList }" var="comp">
		<tr>
		<th style="width:20%"> <span class="colred">*</span>민원제목</th>
		<td><a href="${path1 }/GoComplainDetail.do?cno=${comp.cno}">${comp.title }</a></td>
		<td style="text-align:right">
		<c:if test="${comp.comsw==3 }">답변완료</c:if>
		<c:if test="${comp.comsw==1 }">답변대기</c:if>
		
		</td>
		</tr>
		</c:forEach>
	</table>

	<div class="blank" style="margin-bottom:100px"></div>
	<div style="text-align:right">
	<input type="button" class="button is-info" value="민원 신청" style="float:right" onclick="location.href='${path1 }/GoComplainInsert.do'">
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>