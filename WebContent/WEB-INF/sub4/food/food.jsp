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
<title>관광안내 > 관광지도 > 음식점</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 300px; height: 250px; }

/* 추가부분 */
.blank {clear:left; height:50px;}

.pagelist {clear:both; width:560px;height:50px; margin:0 auto; background-color:green}
.listboxc {cursor:pointer;width:50px;height:50px;border: 1px solid rgb(224, 224, 224); float:left;margin-right:20px;text-align:center;line-height:50px}
.listbox {width:50px;height:50px;border: 1px solid rgb(224, 224, 224); float:left;margin-right:20px;text-align:center;line-height:50px}

</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2 class="title" style="text-align: center;">함안 맛집 소개
		<c:if test="${sid=='admin' }">
          <a class="button is-info is-outlined is-small" href="FoodAdd.do"><strong>신규등록</strong></a>
        </c:if>
        </h2>
		<article class="agree_fr">
			<div class="box">
				<c:forEach var="food" items="${foodList }">
			  <article class="media">
			    <div class="media-left">
			      <figure>
			        <img src='${path1 }/data/food/${food.file1 }' alt="${food.title }" class="image">
			      </figure>
			    </div>
			    <div class="media-content">
			      <div class="content">
				      <br><h2>${food.title }</h2>
				        <p>
				         	<strong><span>위치: </span></strong><span>${fn:substringAfter(food.addr, ') ' )}</span>
				          	<br>
				         	<strong><span>전화번호: </span></strong><span>${food.tel }</span>
				          	<br>
				        </p>
			          	<input type="button" class="button is-info" onclick="findaddr(${food.fno })" value="길찾기">
			          	<c:if test="${sid=='admin' }">
        				  <a class="button is-link is-light" href="${path1 }/FoodUpdate.do?fno=${food.fno }"><strong>수정</strong></a>
        				  <a class="button is-light" href="${path1 }/FoodDel.do?fno=${food.fno }" onclick="return delCheck()"><strong>삭제</strong></a>
        				</c:if>
        				<script>
						function delCheck(){
							let message="해당 음식점 정보가 사라집니다. 정말로 삭제하시겠습니까?";
							if(confirm(message)){ return true; } 
							else { return false; }
						}
						</script>
			      </div>
			    <c:if test="${empty foodList }">
					<strong>게시글이 존재하지 않습니다.</strong>
				</c:if>	
			    </div>
			  </article>
			    </c:forEach>
			</div>
		</article>		
	</div>
</div>

<!-- 추가부분 -->
<script>
function findaddr(fno){
		var popX = (window.screen.width / 2) - (1100 / 2);
		var popY= (window.screen.height / 2) - (720 / 2);
		var fno = fno
		window.open("${path1 }/GoFoodMap.do?fno="+fno,"길 찾기","status=no,toolbar=no,scrollbars=no, width=1100, height=720,left="+ popX + ", top="+ popY);
}
</script>


	<div class="blank"></div>
		<c:set var="listwidth" value="${(pvo.nowBlockLastPage-pvo.startPage+3)*70-20}"/>
		<div class="pagelist" style="width: ${listwidth}px;height:100%">
			<c:if test="${pvo.priv!=' X ' }">
			<div class="listboxc" onclick="location.href='${path1 }/Food.do?nowpage=${pvo.startPage-1}'">
			이전
			</div>
			</c:if>
			<c:if test="${pvo.priv==' X ' }">
			<div class="listbox">
			이전
			</div>
			</c:if>
			
		<c:forEach var="x" begin="${pvo.startPage}" end="${pvo.nowBlockLastPage}" step="1">
		<div class="listboxc" onclick="location.href='${path1 }/Food.do?nowPage=${x }'">${x }</div>
		</c:forEach>
			<c:if test="${pvo.next!=' X ' }">
			<div class="listboxc" onclick="location.href='${path1 }/Food.do?nowPage=${pvo.nowBlockLastPage+1}'" style="margin-right:0">
			다음
			</div>
			</c:if>
			<c:if test="${pvo.next==' X ' }">
			<div class="listbox" style="margin-right:0">
			다음
			</div>
			</c:if>
		</div>
<div class="blank"></div>
<!--  -->
<%@ include file="/footer.jsp" %>
</body>
</html>