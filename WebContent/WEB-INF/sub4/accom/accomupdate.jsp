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
<title>관광안내 > 관광지도 > 숙박시설 > 숙박시설 수정</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
.agree_fr { width: 1000px; padding: 24px; margin: 10px auto; }
.image { display: block; width: 300px; height: 250px; }
#postcode { width: 250px; margin-right: 10px;}
.file2 {display:none}
/* #fileSel1:checked ~ #file1 { display:none; } */
#fileSel2:checked ~ .file2 { display:block; }
</style>
</head>
<body>
<%@ include file="/header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<div class="container-fluid">
	<h2 class="title" style="text-align: center;">함안 숙박시설 수정</h2>
	<article class="agree_fr">
		<form action="${path1 }/AccomUpdatePro.do" method="post" enctype="multipart/form-data" class="box">
		<table class="table">
			<tbody>
				<tr>
					<th><label class="label" for="title">상호명</label></th>
					<td>
						<input type="hidden" name="ano" id="ano" value="${accom.ano }" />
						<input type="text" name="title" id="title" placeholder="상호명 입력" class="input" value="${accom.title }" required />
					</td>
				</tr>
				<tr>
					<th><label class="label" for="tel">전화번호</label></th>
					<td><input type="tel" name="tel" id="tel" maxlength="14" placeholder="ex) 0505-1234-5678" class="input" value="${accom.tel }" required></td>
				</tr>
				<tr>
					<th><label class="label" for="post_btn">주소</label></th>
					<td>
					<c:set var="addr1234" value="${fn:substringAfter(accom.addr, ' ' )}"/>
					<input type="hidden" name="addr" id="addr" value="${accom.addr }" />
					<input type="text" name="postcode" id="postcode" placeholder="우편번호" class="input" value="${fn:substring(accom.addr, 1, 6 )}" readonly>
					<button id="post_btn" onclick="return findAddr()" class="button is-info is-rounded">우편번호 검색</button>
					<input type="text" name="address1" id="address1" placeholder="기본 주소" class="input" value="${fn:substringBefore(addr1234, ',' )}" required readonly /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="input" value="${fn:substringAfter(accom.addr, ', ' )}" required  /><br>
					</td>
				</tr>
				<tr>
					<th><label class="label" for="fileSel2">첨부파일</label></th>
					<td>
						<input type="hidden" name="file1" id="file1" value="${accom.file1 }">
						<input type="radio" name="fileSel" id="fileSel1" onclick="fileCall()" checked>교체 안 함<br> 
						<input type="radio" name="fileSel" id="fileSel2" onclick="fileCall()" >교체<br>
						<input type="file" name="fileSel" id="file2" class="file2">
						<script>
						function fileCall(){
							var fileSel1 = document.getElementById("fileSel1");
							var fileSel2 = document.getElementById("fileSel2");
							var file1 = document.getElementById("file1");
							var file2 = document.getElementById("file2");
							if(fileSel1.checked){
								file1.style.display = "none";
								file1.setAttribute("disabled");
								file2.removeAttribute("disabled");
							} else {
								file1.style.display = "block";
								file1.removeAttribute("disabled");
								file2.setAttribute("disabled");
							}
						}
						</script>		
					</td>
				</tr>
				<tr>
					<td colspan="2">
					&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
       				<input type="submit" value="등록하기" class="button is-info"/>
					&nbsp; &nbsp; &nbsp;
					<a href="javascript:history.go(-1)" class="button is-light">취소</a>
					<!-- <input type="reset" value="초기화" class="button is-ghost"/> -->
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<script>
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
				document.getElementById("address2").value = "";
				document.getElementById("address2").focus();
			}
		}).open();
		return false;
	}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</article>		
	</div>
</div>
<%@ include file="/footer.jsp" %>
</body>
</html>