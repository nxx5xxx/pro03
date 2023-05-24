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

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<h3 class="title is-3 min" style="color:rgb(0,154,218)">●포토갤러리 수정</h3>
	<form action="${path1 }/PhotoUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pno" value="${pt.pno }">
		<table class="table is-hoverable" style="width:100%">
		<tr>
		<th>
			<h3 class="title is-3 min" style="line-height:48.8px" >제목</h3>
		</th>
		<td>
			<input class="input is-medium" type="text" name="title" value="${pt.title }" required>	
		</td>
		</tr>
		
		<tr>
		<th colspan="2">
			<h5 class="title is-5 min" >본문내용</h5>
			<textarea style="width:100%;height:400px" name="content"  required>${pt.content }</textarea>
		</th>
		</tr>
		<tr>
		<td colspan="2">
		${fileName1 }
		<input type="file" name="file1" > - 대표 이미지로 설정됩니다
		</td>
		</tr>
		<tr>
		<td colspan="2">
		${fileName2 }
		<input type="file" name="file2" >
		</td>
		</tr>
		<tr style="text-align:center">
		<td colspan="2">
		<input type="button" class="button is-info" value="목록으로" style="margin-right:30px" onclick="location.href='${path1}/PhotoList.do'">
		<input type="submit" class="button is-info" value="글수정" style="margin-right:30px" >
		<input type="button" class="button is-info" value="글삭제" onclick="location.href='${path1}/PhotoDel.do?pno=${pt.pno }'">
		</td>
		</tr>

		
		</table>
	</form>
	
	<div style="text-align:right">


	</div>
	<div class="blank" style="margin-bottom:100px"></div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>