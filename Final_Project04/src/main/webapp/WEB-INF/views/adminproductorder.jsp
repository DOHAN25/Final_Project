<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨앗마켓 상품 주문 페이지</title>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
    	#productThumb{
    		width: 300px;
		 	height: 150px;
		 	object-fit: cover;
		}
    </style>
</head>
<body>
	<h1>씨앗마켓 상품 주문 페이지</h1>
	
	<!-- 주문정보를 form형태로 Adminproductcontroller로 보내준다. -->
	<form id="orderinfo" action="adminproductorderpay.do" method="post">
		<input type="hidden" name="productSeq" value="${dto.productSeq }">
		<input type="hidden" name="userSeq" value="${login.userseq }">
		<input type="hidden" name="paymethod" value="CARD">
	<input type="hidden" id="userid" value="${login.userid }">

		
		<h2>상품 정보</h2>
		
		<table border="1">
			<tbody>
			<tr>
				<td>상품이미지</td>
				<td>
					<img id="productThumb" src="${pageContext.request.contextPath}/resources${dto.productImg }">
				</td>	
			</tr>
			<tr>
				<td>상품명</td>
				<td><input name="productName" value="${dto.productName }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input name="productPrice" value="${dto.productPrice }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input name="quantity" ></td>
			</tr>
			<tr>
				<td>배송비</td>
				<td><input name="deliveryfee" ></td>
			</tr>
			<tr>
				<td>총가격</td>
				<td><input name="orderAmount" ></td>
			</tr>
		</tbody>
		</table>
		
		<h2>주문자 정보</h2>
		<table border="1">
			
			<tbody>
				<tr>
					<td>이름</td>
					<td> <input type="text" name="receiveName" value="${login.username }" readonly="readonly" autofocus="autofocus"></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td><input type="text" name="receiverPhone" value="${login.userphone }" placeholder="연락처를 입력해주세요"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td>  <input type="text" name="receiverOaddress" value="${login.useroaddress }"placeholder="주소를 입력해주세요"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>  <input type="text" name="receiverRaddress" value="${login.useraddress }"placeholder="주소를 입력해주세요"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td> <input type="text" name="receiverDetailaddress" value="${login.userdetailaddress }"placeholder="상세주소를 입력해주세요"></td>
				</tr>
			</tbody>
		</table>
		<button id="requestPay">결제하기</button>
		<!-- <input type="submit" value="결제하기"> -->
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
	<script>
		
	
		//id를 이용하여 받아온 값을 변수에 넣어준다.
		var userSeq = $("#userseq").val();
		var productSeq = $("#productSeq").val();
		var productName = $("#productName").val();
		var quantity = $("#quantity").val();
		var orderAmount = $("#orderAmount").val();
		var paymethod = $("#paymethod").val();
		var userId = $("#userid").val();
		var receiveName = $("#receiveName").val();
		var receiverPhone = $("#receiverPhone").val();
		var receiverOaddress = $("#receiverOaddress").val();
		var receiverRaddress = $("#receiverRaddress").val();
		var receiverDetailaddress = $("#receiverDetailaddress").val();
		var paymethod = $("#paymethod").val();
		var productPrice = $("#productPrice").val();
		
		/* 넘길데이터 */
	/* 	var params ={'userSeq':userSeq, 'productPrice': productPrice, 'productSeq':productSeq,'productName':productName, 'quantity':quantity, 
				'orderAmount':orderAmount, 'paymethod': paymethod, 'userId': userId,'receiveName':receiveName,
				'receiverPhone':receiverPhone,'receiverOaddress': receiverOaddress,  'receiverOaddress':receiverOaddress, 
				'receiverRaddress': receiverRaddress, 'receiverDetailaddress': receiverDetailaddress,'paymethod':paymethod };
		console.log(params);
 */
	
 		var params= $("#orderinfo").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.

 
		$("#requestPay").click(function({

			var IMP = window.IMP; // 생략가능
			IMP.init('imp98397380'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			var msg;

			IMP.request_pay({
				pg : 'kakaopay',
				paymethod : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : productName,
				buyer_name : receiveName,
				buyer_tel : receiverPhone,
				pay_type : paymethod,
				amount : orderAmount
			//m_redirect_url : 'http://www.naver.com'
			}, function(rsp) {
				if (rsp.success) {
					//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
					jQuery.ajax({
						//
						url : "${path}/adminproductorderPayRes.do", //cross-domain error가 발생하지 않도록 주의해주세요
						type : 'POST',
						dataType : 'json',
						contentType: "application/json; charset=utf8",
						data :JSON.stringify(params) //넘길데이터 -json형태로 변환
						success: function (result) {
							            if (result){
							                // 데이타 성공일때 이벤트 작성
							                console.log(params);
							            }
						/*  {
							
							$("#orderinfo").serialize();		
							
							imp_uid : rsp.imp_uid,
							buyer_name : name,
							buyer_email : email,
							buyer_tel : phone,
							pay_type : type,
							amount : orderAmount
							//기타 필요한 데이터가 있으면 추가 전달
						} */
					}).done(function(data) {
						//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
						if (everythings_fine) {
							msg = '결제가 완료되었습니다.';
							msg += '\n고유ID : ' + rsp.imp_uid;
							msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							msg += '\결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;

							alert(msg);

						} else {
							//[3] 아직 제대로 결제가 되지 않았습니다.
							//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
							msg = "done err";
							alert(msg);
						}
					});
					//성공시 이동할 페이지
					alert("결제 성공!")
            		
				} else {
					msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					//실패시 이동할 페이지
					alert(msg);

				}
			});
		});
				
				
			
			

	</script>
	
</body>
</html>