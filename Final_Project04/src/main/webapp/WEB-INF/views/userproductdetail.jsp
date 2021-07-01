<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>상품정보</h1>
	
	<table border="1">
		<tr>
			<td>userId</td>
			<td>${dto.userId }</td>
		</tr>
		<tr>
			<td>등록날짜</td>
			<td>${dto.productRegDate }</td>
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
			<td>판매가능여부</td>
			<td>${dto.saleStatus }</td>
		</tr>
		<tr>
			<td>상품정보</td>
			<td>${dto.productInfo }</td>
		</tr>
		<tr>
			<td>거래가능지역</td>
			<td>${dto.sellerAddress }</td>
		</tr>
		<tr>
			<td>지도</td>
			<td>
				<!-- 지도를 표시할 div 입니다 -->
				<div id="map" style="width:100%;height:350px;"></div>
			</td>
		</tr>
	</table>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b7e72eca108f2115775c1000b513249"></script>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null)

</script>

</body>
</html>