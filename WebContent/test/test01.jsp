<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="${path }/source/bulma.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
</style>

</head>
<body>
<div>
	<ul id="lst">
	

	</ul>
</div>
<button type="button" id="addBtn">데이터 갖고오기</button>
<script>
 	$(document).ready(function(){
		
		var params = {id:"kim", point: 100, regdate:"2023-05-18" };
		$("#lst").append("<li>아이디 : " +params.id + "</li>");		
		$("#lst").append("<li>포인트 : " +params.point + "</li>");
		$("#lst").append("<li>등록일 : " +params.regdate + "</li>");
		$("#addBtn").click(function(){
			$.ajax({
					dataType:"json",
					encType:"UTF-8",
					type:"post",
					url:"${path }/JsonTest01.do",
					success:function(x){
						console.log(x.result)
						$("#lst").append("<li> json갖고오기 : " +x.result + "</li>");
					}
			});
		});
	}); 
</script>

</body>
</html>