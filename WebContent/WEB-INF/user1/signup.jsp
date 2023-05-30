<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
.title { padding-top:36px; padding-bottom:10px; }
#postcode { width: 250px; margin-right: 10px;}
#id { width: 500px; margin-right: 10px;}
.agree_fr { width: 900px; padding: 24px; margin: 10px auto; }
</style>
</head>
<body>
<%@ include file="../../header.jsp" %>
<div class="content" style="padding-top:30px; margin-top:30px; border-top:3px solid #333; min-height:500px; ">
	<section class="container-fluid">
	<h2 class="title" style="text-align: center;">회원가입</h2>
	<article class="agree_fr">
	<form name="frm1" id="frm1" class="box" action="${path1 }/UserSignUpPro.do" method="post" onsubmit="return joinCheck(this)">
		<table class="table">
			<tbody>
				<tr>
					<th id="idth"><label class="label" for="id">아이디</label></th>
					<td>
						<div class="form-row">
							<input type="text" name="id" id="id" placeholder="영문소문자 및 숫자 조합" 
							class="input" pattern="^[a-z0-9]{8,16}" maxlength="15" autofocus required />
							<input type="button" class="button is-info is-rounded" value="중복 확인" onclick="idCheck()">
							<input type="hidden" name="idck" id="idck" value="no">
						</div>
						<div>
							<c:if test="${empty qid }">
							<p id="msg" style="padding-left:0.5rem">아이디 중복 확인이 필요합니다.</p>
							</c:if>
							<c:if test="${not empty qid }">
							<p id="msg" style="padding-left:0.5rem">아이디 중복 체크 후 수정하였습니다.</p>
							</c:if>
						</div>
					</td>
				</tr>
				<tr>
					<th><label class="label" for="pw">비밀번호</label></th>
					<td>
						<input type="password" name="pw" id="pw" placeholder="비밀번호 입력" class="input"
						pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required />
						<p>최소 8자리에서 최대 16자리까지 숫자, 영문, 특수문자 각 1개 이상 포함하여 입력</p>
					</td>
				</tr>
				<tr>
					<th><label class="label" for="pw2">비밀번호 확인</label></th>
					<td><input type="password" name="pw2" id="pw2" placeholder="비밀번호  확인 입력" class="input" 
					pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$" maxlength="16" required /></td>
				</tr>
				<tr>
					<th><label class="label" for="name">이름<p>(개인,기업,단체)</p></label></th>
					<td><input type="text" name="name" id="name" placeholder="이름 또는 개인, 기업, 단체명 입력" class="input" required /></td>
				</tr>
				<tr>
					<th><label class="label" for="email">이메일</label></th>
					<td><input type="email" name="email" id="email" placeholder="이메일 입력" class="input" required></td>
				</tr>
				<tr>
					<th><label class="label" for="tel">연락처</label></th>
					<td><input type="tel" name="tel" id="tel" maxlength="14" placeholder="ex) 010-1234-5678" class="input" required></td>
				</tr>
				<tr>
					<th><label class="label" for="post_btn">주소</label></th>
					<td>
					<input type="text" name="postcode" id="postcode" placeholder="우편번호" class="input"  readonly>
					<button type="button" id="post_btn" onclick="findAddr()" class="button is-info is-rounded">우편번호 검색</button>
					<input type="text" name="address1" id="address1" placeholder="기본 주소" class="input" required  readonly /><br>
					<input type="text" name="address2" id="address2" placeholder="상세 주소 입력" class="input" required  /><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp;
						<input type="submit" value="회원가입" class="button is-info"/>
						&nbsp; &nbsp; &nbsp;
						<a href="javascript:history.go(-1)" class="button is-light">취소</a>
						<!-- <input type="reset" value="초기화" class="button is-ghost"/> -->
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<script>
	function idCheck(){
		if($("#id").val()==""){
			alert("아이디를 입력하시기 바랍니다.");
			$("#id").focus();
			return;
		}
		var params = { id:$("#id").val() }
		$.ajax({
			url:"${path1 }/IdCheck.do",
			type:"post",
			dataType:"json",
			data:params,
			success:function(result){
				//console.log(result);
				var idChk = result.result;
				if(idChk==false){
					$("#idck").val("no");
					$("#msg").html("<strong>사용할 수 없는 아이디입니다.</strong>")
				} else if(idChk==true){
					$("#idck").val("yes");
					$("#id").attr("readonly","true");
					$("#msg").html("<strong>사용 가능한 아이디입니다.</strong>")
					$("#pw").focus();
				} else {
					$("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도 바랍니다.</strong>")
				}				
			}
		});
	}
	function joinCheck(f){
		if(f.pw.value!=f.pw2.value){
			alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
			f.pw.focus();
			return false;
		}
		if(f.idck.value!="yes"){
			alert("아이디 중복 체크를 하지 않으셨습니다.");
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