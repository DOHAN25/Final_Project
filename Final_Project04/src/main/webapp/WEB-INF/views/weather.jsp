<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script >
    $.getJSON('http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=eee038bcc405e706ccb79c12e89fbd81&units=metric',
            
            function(result) {
    
        $('.ctemp').append(result.main.temp);
        $('.lowtemp').append(result.main.temp_min);
        $('.hightemp').append(result.main.temp_max);
        var wiconUrl='<img src="http://openweathermap.org/img/wn/'+result.weather[0].icon+ 
            '.png" alt="' + result.weather[0].description + '">'
        $('.icon').html(wiconUrl);
            
        var ct = result.dt;
        
        function convertTime(t) {
            var ot= new Date(t * 1000);
            
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

<body>

    <h1> 날씨 미세먼지</h1>

    <div id="weather" style="text-align: center; transform: translateX(15%); color: grey;">
            
        <h5 class="time"> 현재 시간 : </h5>		
        <h5> 오늘의 날씨 </h5>						
        <h5 class="ctemp">현재 온도 (℃): </h5>
        <h5 class="lowtemp">최저 온도 (℃): </h5>
        <h5 class="hightemp">최고 온도 (℃): </h5> 
        <h5 class="icon">
        <img alt="" src="http://openweathermap.org/img/wn/10d.png">
        </h5>
        
        
        </div>
    </div>



</body>
</html>