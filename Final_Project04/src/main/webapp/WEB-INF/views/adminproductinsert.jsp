<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨앗 마켓</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- style -->
	<style>
	#image_container img{
		width:400px;
	}
	</style>
</head>
</head>
<body>

	<h1>씨앗마켓 상품정보 등록</h1>


	<form action="adminproductinsertres.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="userSeq" value="${login.userseq }">
		<input type="hidden" name="userId" value="${login.userid }">
		
		
			<div>
				<div>작성자</div>
				<div><input type="text" name="userId" readonly="readonly" value="${login.userid }"></div>
			</div>
			
			<!-- 이미지 업로드 -->
			<div>
				<div>상품이미지</div>
				<div class='uploadFileDiv'>
					<input type="file" name="file" accept="image/*1" id="productImg" onchange="setThumbnail(event);"><br>
				</div>			
				<div id="image_container"></div>
				<!--  <button id='uploadBtn'>Upload</button> -->
				<%=request.getRealPath("/") %>
				<!-- end -->
				
				
			</div>
			<div>
				<div>상품명</div>
				<div><input type="text" name="productName" placeholder="상품명을 입력해주세요."></div>
			</div>
			<div>
				<div>판매금액</div>
				<div><input type="text" name="productPrice" placeholder="숫자만 입력해주세요."></div>
			</div>
			<div>
				<div>내용</div>
				<div><textarea rows="10" cols="60" name="productInfo" placeholder="상품정보를 입력해주세요."></textarea></div>
			</div>
			<div>
				<div align="left">
					<input type="submit" value="글작성">
					<input type="button" value="취소" onclick="location.href='adminproduct.do'">
				</div>
			</div>
	</form>
	
	
	<script type="text/javascript">
	//이미지 미리보기 함수 
	function setThumbnail(event) {
		var reader = new FileReader();
		
		//onload됐을시에 발생할 이벤트 작성 
		reader.onload = function(event) {
			//FileReader가 로드 됐을 때 img 엘리먼트 생성하고 src 속성을 설정 
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			//이미지가 들어갈 div에 넣어주기 
			document.querySelector("div#image_container").appendChild(img);
		};
		
		//리더에서 input 태그에서 선택한 파일을 읽어오도록 설정 
		reader.readAsDataURL(event.target.files[0]);
	} 
	
	</script>
</body>
</html>