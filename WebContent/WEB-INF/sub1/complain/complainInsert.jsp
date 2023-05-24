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
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<h3 class="title is-3 min" style="color:rgb(0,154,218)">●민원 안내</h3>
	<pre>제목과 내용은 접수 후 수정, 삭제가 불가능하므로 다시 확인하시고 신청해 주시기 바랍니다.
규제 관련 민원의 경우 규제개혁신문고로 이관될 수 있습니다.
신고성 민원의 경우 청렴포털시스템으로 이관될 수 있습니다.
허위신고 등은 명예훼손, 무고죄 등으로 처벌될 수 있습니다.
민원 내용에 따라 여러 부처에서 처리될 수 있으니, 민감한 내용이 포함되어 있을 경우 기관별로 해당내용을 제출해주시기 바랍니다.
공무원에 대한 폭언, 욕설 등은 관련 법령(형법, 경범죄처벌법)에 따라 법적조치를 받을 수 있습니다.</pre>
	<div class="divide">피신고자 정보(필수)</div>
	<form action="${path1 }/InsertComplain.do" method="post" enctype="multipart/form-data">
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
	<div class="divide">민원 내용 <span class="colred">*</span> 표는 필수 입력사항입니다.</div>
	<pre>※ 민원신청을 유도한 후 금융 정보(계좌, 카드, 비밀번호 등)를 요구하는 전화사기(보이스피싱)에 주의하시기 바랍니다.

※ 고소장 등 법정서식이 필요한 신청은 해당 기관에 사전 문의하시기 바랍니다.

※ 현금영수증 미발급·발급거부, 신용카드 결제거부 신고는 국세청 홈(손)택스로 접속> 상담/제보를 이용하여 주시기 바랍니다.

※ 로그인 유지시간은 120분이며, 민원 내용을 자세히 작성해주시면 원활한 민원 처리에 도움이 됩니다.</pre>
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
		<input type="submit" class="button is-info" value="민원 신청" style="float:right">
	</form>
	<div class="blank" style="margin-bottom:100px"></div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>