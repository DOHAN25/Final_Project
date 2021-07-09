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


	<h1>상품정보</h1>
		<input type="hidden" name="userSeq" value="${dto.productSeq }">

	<table border="1">
		<tr>
			<td>상품이미지</td>
			<td>${dto.productImg }</td>
		</tr>
		<tr>
			<td>상품명</td>
			<td>${dto.productName }</td>
		</tr>
		<tr>
			<td>판매금액</td>
			<td>${dto.productPrice }</td>
		</tr>
		<tr>
			<td>상품정보</td>
			<td>${dto.productInfo }</td>
		</tr>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="구매하기" onclick="location.href='adminproductorder.do?productSeq=${dto.productSeq }'">
				<input type="button" value="목록" onclick="location.href='adminproduct.do'">
			</td>
		</tr>
	</table>


</body>
</html>