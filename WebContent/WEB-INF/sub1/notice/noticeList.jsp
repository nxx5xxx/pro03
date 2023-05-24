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
	<h3 class="title is-3 min" style="color:rgb(0,154,218)">●공지사항</h3>

	<table class="table is-hoverable" style="width:100%">
		<c:forEach items="${notList }" var="note">
		<tr>
			<c:if test="${!empty note.file1}">
			<th style="width:30%">
			<img src="${note.file1 }">
			</th>
			<td >
			<a href="${path1 }/GoNoticeDetail.do?nno=${note.nno}">
			<strong>${note.title }</strong><br>
			${note.content }</a>
			</td>
			</c:if> 
			<c:if test="${empty note.file1 }">
			<td colspan="2">
			<a href="${path1 }/GoNoticeDetail.do?nno=${note.nno}">
			<strong>${note.title }</strong><br>
			${note.content }
			</a>
			</td>
			</c:if> 
		</tr>
		</c:forEach>
	</table>

	
	<div style="text-align:right">
	<c:if test="${sid=='admin' }">
	<input type="button" class="button is-info" value="공지글 쓰기" style="float:right" onclick="location.href='${path1 }/GoNoticeInsert.do'">
	</c:if>
	</div>
	<div class="blank" style="margin-bottom:100px"></div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>