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
<title>내 정보 페이지</title>
<style>
.title { padding-top:10px; padding-bottom:10px; }
.agree_fr { width: 900px; padding: 24px; margin: 10px auto; }
th { width: 200px; }
td { width: 300px; }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<section class="agree_fr">
		<h2 class="title" style="text-align: center;">내 정보</h2>
		<div class="box">
			<table class="table">
				<tbody>
					<tr>
						<th>아이디</th>
						<td>
							${user.id }	
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							${user.pw }
						</td>
					</tr>
					<tr>
						<th>이름(개인,기업,단체)</th>
						<td>${user.name }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${user.email }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${user.tel }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${user.addr }</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${user.regdate }</td>
					</tr>
					<tr>
						<td colspan="2">
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
							<a href="${path1 }/UserUpdate.do?id=${user.id}" class="button is-success">정보 수정</a>
							&nbsp; &nbsp; &nbsp; &nbsp;
							<a href="${path1 }/GoComplainList.do?id=${user.id}" class="button is-warning">나의 민원</a>
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
							<a href="${path1 }/UserDelete.do?id=${user.id}" class="button is-danger is-light" onclick="return delCheck()">회원 탈퇴</a>
						</td>
					</tr>
				</tbody>
			</table>
			<script>
			function delCheck(){
				let message="회원님의 소중한 모든 정보가 사라집니다. 정말로 탈퇴하시겠습니까?";
				if(confirm(message)){ return true; } 
				else { return false; }
			}
			</script>
		</div>	
	</section>	
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>