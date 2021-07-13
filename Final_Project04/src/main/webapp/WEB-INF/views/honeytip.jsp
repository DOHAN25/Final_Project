<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>꿀팁</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!--jquery (부트스트랩의 자바스트립트 플러그인을 위해 필요합니다.)-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩 테이블</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

</head>
<style>
svg {
	width: 100%;
	height: 100%;
}

path.slice {
	stroke-width: 2px;
}

polyline {
	opacity: .3;
	stroke: black;
	stroke-width: 2px;
	fill: none;
}
</style>

<body>
	<%@include file="/WEB-INF/views/1header.jsp"%>

	<div class="container" style="width: 100%;">

		<!--바디 (사이드바 포함 )-->
		<div class="row" style="padding-top: 50px;">
			<!--왼쪽 사이드-->
			<div class="col-sm-2 col-md-2"></div>
			<!--본문-->
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
				integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
				crossorigin="anonymous"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
				integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
				crossorigin="anonymous"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
				integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
				crossorigin="anonymous"></script>
			<div class="container"></div>

			<div class="col-sm-8 col-md-8">
				<div class="col-sm-12 col-md-12">
					<h3 style="color: rgb(216, 141, 21); text-decoration: blink;">[*햇빛
						광량에 따른 추천작물*]</h3>
					<table class="table">
						<!--<table class="table table-striped table-hover">-->
						<thead>
							<tr>
								<th>?</th>
								<th>궁금해요</th>
								<th>HoneyTip</th>
								<th>날짜</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>34</td>
								<td>가장 햇빛에 영향을 많이 받는 작물은?</td>
								<td>당근팜 농장주</td>
								<td>2021.07.05</td>
								<td>98</td>
							</tr>
							<tr>
								<td>44</td>
								<td>채광량이 정말 식물에 중요할까요?</td>
								<td>텃 밭 왕</td>
								<td>2021.07.04</td>
								<td>56</td>
							</tr>
							<tr>
								<td>29</td>
								<td>베란다에서 키우기에 좋은 추천작물을 소개합니다.</td>
								<td>베란다 농부</td>
								<td>2021.07.02</td>
								<td>33</td>
							</tr>
							<tr>
						</tbody>
					</table>
				</div>
				<div class="row" style="height: 500px;">
					<div class="col-sm-12 col-md-12"></div>
					<!--div박스 안에 차트 넣으면 됩니다.-->
					<div id="chart" class="col-sm-12 col-md-12" style="height: 800px;">
						<script src="https://d3js.org/d3.v3.min.js"></script>
						<script>

var svg = d3.select("#chart")
	.append("svg")
	.append("g")

svg.append("g")
	.attr("class", "slices");
svg.append("g")
	.attr("class", "labels");
svg.append("g")
	.attr("class", "lines");

var width = 1400,
    height = 300,
	radius = Math.min(width, height) / 2;
    
svg.append("text")
.attr("class", "sum")
.attr("transform", "translate(100, 100)")
.text("채광량(단위: umol/m2/sec)")
.style("font-size", 20);

svg.append("text")
.attr("transform", "translate(60, -20)")
.text("400")
.style("font-size", 28);

svg.append("text")
.attr("transform", "translate(-100, -20)")
.text("80")
.style("font-size", 28);

svg.append("text")
.attr("transform", "translate(-20, 90)")
.text("200")
.style("font-size", 28);




var pie = d3.layout.pie()
	.sort(null)
	.value(function(d) {
		return d.value;
	});

var arc = d3.svg.arc()
	.outerRadius(radius * 0.8)
	.innerRadius(radius * 0.4);

var outerArc = d3.svg.arc()
	.innerRadius(radius * 0.9)
	.outerRadius(radius * 0.9);

svg.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

var key = function(d){ return d.data.label; };

var color = d3.scale.ordinal()
	.domain(["상추, 케일, 적근대, 시금치, 곤드레나물, 방울토마토", "상추, 쑥갓, 청경채, 잎브로콜리, 셀러리, 잎들깨, 참나물, 돌나물", "상추, 치커리, 신선초, 미나리, 아욱, 부추, 쪽파, 달래, 생강"])
	.range(["#ffff00", "#ffcc00", "#ff9900"]);

function randomData (){
	var labels = color.domain();
	return labels.map(function(label){
		return { label: label, value: 400 }
	});
}

change(randomData());

d3.select(".randomize")
	.on("click", function(){
		change(randomData());
	});


function change(data) {

	/* ------- PIE SLICES -------*/
	var slice = svg.select(".slices").selectAll("path.slice")
		.data(pie(data), key);

	slice.enter()
		.insert("path")
		.style("fill", function(d) { return color(d.data.label); })
		.attr("class", "slice");

	slice		
		.transition().duration(1000)
		.attrTween("d", function(d) {
			this._current = this._current || d;
			var interpolate = d3.interpolate(this._current, d);
			this._current = interpolate(0);
			return function(t) {
				return arc(interpolate(t));
			};
		})

	slice.exit()
		.remove();

	/* ------- TEXT LABELS -------*/

	var text = svg.select(".labels").selectAll("text")
		.data(pie(data), key);

	text.enter()
		.append("text")
		.attr("dy", ".35em")
		.text(function(d) {
			return d.data.label;
		})
		.style("font-size", 16)
		.style("font-weight", "bold");
	
	function midAngle(d){
		return d.startAngle + (d.endAngle - d.startAngle)/2;
	}

	text.transition().duration(1000)
		.attrTween("transform", function(d) {
			this._current = this._current || d;
			var interpolate = d3.interpolate(this._current, d);
			this._current = interpolate(0);
			return function(t) {
				var d2 = interpolate(t);
				var pos = outerArc.centroid(d2);
				pos[0] = radius * (midAngle(d2) < Math.PI ? 1 : -1);
				return "translate("+ pos +")";
			};
		})
		.styleTween("text-anchor", function(d){
			this._current = this._current || d;
			var interpolate = d3.interpolate(this._current, d);
			this._current = interpolate(0);
			return function(t) {
				var d2 = interpolate(t);
				return midAngle(d2) < Math.PI ? "start":"end";
			};
		});

	text.exit()
		.remove();

	/* ------- SLICE TO TEXT POLYLINES -------*/

	var polyline = svg.select(".lines").selectAll("polyline")
		.data(pie(data), key);
	
	polyline.enter()
		.append("polyline");

	polyline.transition().duration(1000)
		.attrTween("points", function(d){
			this._current = this._current || d;
			var interpolate = d3.interpolate(this._current, d);
			this._current = interpolate(0);
			return function(t) {
				var d2 = interpolate(t);
				var pos = outerArc.centroid(d2);
				pos[0] = radius * 0.95 * (midAngle(d2) < Math.PI ? 1 : -1);
				return [arc.centroid(d2), outerArc.centroid(d2), pos];
			};			
		});
	
	polyline.exit()
		.remove();
};
</script>

						<script type="text/javascript"></script>
						<script src="https://code.jquery.com/jquery-3.6.0.min.js"
							integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
							crossorigin="anonymous"></script>

						<script>
	$.getJSON('https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=eee038bcc405e706ccb79c12e89fbd81&units=metric',
		function(result) {

	$('.ctemp').append(result.main.temp);
	$('.lowtemp').append(result.main.temp_min);
	$('.hightemp').append(result.main.temp_max);
		var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon+ 
     '.png" alt="' + result.weather[0].description + '">'
	$('.icon').html(wiconUrl);

		var ct = result.dt;

		function convertTime(t) {
			var date = new Date(t * 1000);
            //Tue Apr 06 2021 15:28:58 GMT+0900 (대한민국 표준시)
            var year = date.getFullYear();
            var month = "0" + (date.getUTCMonth() + 1);
            var day = "0" + date.getDate();
            var hour = "0" + date.getHours();
            var minute = "0" + date.getMinutes();
            var second = "0" + date.getSeconds();


            return year + '/' + month.substr(-2) + '/' + day.substr(-2) + ' ' + hour.substr(-2) + ':' +
                minute.substr(-2) + ':' + second.substr(-2);
        }
        var currentTime = convertTime(ct); //커런트타임은 컨버트타임으로 바꿔준다.파라미터는 웨더데이트
        $('.time').append(currentTime); //thistime을 convertTime으로 형변환한 weatherdate을 붙여준다.



    });
</script>

					</div>
					<div></div>
					<!--div박스 안에 차트 넣으면 됩니다.-->
				</div>

				<br>
				<div class="col-sm-12 col-md-12 ">
					<!-- 날씨.미먼 -->
					<h4>농작물에 가장 중요한</h4>
					<h2>[오늘의 날씨]</h2>
					<br>
					<h5 class="icon">
						<img alt="" src="http://openweathermap.org/img/wn/10d.png">
					</h5>
					<table class="table table-striped">
						<h4 class="time">현재 시간 :</h4>
						<h4 class="ctemp">현재 온도 (℃):</h4>
						<h4 class="lowtemp">최저 온도 (℃):</h4>
						<h4 class="hightemp">최고 온도 (℃):</h4>
					</table>
					<br> <br>

					<h2>**미세먼지**</h2>
					<br>
					<div class="progress">
						<div
							class="progress-bar progress-bar-success progress-bar-striped"
							role="progressbar" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100" style="width: 40%">
							<span class="sr-only">40% Complete (success)</span>
						</div>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-info progress-bar-striped"
							role="progressbar" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100" style="width: 20%">
							<span class="sr-only">20% Complete</span>
						</div>
					</div>
					<div class="progress">
						<div
							class="progress-bar progress-bar-warning progress-bar-striped"
							role="progressbar" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100" style="width: 60%">
							<span class="sr-only">60% Complete (warning)</span>
						</div>
					</div>
					<div class="progress">
						<div class="progress-bar progress-bar-danger progress-bar-striped"
							role="progressbar" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100" style="width: 80%">
							<span class="sr-only">80% Complete (danger)</span>
						</div>
					</div>
					<br>
					<h4 class="grade">[ 미세먼지 수치 등급 : 1- 좋음, 2- 보통, 3-나쁨, 4-매우나쁨 ]</h4>
					<br>
					<c:forEach items="${list }" begin="5" end="5" var="dto">

						<h5 class="dTime">실시간 : ${dto.dataTime }</h5>
						<h5 class="sdName">지역 : ${dto.sidoName } ${dto.stationName }</h5>
						<h5 class="khaiGrade">통합 대기 환경 지수 : ${dto.khaiGrade }</h5>
						<h5 class="pm10Grade">미세먼지 수치 : ${dto.pm10Grade } (1시간 이내)</h5>
						<h5 class="pm25Grade">초미세먼지 수치 : ${dto.pm25Grade } (1시간 이내)</h5>
					</c:forEach>

				</div>


				<div class="row">
					<div class="col-sm-12 col-md-12 ">
						<h2 style="color: gray; text-decoration: inherit;">[당근팜 추천!]
							꿀팁 영상</h2>
					</div>
					<div class="col-sm-4 col-md-4">
						<!-- 16:9 aspect ratio -->
						<div class="embed-responsive embed-responsive-16by9">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/O2PF8FmEKbg"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>

					</div>
					<div class="col-sm-4 col-md-4">
						<!-- 16:9 aspect ratio -->
						<div class="embed-responsive embed-responsive-16by9">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/vq29w5g5_8s"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>

					</div>
					<div class="col-sm-4 col-md-4">
						<!-- 16:9 aspect ratio -->
						<div class="embed-responsive embed-responsive-16by9">
							<iframe width="560" height="315"
								src="https://www.youtube.com/embed/Q9jGHZKmq-g"
								title="YouTube video player" frameborder="0"
								allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
								allowfullscreen></iframe>
						</div>

					</div>
				</div>
			</div>

			<%@include file="/WEB-INF/views/1footer.jsp"%>
</body>
</html>

