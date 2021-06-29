<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!--jquery (부트스트랩의 자바스트립트 플러그인을 위해 필요합니다.)-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">

*{
padding: 1px;
margin: 1px;
width: auto;
align-content: center;
}

header{
height: 30%
}
#body {
	margin-top: 150px;
	
	height: 600px;
	background-color: #E9E9E9;
	border: 1px solid #CFCECE;
}



</style>

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
				data:JSON.stringify(loginVal),  											   
				contentType:"application/json", 
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


		<div class="container ">

			<div class="row">

				<div class="col-md-5 col-md-offset-7 text-center"
					id="body">
					<div class="row">
						<div class="col-md-8 col-md-offset-2 ">
							<img src="resources/image/logo-banner.png" class="img-responsive" alt="Responsive image">
		
							<form class="form-horizontal" >
								<div class="form-group">
									
									<div class="col-sm-12">
										<input type="email" class="form-control" id="inputEmail3"
											placeholder="아이디를 입력하세요">
									</div>
								</div>
								<div class="form-group">
									
									<div class="col-sm-12">
										<input type="password" class="form-control" id="inputPassword3"
											placeholder="비밀번호를 입력하세요">
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-sm-12">
										<br/>
										<button type="button" class="btn btn-primary btn-block">로그인</button>
									</div>
									<br/><br/><br/><br/>
									<p>계정이 없으신가요?<a href=""><button type="button" class="btn btn-link">회원가입</button></a></p>
									<a href=""><button type="button" class="btn btn-link">아이디 찾기</button></a>
									<a href=""><button type="button" class="btn btn-link">비밀번호 찾기</button></a>
									<br><br><a href=""><img src="resources/image/kakao-logo.png" alt="Kakao image" style=" height: 20px; width:20px; margin-right:10px; ">Kakao  로그인</a>
									<br><br><a href=""><img src="resources/image/naver_logo.png" alt="Naver image" style=" height: 20px; width:20px; margin-right:10px;">Naver  로그인</a>
									<br><br><a href=""><img src="resources/image/google-logo.png" alt="Google image" style=" height: 20px; width:20px; margin-right:10px;">Google 로그인</a>
								</div>
							</form>
						</div>
					</div>
				</div>
		</div>
		</div>

</body>
</html>

