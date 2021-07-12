<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:set var="path" value="${pageContext.request.contextPath }" />

		<!DOCTYPE html>

		<html>

		<head>
			<meta charset="UTF-8">
			<title>씨앗마켓 상품 주문 페이지</title>
			<!-- iamport.payment.js -->
			<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

			<!-- jQuery -->
			<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
			<!-- 합쳐지고 최소화된 최신 CSS -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
			<!--jquery (부트스트랩의 자바스트립트 플러그인을 위해 필요합니다.)-->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

			<!-- 부가적인 테마 -->
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
			<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


			<style>
				#productThumb {
					width: 300px;
					height: 150px;
					object-fit: cover;
				}

				.fade.in {
					opacity: 1;
				}

				.modal.in .modal-dialog {
					-webkit-transform: translate(0, 0);
					-o-transform: translate(0, 0);
					transform: translate(0, 0);
				}

				.modal-backdrop.in {
					opacity: 0.5;
				}


				.inipay_modal.fade:not(.show) {
					opacity: 1 !important;
				}
			</style>
		</head>

		<body>
			<%@include file="/WEB-INF/views/1header.jsp" %>
				<h1>씨앗마켓 상품 주문 페이지</h1>
				<!-- 주문정보를 form형태로 Adminproductcontroller로 보내준다. -->
				<form id="orderinfo" method="post">
					<input type="hidden" name="productSeq" id="productSeq" value="${dto.productSeq }">
					<input type="hidden" name="userSeq" id="userSeq" value="${login.userseq }">
					<input type="hidden" name="paymethod" id="paymethod" value="CARD">
					<input type="hidden" name="userId" id="userId" value="${login.userid }">

					<div class="container" style="width: 100%;">
						<div class="row">
							<div class="col-md-8 col-md-offset-2">
								<h2>주문/결제</h2>
								<hr>
								<table class="table">
									<tr>
										<th></th>
										<th>상품명</th>
										<th>판매자</th>
										<th>배송비</th>
										<th>수량</th>
										<th>상품금액</th>
										<th>총 주문금액</th>
									</tr>
									<tr>
										<td><img id="productThumb"
												src="${pageContext.request.contextPath}/resources${dto.productImg }"
												class="img-responsive" alt="Responsive image"></td>
										<td style="vertical-align: middle;"> <input type="hidden" name="productName"
												id="productName" value="${dto.productName }"> ${dto.productName }</td>
										<td style="vertical-align: middle;">당근팜</td>
										<td style="vertical-align: middle;">3,000</td>
										<td style="vertical-align: middle;"> <input type="hidden" name="quantity"
												id="quantity" value="1"> 1</td>
										<td style="vertical-align: middle;"> <input type="hidden" name="productPrice"
												id="productPrice" value="${dto.productPrice }">${dto.productPrice }
										</td>
										<td style="vertical-align: middle;"> <input type="hidden" name="orderAmount"
												id="orderAmount" value="${dto.productPrice * 1}">${dto.productPrice * 1}
										</td>
									</tr>

								</table>
								<hr>



								<!--수정버튼누르면 회원정보수정 페이지로가게 하면 될거같아영~~~-->
								<h2>주문자 정보</h2>
								<div class="row">
									<div class="col-md-8">
										<table class="table" style="margin-top: 40px;">
											<tr>
												<th>이름</th>
												<td><input type="text" name="receiveName" id="receiveName"
														value="${login.username }" readonly="readonly"
														autofocus="autofocus"></td>
												<td><a href="#"><button type="button"
															class="btn btn-default btn-sm">수정</button></a></td>
											</tr>
											<tr>
												<th>휴대폰</th>
												<td><input type="text" name="receiverPhone" id="receiverPhone"
														value="${login.userphone }" placeholder="연락처를 입력해주세요">
												</td>
												<td><a href="#"><button type="button"
															class="btn btn-default btn-sm">수정</button></a></td>
											</tr>
											<tr>
												<th>우편번호</th>
												<td><input type="text" name="receiverOaddress" id="receiverOaddress"
														value="${login.useroaddress }" placeholder="우편번호를 입력해주세요"></td>
												<td><a href="#"><button type="button"
															class="btn btn-default btn-sm">수정</button></a></td>
											</tr>
											<tr>
												<th>주소</th>
												<td><input type="text" name="receiverRaddress" id="receiverRaddress"
														value="${login.useraddress }" placeholder="주소를 입력해주세요"></td>
												<td><a href="#"><button type="button"
															class="btn btn-default btn-sm">수정</button></a></td>
											</tr>
											<tr>
												<th>상세주소</th>
												<td><input type="text" name="receiverDetailaddress"
														id="receiverDetailaddress" value="${login.userdetailaddress }"
														placeholder="상세주소를 입력해주세요">
												</td>
												<td><a href="#"><button type="button"
															class="btn btn-default btn-sm">수정</button></a></td>
											</tr>

										</table>
									</div>
									<div class="col-md-4"></div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<button id="requestPay" class="btn btn-primary btn-block">결제</button>
									</div>
									<div class="col-md-4">
										<input type="button" class="btn btn-default btn-block"
											onclick="location.href='adminproductdetail.do?productSeq=${dto.productSeq }'"
											value="취소">
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>

				<script>
		//id를 이용하여 받아온 값을 변수에 넣어준다.
		/* var userSeq = $("#userSeq").val();
		var productPrice = $("#productPrice").val();
		var productSeq = $("#productSeq").val();
		var productName = $("#productName").val();
		var quantity = $("#quantity").val();
		var orderAmount = $("#orderAmount").val();
		var paymethod = $("#paymethod").val();
		var userId = $("#userId").val();
		var receiveName = $("#receiveName").val();
		var receiverPhone = $("#receiverPhone").val();
		var receiverOaddress = $("#receiverOaddress").val();
		var receiverRaddress = $("#receiverRaddress").val();
		var receiverDetailaddress = $("#receiverDetailaddress").val();

		console.log(userSeq);
		console.log(productPrice);
		console.log(productSeq);
		console.log(productName);
		console.log(quantity);
		console.log(orderAmount);
		console.log(paymethod);
		console.log(userId);
		console.log(receiveName);
		console.log(receiverPhone);
		console.log(receiverOaddress);
		console.log(receiverRaddress);
		console.log(receiverDetailaddress */);

					/* 넘길데이터 */
					var params = $("#orderinfo").serializeArray(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.

					/*  var params ={'userSeq':userSeq, 'productPrice': "${dto.productPrice }", 'productSeq':"${dto.productSeq }",'productName':"${dto.productName }", 
					'quantity':"1", 
					 'orderAmount':"${dto.productPrice }", 'paymethod': paymethod, 'userId': userId,'receiveName':receiveName,
					 'receiverPhone':receiverPhone,'receiverOaddress': receiverOaddress,  
					 'receiverRaddress': receiverRaddress, 'receiverDetailaddress': receiverDetailaddress };
					 */

					var params = {
						'userSeq': userSeq,
						'productPrice': productPrice,
						'productSeq': productSeq,
						'productName': productName,
						'quantity': quantity,
						'orderAmount': orderAmount,
						'paymethod': paymethod,
						'userId': userId,
						'receiveName': receiveName,
						'receiverPhone': receiverPhone,
						'receiverOaddress': receiverOaddress,
						'receiverRaddress': receiverRaddress,
						'receiverDetailaddress': receiverDetailaddress
					};

					console.log(params);
					$("#requestPay").click(function () {

						var IMP = window.IMP; // 생략가능
						IMP.init('imp98397380'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
						var msg;

						IMP.request_pay({
							pg: 'kakaopay',
							pay_method: 'card',
							merchant_uid: 'merchant_' + new Date().getTime(),
							name: productName,
							buyer_name: receiveName,
							buyer_tel: receiverPhone,
							pay_type: paymethod,
							amount: orderAmount
							//m_redirect_url : 'http://www.naver.com'
						}, function (rsp) {
							if (rsp.success) {
								//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
								jQuery.ajax({
									url: "${path}/adminproductorderpay.do", //cross-domain error가 발생하지 않도록 주의해주세요
									type: 'POST',
									dataType: 'json',
									data: JSON.stringify(params),
									// {
									//     command: "payment",
									//     imp_uid: rsp.imp_uid,
									//     member_num: member_num,
									//     buyer_name: name,
									//     buyer_email: email,
									//     buyer_tel: phone,
									//     pay_type: type,
									//     amount: totalPrice
									//     //기타 필요한 데이터가 있으면 추가 전달
									// }
									success: function (result) {
										if (result) {
											// 데이타 성공일때 이벤트 작성
											console.log(params);
										} else {
											console.log(params);
										}
									}
								}).done(function (data) {
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
									}
								});
								//성공시 이동할 페이지
								alert("결제 성공!")

							} else {
								msg = '결제에 실패하였습니다.';
								msg += '에러내용 : ' + rsp.error_msg;
								//실패시 이동할 페이지
								location.href = "${path}/adminproductorderPayERR.do";
								alert(msg);
							}
						});

					});
				</script>
				<%@include file="/WEB-INF/views/1footer.jsp" %>
		</body>

		</html>