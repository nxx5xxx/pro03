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
	<h3 class="title is-3 min" style="color:rgb(0,154,218)">●고객 민원 답변</h3>
	<div class="divide">고객의 민원 내용</div>
	
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
		<a href="" download>${comp.file1 }</a>
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
		
<div class="divide">담당자 답변</div>
<c:if test="${reply.title == null }">

		<form action="${path1 }/ReplyInsert.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cno" value="${cno }">
			<input type="hidden" name="sid" value="${sid }">
			<table class="table is-fullwidth">
			<tr>
			<th>이름(개인,기업,단체)</th> <td><input type="text" name="name" placeholder="내용을 입력해주세요" required></td>
			<th>주 소</th><td><input type="text" name="addr" placeholder="내용을 입력해주세요" required></td>
			</tr>
			<tr>
			<th>근무처(상호명)</th> <td><input type="text" name="company" placeholder="내용을 입력해주세요" required></td>
			<th>연락처</th><td><input type="text" name="tel" placeholder="내용을 입력해주세요" required></td>
			</tr>
			</table>
		
			<table class="table is-fullwidth">
			<tr>
			<th>
			<span class="colred">*</span> 민원 제목
			</th>
			<td>
			<input type="text" name="title" placeholder="내용을 입력해주세요" required>
			</td>
			</tr>
			<tr>
			<th>
			<span class="colred">*</span> 민원 내용
			</th>
			<td>
			<textarea rows="20" cols="100" name="content" placeholder="내용을 입력해주세요" required></textarea>
			</td>
			</tr>
			<tr>
			<th>
			첨부파일
			</th>
			<td>
			<input type="file" name="file1">
			</td>
			</tr>
			</table>
		<input type="submit" class="button is-info" value="답글 달기" style="float:right">
	</form>
</c:if>
		

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