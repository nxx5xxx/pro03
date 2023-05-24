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

		<table class="table is-fullwidth" style="width:100%">
		<tr>
		<th colspan="3"><h3 class="title is-3 min">${notice.title}</h3></th>
		</tr>
		<tr>
		<td style="width:33%">${notice.regdate }</td><td>${notice.views }</td><td>${notice.name }</td>
		</tr>
		<c:if test="${fileName !=null }">
		<tr>
		<td colspan="3">
		<span style="margin-right:10px">${fileName }</span><a href="${notice.file2 }" class="button is-info is-small" download>다운로드</a>
		</td>
		</tr>
		</c:if>
		<tr>
		<td colspan="3">${notice.content }
		<span><br><br></span>
		<c:if test="${!empty notice.file3 }">
		<img src="${notice.file3 }" style="width:100%;height:auto">
		</c:if>
		<br>
		</td>
		</tr>
		<tr>
		<td colspan="3" style="text-align:center">
			<input type="button" class="button is-success" value="목록으로" style="margin-right:20px" onclick="location.href='${path1}/GoNoticeList.do'">
			<c:if test="${sid=='admin' }">
			<input type="button" class="button is-success" value="글 수정" style="margin-right:20px" onclick="location.href='${path1}/GoNoticeUpdate.do?nno=${notice.nno }'">
			<input type="button" class="button is-success" value="글 삭제" onclick="location.href='${path1}/NoticeDelete.do?nno=${notice.nno }'">
			</c:if>
		</td>
		</tr>
		</table>
		
		
	<div style="text-align:right">


	</div>
	<div class="blank" style="margin-bottom:100px"></div>
</div>

<%@ include file="/footer.jsp" %>
</body>
</html>