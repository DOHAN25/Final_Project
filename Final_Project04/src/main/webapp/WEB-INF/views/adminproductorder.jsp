<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨앗 마켓</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>

	<h1>씨앗마켓 상품 주문 페이지</h1>

	<form action="adminproductorderpay.do" method="POST">

<input type="hidden" name="userSeq" value="${dto.productSeq }">
<input type="hidden" name="userSeq" value="${login.userseq }">

adminproductorder

${dto.productName }

${dto.productPrice }
${login.userseq }
${login.userseq }
	</form>


</body>
</html>