<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
	
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
			
		<script type="text/javascript">

		/* 넘길데이터 */
		var params = $("#orderinfo").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.

		</script>
		
		<style>
			#productThumb {
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
                                <td><img id="productThumb" src="${pageContext.request.contextPath}/resources${dto.productImg }"
                                        class="img-responsive" alt="Responsive image">
                                <td id="productName" style="vertical-align: middle;">${dto.productName }</td>
                                <td style="vertical-align: middle;">당근팜</td>
                                <td style="vertical-align: middle;">3,000</td>
                                <td id="quantity" style="vertical-align: middle;">1</td>
                                <td id="productPrice" style="vertical-align: middle;">${dto.productPrice }</td>
                                <td id="orderAmount" style="vertical-align: middle;">${orderAmount }</td>
                            </tr>
        
                        </table>
                        <hr>
        
        
        
                        <!--수정버튼누르면 회원정보수정 페이지로가게 하면 될거같아영~~~-->
                        <h2>주문자 정보</h2>
                        <div class="row">
                            <div class="col-md-8">
                                <table class="table" style="margin-top:40px;">
                                    <tr>
                                        <th>이름</th>
                                        <td> <input type="text" id="receiveName" value="${login.username }"
                                                readonly="readonly" autofocus="autofocus"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <th>휴대폰</th>
                                        <td>
                                            <input type="text" id="receiverPhone" value="${login.userphone }"
                                                placeholder="연락처를 입력해주세요">
                                        </td>
                                        <td><a href="#"><button type="button" class="btn btn-default btn-sm">수정</button></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>우편번호</th>
                                        <td> <input type="text" id="receiverOaddress" value="${login.useroaddress }"
                                                placeholder="우편번호를 입력해주세요"></td>
                                        <td><a href="#"><button type="button" class="btn btn-default btn-sm">수정</button></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td> <input type="text" id="receiverRaddress" value="${login.useraddress }"
                                                placeholder="주소를 입력해주세요"></td>
                                        <td><a href="#"><button type="button" class="btn btn-default btn-sm">수정</button></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>상세주소</th>
                                        <td> <input type="text" id="receiverDetailaddress" value="${login.userdetailaddress }"
                                                placeholder="상세주소를 입력해주세요">
                                        </td>
                                        <td><a href="#"><button type="button" class="btn btn-default btn-sm">수정</button></a>
                                        </td>
                                    </tr>
        
                                </table>
                            </div>
                            <div class="col-md-4">
        
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4"><button id="requestPay" class="btn btn-primary btn-block">결제</button></div>
                            <div class="col-md-4"><input type="button" class="btn btn-default btn-block"
                                    onclick="location.href='adminproductdetail.do?productSeq=${dto.productSeq }'" value="취소">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    

	</body>

	</html>