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
<title>로그인</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 700px; padding: 24px; margin: 10px auto; }
</style>
</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2 class="title" style="text-align: center;">로그인</h2>
		<article class="agree_fr">
		<form action="${path1 }/UserLoginPro.do" method="post" class="box">
		  <div class="field">
		    <label class="label" for="id">아이디</label>
		    <div class="control">
		      <input class="input" type="text" name="id" id="id" maxlength="15" placeholder="15글자 이내로 입력" required autofocus>
		    </div>
		  </div>
		  <div class="field">
		    <label class="label" for="pw">비밀번호</label>
		    <div class="control">
		      <input class="input" type="password" name="pw" id="pw" maxlength="15" placeholder="********" required>
		    </div>
		  </div>
		  <div class="field">
		  	&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			<input type="submit" value="로그인" class="button is-success"/>
			&nbsp; &nbsp; &nbsp; &nbsp;
			<input type="reset" value="취소" class="button is-light"/>
			&nbsp; &nbsp; &nbsp; &nbsp;
			<%-- <a href="${path1 }/UserAgree.do" class="button is-primary">회원가입</a>	 
				 <a href="javascript:history.go(-1)" class="button is-light">취소</a> --%>
			</div>	
		</form>
		</article>		
	</div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>