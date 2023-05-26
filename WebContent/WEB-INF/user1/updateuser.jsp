<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>내 정보 수정</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
th { width: 150px; }
#postcode { width: 480px; margin-right: 10px;}
.agree_fr { width: 900px; padding: 24px; margin: 10px auto; }
</style>
</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<section class="container-fluid">
	<h2 class="title" style="text-align: center;">내 정보 수정</h2>
	<article class="agree_fr">
	<form name="frm1" id="frm1" class="box" action="${path1 }/UserUpdatePro.do" method="post" onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th><label class="label" for="id">아이디</label></th>
					<td><input type="text" name="id" id="id" class="button is-light" value="${user.id }" readonly />
				</tr>
				<tr>
					<th><label class="label" for="name">이름<p>(개인,기업,단체)</p></label></th>
					<td><input type="text" name="name" id="name" class="button is-light" value="${user.name }" readonly />
				</tr>
				<tr>
					<th><label class="label" for="ppw">비밀번호</label></th>
					<td>
						<%-- <span class="button is-light">${user.pw }</span> --%>
						<input type="password" name="ppw" id="ppw" class="input"  placeholder="비밀번호 입력" maxlength="16" value="" required />
						<input type="hidden" name="pw" id="pw" value="${user.pw }" />
						<input type="hidden" name="hpw" id="hpw" value="${user.hpw }" />
						<p>최소 8자리에서 최대 16자리까지 설정 가능하며, 숫자, 영문, 특수문자 각 1개 이상 포함</p>
					</td>
				</tr>
				<tr>
					<th><label class="label" for="ppw2">비밀번호 확인</label></th>
					<td><input type="password" name="ppw2" id="ppw2" placeholder="비밀번호  확인 입력" class="input" value="" maxlength="16" /></td>
				</tr>
				<tr>
					<th><label class="label" for="email">이메일</label></th>
					<td><input type="email" name="email" id="email" placeholder="이메일 입력" class="input" value="${user.email }" required></td>
				</tr>
				<tr>
					<th><label class="label" for="tel">연락처</label></th>
					<td><input type="tel" name="tel" id="tel" maxlength="14" placeholder="ex) 010-1234-5678" class="input" value="${user.tel }" required></td>
				</tr>
				<tr>
					<th><label class="label" for="post_btn">주소</label></th>
					<td>
					<c:set var="addr1234" value="${fn:substringAfter(user.addr, ' ' )}"/>
					<input type="hidden" name="addr" id="addr" value="${user.addr }" />
					<input type="text" name="postcode" id="postcode" placeholder="우편번호" class="input" value="${fn:substring(user.addr, 1, 6 )}" readonly>
					<button type="button" id="post_btn" onclick="findAddr()" class="button is-info is-rounded">우편번호 검색</button>
					<input type="text" name="address1" id="address1" placeholder="기본 주소" class="input" value="${fn:substringBefore(addr1234, ',' )}" required readonly /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="input" value="${fn:substringAfter(user.addr, ', ' )}" required  /><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
						<input type="submit" value="수정 완료" class="button is-success"/>
						&nbsp; &nbsp; &nbsp;
						<a href="javascript:history.go(-1)" class="button is-light">취소</a>
						<!-- <input type="reset" value="초기화" class="button is-ghost"/> -->
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<script>
	function joinCheck(f){
		if(f.ppw.value!=f.ppw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.pw.focus();
			return false;
		}
	}
	function findAddr(){
		new daum.Postcode({
			oncomplete: function(data) {
				console.log(data);
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
				document.getElementById("postcode").value = data.zonecode;
				if(roadAddr !== '') {
					document.getElementById("address1").value = roadAddr;				
				} else if(jibunAddr !== ''){
					document.getElementById("address1").value = jibunAddr;
				}
				document.getElementById("address2").focus();
			}
		}).open();		
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</article>
</section>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>