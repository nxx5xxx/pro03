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
.main_wrap {width:1000px; margin:0 auto;}
.blank {height:100px}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}
.colred {color:red}
textarea {resize:none}
table {  border-collapse: separate; border-spacing: 10px 10px;}
tr {margin-left:20px}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<h3 class="title is-3 min" style="color:rgb(0,154,218)">●나의 민원</h3>
	<div class="divide">피신고자 정보(필수)</div>

		<table class="table is-fullwidth">
		<tr>
		<th>
		<span class="colred">*</span> 민원 제목
		</th>
		<td>
		${comp.title }
		</td>
		</tr>
		<tr>
		<th>
		<span class="colred">*</span>첨부파일
		</th>
		<td>
		<a href="${comp.file1 }" download>${comp.file1 }</a>
		</td>
		</tr>
		<tr>
		<th>
		<span class="colred">*</span> 민원 내용
		</th>
		<td>
		<pre>${comp.content }</pre>
		</td>
		</tr>
		
		<c:if test="${reply.title == null }">
		<tr>
		<th colspan="2"><h3 class="title is-3 min">해당 답변이 아직 달리지 않았습니다 신속하게 조치하겠습니다</h3></th>
		</tr>
		</c:if>
		<c:if test="${reply.title != null }">

		<tr>
		<th>
		<span class="colred">*</span> 답변 제목
		</th>
		<td>
		${reply.title }
		</td>
		</tr>
		<tr>
		<th>
		<span class="colred">*</span> 답변 내용
		</th>
		<td>
		<pre>${reply.content }</pre>
		</td>
		</tr>
		</c:if>
		</table>
		<c:if test="${sid =='admin' }">
			<c:if test="${reply.title == null }">
				<input type="button" class="button is-info" value="답글 달기"  onclick="location.href='GoReplyInsert.do?cno=${comp.cno }'">&nbsp;
			</c:if>
		</c:if>
		<input type="button" class="button is-info" value="목록으로" style="float:right" onclick="location.href='GoComplainList.do'">
		<input type="button" class="button is-info" value="민원 철회" style="float:right" onclick="deletecomplain(${comp.cno })">
		
		<script>
		function deletecomplain(cno){
			let result = confirm("해당 민원을 철회하시겠습니까?");
			if(result==true){
				location.href="DeleteComplain.do?cno="+cno;
			}
/* 			$.ajax({
					encType:"UTF-8",
					type:"post",
					dataType:"json",
					data: {cno:cno}
			}) */
			
		
			
		}
		</script>
		
	<div class="blank" style="margin-bottom:100px"></div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>