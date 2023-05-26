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
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.sec {width:450px; height:350px; margin:25px; background-color:rgb(253, 250, 250); float:left}
.sec_img {width:410px; height:200px; margin:12.5px auto; background-color:black}
.img_area {width:100%; height:100%;}
.text_area {width:410px; margin:12.5px auto; margin-top:25px;}


.r_n_v {width:33%}

.pagelist {clear:both; width:560px;height:50px; margin:0 auto; background-color:green}
.listboxc {cursor:pointer;width:50px;height:50px;border: 1px solid rgb(224, 224, 224); float:left;margin-right:20px;text-align:center;line-height:50px}
.listbox {width:50px;height:50px;border: 1px solid rgb(224, 224, 224); float:left;margin-right:20px;text-align:center;line-height:50px}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>
<article class="main_wrap">
	<c:forEach items="${ptl }" var="pt">
	<section class="sec" onclick="location.href='${path1 }/PhotoDetail.do?pno=${pt.pno }'" style="cursor:pointer;">
		<article class="sec_img">
		<!-- 파일1 썸네일 이미지 -->
		<img src="${pt.file1 }" class="img_area">
		</article>
		
		
		<article class="text_area">
		<!-- 제목과 조회수 및 등록일 -->
		<table class="table is-fullwidth" style="background-color:transparent;">
			<tr>
				<th colspan="3">
				<h1 class="title">${pt.title }</h1>
				</th>
			</tr>
			
			<tr style="text-align:center">
				<td class="r_n_v">
				<h6 class="title is-6">
				<fmt:parseDate value="${pt.regdate }" pattern="yyyy-MM-dd" var="date1" />
				<fmt:formatDate value="${date1 }" type="date" dateStyle="medium" /></h6>
				</td>
				<td class="r_n_v">
				<h6 class="title is-6">|</h6>
				</td>
				<td class="r_n_v">
				<h6 class="title is-6">${pt.views }</h6>
				</td>
			</tr>
			
		</table>
		</article>
	</section>
	</c:forEach>
	
	

	
	<div class="blank"></div>
	<c:set var="listwidth" value="${(pvo.nowBlockLastPage-pvo.startPage+3)*70-20}"/>
	<div class="pagelist" style="width: ${listwidth}px;height:100%">
			
			<c:if test="${pvo.priv!=' X ' }">
			<div class="listboxc" onclick="location.href='${path1 }/PhotoList.do?nowPage=${pvo.startPage-1}'">
			이전
			</div>
			</c:if>
			<c:if test="${pvo.priv==' X ' }">
			<div class="listbox">
			이전
			</div>
			</c:if>
			
		<c:forEach var="x" begin="${pvo.startPage}" end="${pvo.nowBlockLastPage}" step="1">
		<div class="listboxc" onclick="location.href='${path1 }/PhotoList.do?nowPage=${x }'">${x }</div>
		</c:forEach>
			<c:if test="${pvo.next!=' X ' }">
			<div class="listboxc" onclick="location.href='${path1 }/PhotoList.do?nowPage=${pvo.nowBlockLastPage+1}'" style="margin-right:0">
			다음
			</div>
			</c:if>
			<c:if test="${pvo.priv==' X ' }">
			<div class="listbox" style="margin-right:0">
			다음
			</div>
			</c:if>

	</div>
	<div style="clear:both;text-align:center; margin-top:60px"><input class="button is-info" type="button" value="새글 등록" onclick="location.href='${path1}/GoPhotoAdd.do'"></div>
</article>
	<script>
	var sP= ${pvo.startPage};
	var nBLP = ${pvo.nowBlockLastPage};
	for(var x=sP;x<=nBLP;x++){
		console.log(x);
	}
	</script>

<%@ include file="/footer.jsp" %>
</body>
</html>