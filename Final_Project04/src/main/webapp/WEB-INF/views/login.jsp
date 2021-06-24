<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script type="text/javascript">
	$(function(){
		$("#loginChk").hide();
	});
	
	function login() {
		var userid = $("#memberid").val().trim();
		var password = $("#memberpw").val().trim();
		
		// 자바스크립트 오브젝트 리터럴 형태 뭔지 찾아보자.
		var loginVal =  {
				"userid" : userid,
				"password" : password
		}
		if(userid == null || userid == "" || password == null || password == "") {
			alert("ID 및 PW를 다시 확인해 주세요!");
		} else {
			$.ajax({
				type:"post",
				url:"ajaxlogin.do",
				data:JSON.stringify(loginVal), // ajax로 보내준다. 자바에는 JSON이라는 타입이 없다. 
											   // 그런데 requestbody가 넘어가는 json형태의 값을 자바 오브젝트 형태로 바꿔준다
				contentType:"application/json", // 이거 없으면 415 에러뜬다. unsupported media type : 넘어오는 값이 잘못되었다.
												// 원래 String 타입으로 넘어가는데 contentType을 쓰면 json 타입이라고 알려주는 것. requestBody랑 세트라고 생각해도 무방하다.
				dataType:"json",
				success:function(msg) {
					if(msg.check == true) {
						alert("반갑습니다.");
						location.href="loginform.do";
					} else {
						$("#loginChk").show();
						$("#loginChk").html("ID 혹은 PW가 잘못되었습니다.");
					}
				},
				error:function() {
					alert("통신 실패");
				}
			});
		}
		
	}

</script>
</head>
<body>

<c:if test="${login == null}">
	<table>
			<tr>
				<th>ID</th>
				<td><input type="text" id="memberid"></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="password" id="memberpw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="login" onclick="login();">
					<input type="button" value="regist" onclick="location.href='registform.do'">
				
				</td>
				
			</tr>
			<tr>
				<td colspan="2" align="center" id="loginChk" style="color: red;"></td>
			</tr>
		</table>
		<a href="findid.do" style="color: black; text-decoration: none;">아이디찾기</a>
		<a href="findpw.do" style="color: black; text-decoration: none;">비밀번호찾기</a>
		<br>
		<a href="kakaologin.do">
		<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="200"/>
		</a>
		<br>
		<a href="${url}">
			<img width="200" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/>
		</a>
</c:if>
<c:if test="${login != null}">

	<div>${login.userId}님 환영합니다.</div>

</c:if>
	

</body>
</html>

