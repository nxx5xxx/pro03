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
<title>시내/시외버스 - 진주(고속도)군북,함안</title>
<style>
img {border:0;}
.main_wrap {width:1000px; margin:0 auto;}
.blank {clear:left; height:50px;}
.divide {height:35px ; background-color:lightgray;text-align:center;line-height:35px}

.trv_wrap {width:800px;background-color:green;height:200px;margin:20px auto}
.vtm {vertical-align:middle!important;font-weight:bold!important;cursor:pointer!important}
.item1:hover {background-color:rgb(0,154,218);color:white}
.item2:hover {background-color:rgb(0,154,218);color:white}
.item3:hover {background-color:rgb(0,154,218);color:white}
.item4 {background-color:rgb(0,154,218);color:white}
.item5:hover {background-color:rgb(0,154,218);color:white}
.item6:hover {background-color:rgb(0,154,218);color:white}
.item7:hover {background-color:rgb(0,154,218);color:white}
.item8:hover {background-color:rgb(0,154,218);color:white}
td{vertical-align:middle!important;width:16.6%!important}
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
			<td>경유지</td>
			<td>도착지</td>
			<td>도착시간</td>
			<td>비고</td>
		</tr>
		<tr>
			<td rowspan="3" style="background-color:rgb(230,243,255);">진주 T/R</td>
			<td rowspan="2">7:00</td>
			<td rowspan="2">군북(07:45)</td>
			<td rowspan="3" style="background-color:rgb(230,243,255);">함안 T/R</td>
			<td rowspan="2">8:00</td>
			<td>경전여객</td>
		</tr>
		<tr>
			<td>대한여객</td>
		</tr>
		<tr>
			<td>18:10</td>
			<td>군북(18:55)</td>
			<td>19:10</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="2" style="background-color:rgb(230,243,255);">함안 T/R</td>
			<td>8:00</td>
			<td>군북(08:15)</td>
			<td rowspan="2" style="background-color:rgb(230,243,255);">진주 T/R</td>
			<td>9:00</td>
			<td></td>
		</tr>
		<tr>
			<td>19:10</td>
			<td>군북(08:15)</td>
			<td>20:10</td>
			<td></td>
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