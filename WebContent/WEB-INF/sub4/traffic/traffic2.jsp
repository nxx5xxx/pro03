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
<title>공영버스/농어촌버스</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<div style="text-align:right; float:right">
		<h2 class="is-size-2" style="color:rgb(41, 90, 221);font-weight:bold">공영버스/농어촌버스</h2>
		<hr style="width:380px;margin:0;background-color:lightgray">
	</div>
	
	<div style="clear:both;padding:20px">	
	<table class="table is-bordered" style="width:100%;text-align:center;">
		<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
			<td colspan="2">구분</td>
			<td>일반</td>
			<td>청소년</td>
			<td>어린이</td>
			<td colspan="3">비고</td>
		</tr>
		<tr>
			<td rowspan="2" style="vertical-align:middle;background-color:rgb(230,243,255);">함안군/창원시	</td>
			<td style="background-color:rgb(230,243,255);">현금</td>
			<td>1,500원</td>
			<td>1,000원</td>
			<td>750원</td>
			<td colspan="3" rowspan="2">
			- 어린이 : 만 6세 이상 ~ 만 12세 이하<br>
			- 청소년 : 만 13세 이상 ~ 만 18세 이하<br>
			- 일 반 : 만 19세 이상
			</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);">교통카드</td>
			<td>1,450원</td>
			<td>950원</td>
			<td>700원</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:rgb(230,243,255);">의령군 두곡,득소,정곡</td>
			<td>2,000원</td>
			<td>1,600원</td>
			<td>1,000원</td>
			<td colspan="3">군경계부터 구간요금 적용</td>
		</tr>
		<tr>
			<td colspan="2" style="background-color:rgb(230,243,255);">공영버스</td>
			<td>1,400원</td>
			<td>900원</td>
			<td>700원</td>
			<td colspan="3"></td>
		</tr>
	</table>
	<br>
	
	
	<table class="table is-bordered" style="width:100%;text-align:center;">
		<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
			<td>번호</td>
			<td colspan="4">노선</td>
			<td style="width:25%">다운로드</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);">1</td>
			<td colspan="4">함안(가야) ↔ 파수, 혈곡</td>
			<td >
			<a href="${path1 }/img/traffic/traffic_ex1.xls" download>
			<img src="${path1 }/img/traffic/traffic1.png" style="width:135px; height:25px">
			</a>
			</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);">2</td>
			<td colspan="4">함안(가야) ↔ 대산, 군북</td>
			<td >
			<a href="${path1 }/img/traffic/traffic_ex2.xls" download>
			<img src="${path1 }/img/traffic/traffic1.png" style="width:135px; height:25px">
			</a>
			</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);">3</td>
			<td colspan="4">함안(가야) ↔ 함안(강지골)</td>
			<td >
			<a href="${path1 }/img/traffic/traffic_ex3.xls" download>
			<img src="${path1 }/img/traffic/traffic1.png" style="width:135px; height:25px">
			</a>
			</td>
		</tr>
	</table>
	</div>

	<div style="text-align:left; float:left">
		<h4 class="is-size-4" style="color:rgb(0,154,218);font-weight:bold">● 연락처</h4>
		<pre style="background-color:transparent;padding:10px;font-size:12px">
● 동일익스프레스(주) : 055-583-7975
● 공영버스 : 055-585-0037
● 함안군청(건설교통과) : 055-580-2641
		</pre>
	</div>




</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>