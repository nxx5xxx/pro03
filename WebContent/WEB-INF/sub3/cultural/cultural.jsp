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
<title>문화재현황</title>
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
	
	<div style="text-align:right; float:right">
	<h2 class="is-size-2" style="color:rgb(0,154,218);font-weight:bold">● 지방유형 문화재</h2>
	</div>
	<div style="clear:both;padding:20px">	
	<table class="table is-bordered" style="width:100%;text-align:center;">
		<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
			<td>문화재명</td>
			<td>수량</td>
			<td>지정일</td>
			<td>소재지</td>

		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">	함안 장춘사 석조여래좌상	</td>
			<td>	1구	</td>
			<td>	1972.02.12.	</td>
			<td>	함안군 칠북면 북원로 110-1	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:601;">	함안 주리사지 사자석탑	</td>
			<td>	1기	</td>
			<td>	1972.02.12.	</td>
			<td>	함안군 함안면 함안대로 105-2	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:602;">	이휴복 진무공신 교서	</td>
			<td>	1매	</td>
			<td>	1972.02.12.	</td>
			<td>	함안군 가야읍 고분길 153-31(함안박물관)	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:603;">	함안 장춘사 오층석탑	</td>
			<td>	1기	</td>
			<td>	1974.02.16.	</td>
			<td>	함안군 칠북면 북원로 110-1	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:604;">	주세붕 초상	</td>
			<td>	1폭	</td>
			<td>	1976.04.15.	</td>
			<td>	함안군 칠서면 무릉길 75	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:605;">	함안 무산사	</td>
			<td>	1동	</td>
			<td>	1976.04.15.	</td>
			<td>	함안군 칠서면 무릉길 75	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:606;">	함안 무진정	</td>
			<td>	1동	</td>
			<td>	1976.12.20.	</td>
			<td>	함안군 함안면 괴산4길 25	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:607;">	함안 어계고택	</td>
			<td>	1동	</td>
			<td>	1976.12.20.	</td>
			<td>	함안군 군북면 원북길 104-1	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:608;">	주세붕 무릉잡고 목판	</td>
			<td>	352매	</td>
			<td>	2018.12.20.	</td>
			<td>	함안군 칠서면 무릉길 75	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:609;">	주박 귀봉집 목판	</td>
			<td>	35매	</td>
			<td>	2018.12.20.	</td>
			<td>	함안군 칠서면 무릉길 75	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:610;">	주맹헌 수구집 목판	</td>
			<td>	65매	</td>
			<td>	2018.12.20.	</td>
			<td>	함안군 칠서면 무릉길 75	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:611;">	안축 근재집 목판	</td>
			<td>	93매	</td>
			<td>	1979.12.29.	</td>
			<td>	함안군 가야읍 고분길 153-31(함안박물관)	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:612;">	조임도 간송문집 및 금라전신록목판	</td>
			<td>	190매	</td>
			<td>	1979.12.29.	</td>
			<td>	함안군 가야읍 고분길 153-31(함안박물관)	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:613;">	함안향교	</td>
			<td>	4,175㎡	</td>
			<td>	1983.08.06.	</td>
			<td>	함안군 함안면 덕암길 103	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:614;">	주재성 국담문집 목판	</td>
			<td>	56매	</td>
			<td>	1985.01.14.	</td>
			<td>	함안군 가야읍 고분길 153-31(함안박물관)	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:615;">	악비 장충록	</td>
			<td>	6책	</td>
			<td>	1999.08.03.	</td>
			<td>	함안군 가야읍 고분길 153-31(함안박물관)	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:616;">	조익도공신록권 및 교지	</td>
			<td>	6점(2책4매)	</td>
			<td>	1999.08.03.	</td>
			<td>	함안군 가야읍 고분길 153-31(함안박물관)	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:617;">	함안 내곡리 청간정 고문서	</td>
			<td>	11건	</td>
			<td>	2010.10.07.	</td>
			<td>	함안군 여항면 내곡리 123	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:618;">	함안 장춘사 석조석가여래삼존좌상	</td>
			<td>	3구	</td>
			<td>	2015.06.11.	</td>
			<td>	함안군 칠북면 북원로 110-1	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:619;">	함안 달전사 천지명양수륙재의찬요	</td>
			<td>	1권	</td>
			<td>	2017.01.05.	</td>
			<td>	함안군 칠원읍 유원길 778	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:620;">	함안 말이산 25호분 출토 굽다리등잔	</td>
			<td>	1점	</td>
			<td>	2021.10.28.	</td>
			<td>	함안군 가야읍 고분길 153-31(함안박물관)	</td>
		</tr>
	</table>
	</div>


	<div style="text-align:right; float:right">
	<h2 class="is-size-2" style="color:rgb(0,154,218);font-weight:bold">● 지방무형 문화재</h2>
	</div>
	<div style="clear:both;padding:20px">	
	<table class="table is-bordered" style="width:100%;text-align:center;">
		<tr style="background-color:rgb(230,243,255);text-align:center;font-weight:600;">
			<td>문화재명</td>
			<td>수량</td>
			<td>지정일</td>
			<td>소재지</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:600;">	함안 화천농악	</td>
			<td>	1단체	</td>
			<td>	1991.12.23.	</td>
			<td>	함안군 칠북면 화천1길 14	</td>
		</tr>
		<tr>
			<td style="background-color:rgb(230,243,255);font-weight:601;">	함안 낙화놀이	</td>
			<td>	1단체	</td>
			<td>	2008.10.30.	</td>
			<td>	함안군 함안면 괴산리 544-2	</td>
		</tr>
				<tr>
			<td style="background-color:rgb(230,243,255);font-weight:601;">	함안 농요	</td>
			<td>	1단체	</td>
			<td>	2016.09.01.	</td>
			<td>	함안군 가야읍 도향리 263-6	</td>
		</tr>
	</table>
	</div>



</div>
<div class="blank" style="margin-bottom:100px"></div>
<%@ include file="/footer.jsp" %>
</body>
</html>