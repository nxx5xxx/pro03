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
<title>시내/시외버스 - 마산(고속도)칠원,대산,신반</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.trv_wrap {width:800px;background-color:green;height:200px;margin:20px auto}
.vtm {vertical-align:middle!important;font-weight:bold!important;cursor:pointer!important}
.item1:hover {background-color:rgb(0,154,218);color:white}
.item2 {background-color:rgb(0,154,218);color:white}
.item3:hover {background-color:rgb(0,154,218);color:white}
.item4:hover {background-color:rgb(0,154,218);color:white}
.item5:hover {background-color:rgb(0,154,218);color:white}
.item6:hover {background-color:rgb(0,154,218);color:white}
.item7:hover {background-color:rgb(0,154,218);color:white}
.item8:hover {background-color:rgb(0,154,218);color:white}
td{vertical-align:middle!important}
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="blank"></div>

<div class="main_wrap">
	<div class="trv_wrap">
	<table class="table is-bordered table is-fullwidth" style="width:100%;height:100%;table-layout:fixed;">
		<tr style="text-align:center;height:50%">
			<td onclick="location.href='${path1}/Traffic1.do'" class="item1 vtm">함안,군복,의령</td>
			<td onclick="location.href='${path1}/Traffic1_2.do'" class="item2 vtm">마산,칠원,대산,신반</td>
			<td onclick="location.href='${path1}/Traffic1_3.do'" class="item3 vtm">부산(고속도)함안</td>
			<td onclick="location.href='${path1}/Traffic1_4.do'" class="item4 vtm">진주(고속도)군북,함안</td>
		</tr>
		<tr style="text-align:center;height:50%">
			<td onclick="location.href='${path1}/Traffic1_5.do'" class="item5 vtm">김해,장류(고속도)함안</td>
			<td onclick="location.href='${path1}/Traffic1_6.do'" class="item6 vtm">마산(급행)함안</td>
			<td onclick="location.href='${path1}/Traffic1_7.do'" class="item7 vtm">함안군<br>관내 시외버스 요금표</td>
			<td onclick="location.href='${path1}/Traffic1_8.do'" class="item8 vtm">시내버스</td>
		</tr>
	</table>
	
	</div>
	
	<div style="clear:both;padding:20px">	
	<table class="table is-bordered" style="width:100%;text-align:center;">
		<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
			<td>출발</td>
			<td>출발시간</td>
			<td style="width:40%">경유지</td>
			<td>도착지</td>
			<td>도착시간</td>
			<td>비고</td>
			
		</tr>
		<tr>
			<td rowspan="6" style="vertical-align:middle;background-color:rgb(230,243,255);">마산<br>T/R</td>
			<td rowspan="2">9:20</td>
			<td>자이A(09:40), 무기대동A(09:47),</td>
			<td rowspan="2" style="background-color:rgb(230,243,255);">의령<br>T/R</td>
			<td rowspan="2">11:00</td>
			<td rowspan="2">의령군<br>농어촌버스</td>
		</tr>
		<tr>
			<td>칠원(09:50), 대산(10:00), 신반(10:30), 정곡</td>
		</tr>
		<tr>
			<td rowspan="2">14:30</td>
			<td>자이A(14:50), 무기대동A(14:57),</td>
			<td rowspan="2" style="background-color:rgb(230,243,255);">신반<br>(의령)</td>
			<td rowspan="2">15:35</td>
			<td rowspan="2"></td>
		</tr>
		<tr>
			<td>칠원(15:00), 대산(15:10)</td>
		</tr>
		<tr>
			<td rowspan="2">18:40</td>
			<td>자이A(19:00), 무기대동A(19:07),</td>
			<td rowspan="2" style="background-color:rgb(230,243,255);">의령<br>T/R</td>
			<td rowspan="2">20:20</td>
			<td rowspan="2"></td>
		</tr>
		<tr>
			<td>칠원(19:10), 대산(19:20), 신반(19:50), 정곡</td>
		</tr>
		<tr>
			<td rowspan="6" style="vertical-align:middle;background-color:rgb(230,243,255);">신반<br>(의령)</td>
			<td rowspan="2">7:20</td>
			<td>대산(07:45), 칠원(08:00), 무기대동A(08:03)</td>
			<td rowspan="2" style="background-color:rgb(230,243,255);">마산<br>T/R</td>
			<td rowspan="2">8:30</td>
			<td rowspan="2"></td>
		</tr>
		<tr>
			<td>자이A(08:08)</td>
		</tr>
		<tr>
			<td rowspan="2">12:30</td>
			<td>대산(12:55), 칠원(13:10), 무기대동A(13:13),</td>
			<td rowspan="2" style="background-color:rgb(230,243,255);">마산<br>T/R</td>
			<td rowspan="2">8:30</td>
			<td rowspan="2"></td>
		</tr>
		<tr>
			<td>자이A(13:18)</td>
		</tr>
		<tr>
			<td rowspan="2">16:40</td>
			<td>대산(16:45), 칠원(17:00), 무기대동A(17:03),</td>
			<td rowspan="2" style="background-color:rgb(230,243,255);">마산<br>T/R</td>
			<td rowspan="2">17:30</td>
			<td rowspan="2"></td>
		</tr>
		<tr>
			<td>자이A(17:08)</td>
		</tr>

	</table>
	<br>
	
	

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