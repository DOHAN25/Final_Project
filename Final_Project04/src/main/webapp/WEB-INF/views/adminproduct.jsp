<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>씨앗 마켓</title>
 <style>
    #productname {
      margin-top: 20px;
      margin-bottom: 5px;
    }

    #price {
      margin-top: 0px;
    }


    #imghover {
      opacity: 100%;
    }

    #imghover:hover {
      opacity: 0.6;
      transition: opacity 1s
    }
    #adminproductlist{
	height: 20px;
	}
  </style>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <!--jquery (부트스트랩의 자바스트립트 플러그인을 위해 필요합니다.)-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
<script type="text/javascript">
	
$(document).ready(function(){	
	
	/* 상품검색 */
	
	$("#searchBtn").click(function (){
		var selectBox = $("#selectBox option:selected").val();
		var searchVal = document.getElementById("searchVal").value;
		console.log(selectBox);
		
		if(selectBox === "productName") {
			
			var addrVal = {
					"productName": searchVal
			}
			
			$.ajax({
				type: "post",
				url: "searchProduct.do",
				data: JSON.stringify(addrVal),
				contentType: "application/json",
				dataType:"json",
				success:function(data) {
				//console.log(data.list.length);
				//console.log(data.list[0].productName);
			
				var html = "<tr>";
					for(var i = 0; i < data.list.length; i++) {
						html += "<div>"+data.list[i].productSeq+"</div>";
						html += "<td>"+data.list[i].productImg+"</td>";
						html += "<td><a href='adminproductdetail.do?productSeq="+data.list[i].productSeq+"'>"+data.list[i].productName+"</a></td>";
						html += "<td>"+data.list[i].productPrice+"</td>";
						html += "</tr>";
					}
					$("#dynamicTbody").empty();
					$("#dynamicTbody").append(html);
				}
			});
		}
	});
});

</script>
<body>
<%@include file="/WEB-INF/views/1header.jsp"%>

<div class="container" style="width: 100%;">
        <div class="col-md-8 col-md-offset-2 ">

            <div class="col-md-2 position-fixed">
                <hr style=" border-width: 3px; background-color: black; color:black">
                <h1>씨앗마켓<br> 상품 <br>리스트</h1>
                <br>
                <p>당근팜 씨앗 마켓만의 텃밭가꾸기 상품들을 만나보세요!</p>
                <!-- /input-group -->
                <div class="row">
                    <div class="col-md-12">
                        <!-- 상품검색-->
                        <select id="selectBox">
                            <option value="productName">상품명</option>
                        </select>
                        <div class="input-group">
                            <input type="text" class="form-control" id="searchVal" placeholder="Search for...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button" id="searchBtn">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                </button>
                            </span>
                        </div>

                    </div>
                </div>
                <hr>
                <div>
                    <input type="button" value="상품등록" onclick="location.href='adminproductinsert.do'">
                    <input type="button" value="메인" onclick="location.href='/carrot'">

                </div>
            </div>

            <!-- 상품 리스트 -->
            <table border="1">
                <tbody id="dynamicTbody">
                    <c:choose>
                        <c:when test="${empty adminProductList }">
                            <tr>
                                <td colspan="4">------ 작성된 글이 없습니다 ------ </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${adminProductList }" var="ProductDto">

                                <tr id="adminproductlist">
                                    <td>${ProductDto.productSeq }</td>
                                    <td>${ProductDto.productImg }</td>
                                    <td><a href="adminproductdetail.do?productSeq=${ProductDto.productSeq }">${ProductDto.productName
                                            }</a></td>
                                    <td> ${ProductDto.productPrice }</td>
                                </tr>

                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
                <tr>
                    <td colspan="4" align="right">
                        <input type="button" value="글작성" onclick="location.href='adminproductinsert.do'">
                        <input type="button" value="메인" onclick="location.href='/carrot'">
                    </td>
                </tr>
            </table>


        </div>


    </div>
    <!-- 페이지네이션 -->
    <div class="row" style="text-align: center;">
        <nav>
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <%@include file="/WEB-INF/views/1footer.jsp" %>
</body>

	
<%@include file="/WEB-INF/views/1footer.jsp"%>

</body>

<%-- <!-- 테이블 구조 -->
<body>
	<h1>씨앗마켓 상품 리스트</h1>
	<br>
	<p>당근팜 씨앗 마켓만의 텃밭가꾸기 상품들을 만나보세요!</p>

	<a href="adminproductinsert.do">상품등록</a>
	<br>
	<select id="selectBox">
		<option value="productName">상품명</option>
	</select>
	<input id="searchVal" type="text"/>
	<button id="searchBtn">검색</button>
	
	
	<table border="1">
	<col width="100">
	<col width="300">
	<col width="300">
	<col width="200">
	
	<tr>
		<th>상품번호</th>
		<th>이미지</th>
		<th>상품명</th>
		<th>상품가격</th>
		
	</tr>
	<tbody id="dynamicTbody">
		<c:choose>
			<c:when test="${empty adminProductList }">
				<tr>
					<td colspan="4">------ 작성된 글이 없습니다 ------ </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${adminProductList }" var="ProductDto">
				
					<tr id="adminproductlist">
						<td>${ProductDto.productSeq }</td>
						<td>${ProductDto.productImg }</td>
						<td><a href="adminproductdetail.do?productSeq=${ProductDto.productSeq }">${ProductDto.productName }</a></td>
						<td> ${ProductDto.productPrice }</td>
					</tr>
				
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
		<tr>
			<td colspan="4" align="right">
				<input type="button" value="글작성" onclick="location.href='adminproductinsert.do'">
				<input type="button" value="메인" onclick="location.href='/carrot'">
			</td>
		</tr>
	</table>

</body> --%>
</html>




















