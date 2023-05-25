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

<button type="button" id="addBtn"> 데이터 갖고오기</button>
<script>

 	$(document).ready(function(){
		$("#addBtn").click(function(){
			$.ajax({
				url:"${path }/JsonTest03.do",
				dataType:"json",
				encType:"UTF-8",
				type:"post",
				processData:false,
				contentType:false,
				cache:false,
				success:function(x){
					$("#lst").empty();
					var trans = x;
					console.log(trans.data);
					$.each(trans, function(key,value){
						if(key=="data"){
							for(var i=0;value.length;i++){
					$("#lst").append("<li>아이디 : "+value[i].id+"</li>");
					$("#lst").append("<li>비번 : "+value[i].pw+"</li>");
					$("#lst").append("<li>가입일 : "+value[i].regdate+"</li>");
					$("#lst").append("<li>숫자 : "+value[i].num+"</li>");
					$("#lst").append("<hr>");
							}
						}
					});
				}				
			});
		});
	}) ;
</script>

</body>
</html>