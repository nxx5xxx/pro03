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
		<h2 class="is-size-2" style="color:rgb(94, 94, 94);font-weight:bold;margin-right:180px">기차</h2>
		<hr style="width:280px;margin:0;background-color:lightgray">
	</div>
	<div class="blank" style="clear:both;margin-bottom:30px"></div>
	
	<div style="clear:both;padding:20px">	
	<div style="border-top:1px solid #2b4380; border-bottom:1px solid lightgray">
	<table style="width:100%;text-align:left;">
		<tr>
			<td rowspan="2" style="border-top:5px solid #2b4380;width:190px"><img src="${path1 }/img/traffic/traffic3.png" style="width:190px; height:180px"></td>
			<td ><br><p style="background-color:transparent">
자세한 사항은 <span style="color:#e53;font-weight:bold">코레일 홈페이지</span>를 참조하세요!</p></td>
		</tr>
		<tr>
			<td><pre style="background-color:transparent">
●코레일 홈페이지 http://www.korail.com
●함안역 문의 전화 : 055-583-7788
●열차시각 문의 : 1544-7788
●철도회원 예약 및 취소 : 1588-8545</pre>
</td>

		</tr>
	</table>
	</div>
	</div>
<div class="blank" style="margin-bottom:30px"></div>
	<div style="text-align:right; float:right">
		<h2 class="is-size-2" style="color:rgb(94, 94, 94);font-weight:bold;margin-right:180px">택시</h2>
		<hr style="width:280px;margin:0;background-color:lightgray">
	</div>


	<div style="padding:20px;clear:both;text-align:left; float:left;width:1000px">
		<h4 class="is-size-4" style="color:rgb(0,154,218);font-weight:bold">● 택시운임·요율</h4>
		
		<table class="table is-bordered" style="width:100%;text-align:center;border-top:2px solid black">
			<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
				<td style="width:25%">구분</td>
				<td>기본단위</td>
				<td>금액(원)</td>
				<td style="width:33%">비고</td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">	기본운임	</td>
				<td>2km	</td>
				<td>4,500	</td>
				<td></td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">거리운임	</td>
				<td>133m당</td>
				<td>150</td>
				<td></td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">시간운임(15km/h이하)	</td>
				<td>34초당</td>
				<td>150</td>
				<td></td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">호출료</td>
				<td colspan="2">호출료 1,000원</td>
				<td></td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">심야운행(00:00~04:00)</td>
				<td colspan="2">할증 20%</td>
				<td></td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">시계외 운행</td>
				<td colspan="2">할증 30%</td>
				<td>함안군지역에서 타지역으로 운행 시</td>
			</tr>
		</table>
		
		<h4 class="is-size-4" style="color:rgb(0,154,218);font-weight:bold">● 택시회사</h4>	
		
		<table class="table is-bordered" style="width:100%;text-align:center;border-top:2px solid black">
			<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
				<td style="width:33%">회사명</td>
				<td>전화번호</td>
				<td style="width:33%">주사무소</td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">	(유)통일택시		</td>
				<td>055-582-6000	</td>
				<td>군북면 소포리
				</td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">함안택시(유)		</td>
				<td>055-585-0501</td>
				<td>산인면 송정리
				</td>
			</tr>
			<tr>
				<td style="background-color:rgb(230,243,255);">개인택시 함안지부		</td>
				<td>055-583-0565</td>
				<td>가야읍 검암리</td>
			</tr>
		</table>	
	</div>




</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>