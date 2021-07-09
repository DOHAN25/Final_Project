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
</head>
<body>

	<h1>씨앗마켓 상품정보 등록</h1>


	<form action="adminproductinsertres.do" method="POST">
		<input type="hidden" name="userSeq" value="${login.userseq }">
		
		<table border="1">
		
			<tr>
				<th>작성자</th>
				<td><input type="text" name="userId" readonly="readonly" value="${login.userid }"></td>
			</tr>
			<tr>
				<th>상품이미지</th>
				<td><input type="text" name="productImg" placeholder="이미지를 삽입해주세요."></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="productName" placeholder="상품명을 입력해주세요."></td>
			</tr>
			<tr>
				<th>판매금액</th>
				<td><input type="text" name="productPrice" placeholder="숫자만 입력해주세요."></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="productInfo" placeholder="상품정보를 입력해주세요."></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="글작성">
					<input type="button" value="취소" onclick="location.href='adminproduct.do'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>