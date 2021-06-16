<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>글 작성</h1>
	<!-- 업로드 페이지 -->
		<main class="snsContainer">
			<!-- 사진업로드 박스 -->
			<section class="upload">
				<div>
					<p>사진 업로드</p>
				</div>
			<!-- 사진업로드 form -->
			<form class="photo-upload-form" method="post" enctype="multipart/form-data" action="/image">
				<input type="file" name="snsImg" accept="image/*1" id="input_img" onchange="setThumbnail(event);"><br>
				<div id="image_container"></div>
				<!-- 게시글 + 업로드 버튼 -->
				<div class="upload-form-detail">
					<input type="text" name="boardContents" placeholder="게시글" /><br>
					<input type="text" name="tags" placeholder="태그"><br>
					<button type="submit">등록</button>
				</div>
				
			</form> 
			<form class="hashtag-insert-form" action="" method="post"/>
				<!-- 해쉬태그 등록 -->
				<div class="insert-hash-tag">
					<input type="text" name="hashtags" placeholder="해쉬태그 입력"> 
				</div>
			</form>
			</section>
		</main>
		
		<h2>INSERT</h2>
	<form action="snsBoardInsertRes.do" method="post">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="userId"/></td>
			</tr>

			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="boardContents"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="글작성" />
					<input type="button" value="취소" onclick="location.href='snsBoardInsertForm.do'" />
				</td>
			</tr>
		</table>
	</form>
	
	<script>
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