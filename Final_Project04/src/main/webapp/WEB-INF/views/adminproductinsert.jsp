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

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- 썸머노트 경로 -->
<script
	src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

<script type="text/javascript">
//썸머노트
	$(document).ready(function() {

		var toolbar = [
			    // 글꼴 설정
			    ['fontname', ['fontname']],
			    // 글자 크기 설정
			    ['fontsize', ['fontsize']],
			    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    // 글자색
			    ['color', ['forecolor','color']],
			    // 표만들기
			    ['table', ['table']],
			    // 글머리 기호, 번호매기기, 문단정렬
			    ['para', ['ul', 'ol', 'paragraph']],
			    // 줄간격
			    ['height', ['height']],
			    // 그림첨부, 링크만들기, 동영상첨부
			    ['insert',['picture','link','video']],
			    // 코드보기, 확대해서보기, 도움말
			    ['view', ['codeview','fullscreen', 'help']]
			  ];

		var setting = {
	            height : 300,
	            minHeight : null,
	            maxHeight : null,
	            focus : true,
	            lang : 'ko-KR',
	            toolbar : toolbar,
	            callbacks : { //여기 부분이 이미지를 첨부하는 부분
	            onImageUpload : function(files, editor,
	            welEditable) {
	            for (var i = files.length - 1; i >= 0; i--) {
	            uploadSummernoteImageFile(files[i],
	            this);
	            		}
	            	}
	            }
	         };

	        $('#summernote').summernote(setting);
	        });
	
    		function uploadSummernoteImageFile(file, el) {
				data = new FormData();
				data.append("file", file);
				$.ajax({
					data : data,
					type : "POST",
					url : "uploadSummernoteImageFile.do",
					contentType : false,
					enctype : 'multipart/form-data',
					processData : false,
					success : function(data) {
						
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
</script>
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
				<div><textarea id="summernote" name="productInfo"></textarea></div>
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