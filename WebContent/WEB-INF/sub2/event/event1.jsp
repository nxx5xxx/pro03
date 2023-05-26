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
<title>축제행사 > 함안수박축제</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1200px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 250px; height: 160px; }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
		<h2 class="title" style="text-align: center;">함안수박축제</h2>
		<article class="agree_fr">
			<div class="box">
				<div class="tile is-ancestor">
				  <div class="tile is-vertical is-8">
				    <div class="tile">
				      <div class="tile is-parent is-vertical">
				        <article class="tile is-child box">
				          <!-- Put any content you want -->
				        </article>
				        <article class="tile is-child box">
				          <!-- Put any content you want -->
				        </article>
				      </div>
				      <div class="tile is-parent">
				        <article class="tile is-child box">
				          <!-- Put any content you want -->
				        </article>
				      </div>
				    </div>
				    <div class="tile is-parent">
				      <article class="tile is-child box">
				        <!-- Put any content you want -->
				      </article>
				    </div>
				  </div>
				  <div class="tile is-parent">
				    <article class="tile is-child box">
				      <!-- Put any content you want -->
				    </article>
				  </div>
				</div>
			</div>
		</article>	
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>