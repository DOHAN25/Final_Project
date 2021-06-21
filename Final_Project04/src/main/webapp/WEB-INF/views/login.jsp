<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	



<form action="loginPost.do" method="post" id="loginForm">
	<div class="form-group label-floating">
		<label class="control-label">이메일 주소</label> <input name="userEmail" type="text" id="exampleInputEmail1" class="form-control" value="${cookie.rememberID.value}">
	</div>
	<div class="form-group label-floating">
		<label class="control-label">비밀번호</label> <input name="userPwd" type="password" id="exampleInputPassword1" class="form-control">
	</div>
	<button type="submit" class="btn btn-default">로그인</button>
</form>
	
	
	
	<a id="kakao-login-btn"></a>
	<script type="text/javascript" src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript">
	
		Kakao.init('1e4c72d72b9614055f4d89bb5623539d');
		
		Kakao.Auth.createLoginButton({
			container: '#kakao-login-btn',
			success: function(authObj) {
				Kakao.API.request({
					url:'/v2/user/me',
					success: function(res){
						console.log(res);
						var id = res.id;
						var email = res.kakao_account.email;
						var name = res.properties.nickname;
						var html = '<BR>' + email + '<BR>' + name;
						$('body').append(html);
						
						//location.href='kakaoRedirectForm.jsp?emial=' + email + '&nmae=' + name;
					}
				})
				
				console.log(authObj);
				var token = authObj.access_token;
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	</script>
	
	
	<script type="text/javascript">
		var msg = "${msg}";
		if(msg === "REGISTERED") {
			alert("회원가입이 완료되었습니다. 로그인해주세요.");
		} else if(msg === "FAILURE") {
			alert("아이디와 비밀번호를 확인해 주세요.");'
		}
		
	</script>
	
	

</body>
</html>