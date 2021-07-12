<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨앗 마켓</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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


	<h1>상품정보</h1>
		<input type="hidden" name="userSeq" value="${dto.productSeq }">
	<table border="1">
		<tr>
			<td>상품이미지</td>
			<td>
				<img src="${pageContext.request.contextPath}/resources${dto.productImg }">
			</td>	
		</tr>
		<tr>
			<td>상품 썸네일이미지</td>
			<td><img src="${pageContext.request.contextPath}/resources${dto.productThumb }"/></td>
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