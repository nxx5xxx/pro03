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
<title>시내/시외버스 - 함안군관내시외버스요금표</title>
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
.item4:hover {background-color:rgb(0,154,218);color:white}
.item5:hover {background-color:rgb(0,154,218);color:white}
.item6:hover {background-color:rgb(0,154,218);color:white}
.item7 {background-color:rgb(0,154,218);color:white}
.item8:hover {background-color:rgb(0,154,218);color:white}
td{vertical-align:middle!important;}
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
			<td rowspan="2">일련<br>번호</td><td colspan="6">운임요금</td>
		</tr>
		<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
										<td>운행구간</td>		<td>일반</td>		<td>중고생</td>	<td>상이군경<br>6~7급</td><td>상이군경<br>1~5급</td><td>초등생</td>
		</tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						1	</td><td>	함안-부산	</td><td>	8,100	</td><td>	6,500	</td><td>	5,700	</td><td>	2,400	</td><td>	4,100	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						2	</td><td>	함안-마산	</td><td>	2,400	</td><td>	1,900	</td><td>	1,700	</td><td>	700	</td><td>	1,200	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						3	</td><td>	함안-진주	</td><td>	4,300	</td><td>	3,400	</td><td>	3,000	</td><td>	1,300	</td><td>	2,200	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						4	</td><td>	함안-군북	</td><td>	1,500	</td><td>	1,200	</td><td>	1,100	</td><td>	500	</td><td>	800	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						5	</td><td>	함안-죽산	</td><td>	1,500	</td><td>	1,200	</td><td>	1,100	</td><td>	500	</td><td>	800	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						6	</td><td>	함안-월촌	</td><td>	1,900	</td><td>	1,500	</td><td>	1,300	</td><td>	600	</td><td>	1,000	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						7	</td><td>	함안-정암	</td><td>	2,200	</td><td>	1,800	</td><td>	1,500	</td><td>	700	</td><td>	1,100	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						8	</td><td>	함안-의령	</td><td>	2,600	</td><td>	2,100	</td><td>	1,800	</td><td>	800	</td><td>	1,300	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						9	</td><td>	군북-마산	</td><td>	3,600	</td><td>	2,900	</td><td>	2,500	</td><td>	1,100	</td><td>	1,800	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						10	</td><td>	대산-마산	</td><td>	4,100	</td><td>	3,300	</td><td>	2,900	</td><td>	1,200	</td><td>	2,100	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						11	</td><td>	칠원-마산	</td><td>	2,500	</td><td>	2,000	</td><td>	1,800	</td><td>	750	</td><td>	1,300	</td></tr>
		<tr><td style="background-color:rgb(230,243,255);">	
						12	</td><td>	칠원-남지	</td><td>	1,600	</td><td>	1,300	</td><td>	1,100	</td><td>	500	</td><td>	800	</td></tr>
		<tr><td></td><td>	 	</td><td>	 	</td><td>	 	</td><td>	유공자<br>30%할인	</td><td>	유공자<br>70%할인	</td><td>	 	</td></tr>
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