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
<title>포토 갤러리</title>
<style>
.main_wrap {width:1000px; margin:0 auto;min-height:700px}
.blank {height:100px}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}
.colred {color:red}
textarea {resize:none}
table {  border-collapse: separate; border-spacing: 10px 10px;}
tr {margin-left:20px}
.r_n_v {width:33%}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<h3 class="title is-3 min" style="color:rgb(0,154,218)">●포토갤러리</h3>
		<table class="table is-hoverable" style="width:100%">
		<tr>
		<th colspan="3">
			<h3 class="title is-3 min" style="line-height:48.8px" >${pt.title }</h3>
		</th>
		</tr>
		<tr style="text-align:left">
				<td class="r_n_v">
				<h6 class="title is-6">
				${pt.regdate }</h6>
				</td>
				<td class="r_n_v">
				<h6 class="title is-6">|</h6>
				</td>
				<td class="r_n_v">
				<h6 class="title is-6">${pt.name }</h6>
				</td>
		</tr>
		<tr>
		<th colspan="3">
			<pre style="background-color:white; font-size:16px">${pt.content }</pre>
		</th>
		</tr>
		<tr>
		<td colspan="3">
		<img src="${pt.file1 }">
		</td>
		</tr>
		<tr>
		<td colspan="3">
		<img src="${pt.file2 }">
		</td>
		</tr>
		<tr style="text-align:center">
		<td colspan="3">
		<input type="button" class="button is-info" value="목록으로" style="margin-right:30px" onclick="location.href='${path1}/PhotoList.do'">
		<c:if test="${pt.id == sid || sid == 'admin'}">
		<input type="button" class="button is-info" value="글수정" style="margin-right:30px" onclick="location.href='${path1}/GoPhotoUpdate.do?pno=${pt.pno }'">
		<input type="button" class="button is-info" value="글삭제" onclick="location.href='${path1}/PhotoDel.do?pno=${pt.pno }'">
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