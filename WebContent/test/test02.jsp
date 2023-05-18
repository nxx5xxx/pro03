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
 <link href="${path }/bulma/bulma.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
</style>

</head>
<body>
<div>
	<ul id="lst">
	

	</ul>
</div>
<input type="text" id="name" placeholder="kim과 lee중 입력">
<button type="button" id="addBtn">특정 데이터 갖고오기</button>
<script>
 	$(document).ready(function(){
		$("#addBtn").click(function(){
			alert($("#name").val() +"의 값을 받아옵니다");
			$.ajax({
				url:"${path }/JsonTest02.do",
				dataType:"json",
				encType:"UTF-8",
				type:"post",
				data:{id:$("#name").val()},
				success:function(x){
					console.log(x.id);
					if(typeof x.id!="undefined"){
						$("#lst").append("<li>입력한 값 : "+$("#name").val()+"</li>");
						$("#lst").append("<li>아이디 : "+x.id+"</li>");
						$("#lst").append("<li>비번 : "+x.pw+"</li>");
						$("#lst").append("<li>가입일 : "+x.regdate+"</li>");
						$("#lst").append("<li>숫자 : "+x.num+"</li>");
						$("#lst").append("<li>-----------------</li>");
					} else {
						$("#lst").append("<li>입력한 값 : "+$("#name").val()+"</li>");
						$("#lst").append("<li>해당 데이터가 존재하지 않습니다.</li>");
						$("#lst").append("<li>-----------------</li>");
					}
				}
				
			});
		});
	}) ;
</script>

</body>
</html>