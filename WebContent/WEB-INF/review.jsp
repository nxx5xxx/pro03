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
<title>Insert title here</title>
<style>
.back_star {background-image:url(${path1 }/img/review/star.PNG);}
.btn_star {width:19px;height:41px;position:relative;float:left}
.dis_no{display:none}
#star_btn05:checked ~ .back_star {background-image:url(${path1 }/img/review/star_05.png);}
#star_btn10:checked ~ .back_star {background-image:url(${path1 }/img/review/star_10.png);}
#star_btn15:checked ~ .back_star {background-image:url(${path1 }/img/review/star_15.png);}
#star_btn20:checked ~ .back_star {background-image:url(${path1 }/img/review/star_20.png);}
#star_btn25:checked ~ .back_star {background-image:url(${path1 }/img/review/star_25.png);}
#star_btn30:checked ~ .back_star {background-image:url(${path1 }/img/review/star_30.png);}
#star_btn35:checked ~ .back_star {background-image:url(${path1 }/img/review/star_35.png);}
#star_btn40:checked ~ .back_star {background-image:url(${path1 }/img/review/star_40.png);}
#star_btn45:checked ~ .back_star {background-image:url(${path1 }/img/review/star_45.png);}
#star_btn50:checked ~ .back_star {background-image:url(${path1 }/img/review/star_50.png);}

.star05:hover ~ .back_star {background-image:url(${path1 }/img/review/star_05.png);}
.star10:hover ~ .back_star {background-image:url(${path1 }/img/review/star_10.png);}
.star15:hover ~ .back_star {background-image:url(${path1 }/img/review/star_15.png);}
.star20:hover ~ .back_star {background-image:url(${path1 }/img/review/star_20.png);}
.star25:hover ~ .back_star {background-image:url(${path1 }/img/review/star_25.png);}
.star30:hover ~ .back_star {background-image:url(${path1 }/img/review/star_30.png);}
.star35:hover ~ .back_star {background-image:url(${path1 }/img/review/star_35.png);}
.star40:hover ~ .back_star {background-image:url(${path1 }/img/review/star_40.png);}
.star45:hover ~ .back_star {background-image:url(${path1 }/img/review/star_45.png);}
.star50:hover ~ .back_star {background-image:url(${path1 }/img/review/star_50.png);}

</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
if(${sw }==1){
	alert("이미 별점을 남겼습니다");
	window.close();
	}
</script>
</head>
<body>
<input type="hidden" name="wno" id="wno" value="${wno }">
<article style="width:190px;margin: 0 auto">
<label for="star_btn05" class="star05 btn_star" ></label>
<label for="star_btn10" class="star10 btn_star" ></label>
<label for="star_btn15" class="star15 btn_star" ></label>
<label for="star_btn20" class="star20 btn_star" ></label>
<label for="star_btn25" class="star25 btn_star" ></label>
<label for="star_btn30" class="star30 btn_star" ></label>
<label for="star_btn35" class="star35 btn_star" ></label>
<label for="star_btn40" class="star40 btn_star" ></label>
<label for="star_btn45" class="star45 btn_star" ></label>
<label for="star_btn50" class="star50 btn_star" ></label>
<input type="radio" name="star_btn" id="star_btn05" class="dis_no" value="0.5">
<input type="radio" name="star_btn" id="star_btn10" class="dis_no" value="1">
<input type="radio" name="star_btn" id="star_btn15" class="dis_no" value="1.5">
<input type="radio" name="star_btn" id="star_btn20" class="dis_no" value="2">
<input type="radio" name="star_btn" id="star_btn25" class="dis_no" value="2.5">
<input type="radio" name="star_btn" id="star_btn30" class="dis_no" value="3">
<input type="radio" name="star_btn" id="star_btn35" class="dis_no" value="3.5">
<input type="radio" name="star_btn" id="star_btn40" class="dis_no" value="4">
<input type="radio" name="star_btn" id="star_btn45" class="dis_no" value="4.5">
<input type="radio" name="star_btn" id="star_btn50" class="dis_no" value="5">
<div class="back_star" style="width:190px;height:41px;"></div>
</article>
<div style="width:69px;margin: 0 auto">
<input type="button" style="float:left" value="별점주기" onclick="review()">
</div>
<script>
function review(){
	//alert("별점주기 시작");
	var rev_no = $("[name=star_btn]:checked").val();
	if(typeof rev_no=='undefined'){
		alert("별점을 입력하지 않았습니다");
	}else{
			//alert($("[name=star_btn]:checked").val());
			let rev = confirm(rev_no+"점 을 주시겠습니까?");
				if(rev==true){
					alert("오케이!");
					$.ajax({
						type:"post",
						url:"${path1 }/ReviewInsert.do",
						dataType:"json",
						encType:"UTF-8",
						data: {point:rev_no,wno:$("#wno").val()},
						async: false
					});
					opener.location.reload();//부모창 새로고침
					window.close();
					
				}

	}
}
</script>
</body>
</html>