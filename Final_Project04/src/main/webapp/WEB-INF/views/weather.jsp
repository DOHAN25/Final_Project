<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Weather Api</title>
</head>

<body>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script>
		$.getJSON('api.openweathermap.org/data/2.5/weather?q=Seoul&appid=eee038bcc405e706ccb79c12e89fbd81',function(result) {

							$('.ctemp').append(result.main.temp);
							$('.lowtemp').append(result.main.temp_min);
							$('.hightemp').append(result.main.temp_max);
							var wiconUrl = '<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon+ 
            '.png" alt="' + result.weather[0].description + '">'
							$('.icon').html(wiconUrl);

							var ct = result.dt;

							function convertTime(t) {
								var ot = new Date(t * 1000);

								var hr = ot.getHours();
								var m = ot.getMinutes();
								var s = ot.getSeconds();

								return ot;

								//return hr + ':' + m + ':'+ s
							}

							var currentTime = convertTime(ct);
							$('.time').append(currentTime);

						});
	</script>


	<h1>날씨 미세먼지</h1>

	<div id="weather"
		style="text-align: center; transform: translateX(15%); color: gray;">

		<h5 class="time">현재 시간 :</h5>
		<h5>오늘의 날씨</h5>
		<h5 class="ctemp">현재 온도 (℃):</h5>
		<h5 class="lowtemp">최저 온도 (℃):</h5>
		<h5 class="hightemp">최고 온도 (℃):</h5>
		<h5 class="icon">
			<img alt="" src="http://openweathermap.org/img/wn/10d.png">
		</h5>


	</div>



</body>
</html>