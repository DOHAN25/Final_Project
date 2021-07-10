<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨앗 마켓</title>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
	<!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!--jquery (부트스트랩의 자바스트립트 플러그인을 위해 필요합니다.)-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
    <style>
    </style>
</head>
<body>


	<h1>씨앗마켓 상품 주문 페이지</h1>

	<form action="adminproductorderpay.do" method="POST">

	<input type="hidden" name="productSeq" value="${dto.productSeq }">
	<input type="hidden" name="userSeq" value="${login.userseq }">

		<h2>상품 정보</h2>
		<p>
			<span>이미지:</span><input name="productName" value="${dto.productImg }" readonly="readonly">
		</p>
		<p>
			<span>상품명:</span><input name="productName" value="${dto.productName }" readonly="readonly">
		</p>

		<p>
			<span>가격:</span><input name="productPrice" value="${dto.productPrice }" readonly="readonly">
		</p>

		<h2>주문자 정보</h2>
		<p>
			<span>이름:</span> <input type="text" name="username" value="${login.username }" readonly="readonly" autofocus="autofocus">
		</p>
		<p>
			<span>휴대폰:</span><input type="text" name="userphone" value="${login.userphone }" placeholder="연락처를 입력해주세요">
		</p>
		
		<p>
			<span>이메일:</span> <input type="text" name="useremail" value="${login.useremail }"placeholder="이메일을 입력해주세요">
			
		</p>
		
		<p>
			<span>주소:</span> <input type="text" name="useraddress" value="${login.useraddress }"placeholder="주소글 입력해주세요">
			
		</p>
		
		<p>
			<span>상세주소:</span> <input type="text" name="userdetailaddress" value="${login.userdetailaddress }"placeholder="상세주소를 입력해주세요">
			
		</p>
		
	
  		<button onclick="requestPay()">결제하기</button>
		<input type="reset"	value="취소하기">
		<input type="button" value="뒤로가기" onclick="location.href='adminproductdetail.do?productSeq=${dto.productSeq }'">


<%-- 

adminproductorder
<br>
userseq:
${login.userseq }
<br>이미지:
${dto.productImg }

<br>
상품명:
${dto.productName }
<br>
상품가격:
${dto.productPrice }
<br>
주문자명:
${login.userid }
<br>
주문자 이름:
${login.username }
<br>
주문자 연락처:
${login.userphone }
<br>
useremail
${login.useremail }
<br>
주문자 주소:
${login.useraddress }
<br>
상세주소:
${login.userdetailaddress } --%>

	</form>

<script type="text/javascript">

var IMP = window.IMP; // 생략해도 괜찮습니다.
IMP.init("imp98397380"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.


function requestPay() {
	// IMP.request_pay(param, callback) 호출
	IMP.request_pay({ // param
	  pg: "html5_inicis", //kg이니시스 (웹표준 결제창)
	  pay_method: "card",
	  merchant_uid: "ORD20180131-0000011",
	  name: "노르웨이 회전 의자",
	  amount: 64900,
	  buyer_email: "gildong@gmail.com",
	  buyer_name: "홍길동",
	  buyer_tel: "010-4242-4242",
	  buyer_addr: "서울특별시 강남구 신사동",
	  buyer_postcode: "01181"
	}, function (rsp) { // callback
		 if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		      // jQuery로 HTTP 요청
		      jQuery.ajax({
		          url: "https://www.myservice.com/payments/complete", // 가맹점 서버
		          method: "POST",
		          headers: { "Content-Type": "application/json" },
		          data: {
		              imp_uid: rsp.imp_uid,
		              merchant_uid: rsp.merchant_uid
		          }
		      }).done(function (data) {
		        // 가맹점 서버 결제 API 성공시 로직
		      })
		    } else {
		      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
		    }
		  });
}

</script>

</body>
</html>