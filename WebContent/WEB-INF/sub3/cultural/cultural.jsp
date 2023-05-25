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
<title>메인 페이지</title>
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
	<h2 class="is-size-2" style="color:rgb(0,154,218);font-weight:bold">● 지정문화재 현황</h2>
	</div>
		
	<div style="clear:both;padding:20px">	
	<table class="table is-bordered" style="width:100%;text-align:center;font-weight:600;">
		<tr style="background-color:rgb(230,243,255)">
			<th rowspan="2" style="line-height:82px;text-align:center">
			계
			</th>
			<td colspan="5">
			국가지정
			</td>
			<td colspan="6">
			도지정
			</td>
		</tr>
		<tr style="background-color:rgb(230,243,255);">
			<td>소계</td>			
			<td>보물</td>
			<td>사적</td>			
			<td>천연<br>기념물</td>			
			<td>국가민속<br>문화재</td>
			<td>소계</td>			
			<td>유형</td>
			<td>기념물</td>			
			<td>무형</td>			
			<td>민속<br>문화재</td>	
			<td>문화재<br>자료</td>			
		</tr>
		<tr>
			<td>70</td>
			<td>9</td>			
			<td>2</td>
			<td>3</td>			
			<td>3</td>
			<td>1</td>
			<td>61</td>			
			<td>19</td>
			<td>10</td>			
			<td>3</td>
			<td>1</td>			
			<td>28</td>
		</tr>
	</table>
	</div>
	
	<div style="text-align:right; float:right">
	<h2 class="is-size-2" style="color:rgb(0,154,218);font-weight:bold">● 국가지정 문화재</h2>
	</div>
	<div style="clear:both;padding:20px">	
	<table class="table is-bordered" style="width:100%;text-align:center;">
		<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
			<td>문화재명</td>
			<td>종류별	</td>
			<td>수량</td>
			<td>지정일</td>
			<td>소재지</td>

		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 대산리 석조 삼존상</td>			
			<td>보물</td>
			<td>3구</td>			
			<td>1963.01.21</td>			
			<td>함안군 함안면 대산리 1139</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 방어산 마애약사여러삼존입상</td>			
			<td>보물</td>
			<td>3구</td>			
			<td>1963.01.21</td>			
			<td>함안군 군북면 하림리 산 131</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 성산산성</td>			
			<td>사적</td>
			<td>227,821m2</td>			
			<td>1963.01.21</td>			
			<td>함안군 가야읍 광정리 일원<br>함안군 함안면 괴산리 일원</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 말이산 고분군</td>			
			<td>사적</td>
			<td>783,619m2</td>			
			<td>2011.07.28<br>2021.07.29</td>			
			<td>함안군 가야읍 도향리 일원<br>함안군 가야읍 말산리 일원</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 가야리 유적</td>			
			<td>사적</td>
			<td>195,008m2</td>			
			<td>2019.10.21</td>			
			<td>함안군 가야읍 가야리 289일원</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 용산리 백악기 새발자국 화석산지</td>			
			<td>천연기념물</td>
			<td>12,485m2</td>			
			<td>1970.04.24</td>			
			<td>함안군 칠원읍 용산리 산4</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 영동리 회화나무</td>			
			<td>천연기념물</td>
			<td>1주(314m2)</td>			
			<td>1982.11.09</td>			
			<td>함안군 칠북면 영동리 749-1</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 대송리 늪지식물</td>			
			<td>천연기념물</td>
			<td>33,911m2</td>			
			<td>1984.11.19</td>			
			<td>함안군 법수면 대송리 883-1</td>			
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">
			함안 무기연당</td>			
			<td>국가민속문화재</td>
			<td>1곽</td>			
			<td>1984.11.19</td>			
			<td>함안군 칠원읍 무기1길 33</td>			
		</tr>
	</table>
	</div>


</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>