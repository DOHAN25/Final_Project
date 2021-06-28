<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script>
		function goPopup() {
			//주소 검색을 수행할 팝업 페이지를 호출
			//호출된 페이지 (jusopopup.jsp) 에서 실제 주소검색 URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("jusoPopup.do", "pop",
            "width=570,height=420, scrollbars=yes, resizable=yes");
		}
			//원하는 페이지 영역에 주소값을 입력해줌 
	       	var jusoCallBack = function(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo){ 
	           document.getElementById("sellerAddress").value = roadFullAddr; 
	           self.close();
		}
	</script>
</head>
<body>

	<h1>당근마켓등록</h1>
	
	<form action="productinsertres.do" method="post">
		<table border="1">
			<tr>
				<td>작성자</td>
				<td></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="productName"/></td>
				<td>상품가격</td>
				<td><input type="text" name="productPrice"/></td>
			</tr>
			<tr>
				<td>거래가능지역</td>
				<td><input type="text" id="sellerAddress" name="sellerAddress"/></td>
				<td><button type="button" class="btnjuso" onClick="goPopup();">검색</button></td>
			</tr>
			<tr>
				<td>위도</td><td><input type="text" name="userLatitude"></td>
				<td>경도</td><td><input type="text" name="userLongitude"></td>
			</tr>
			<tr>
				<td>상품정보</td>
				<td><input type="text" name="productInfo"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="상품등록" />
					<input type="button" value="취소" onclick="location.href='marketplace.do'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>