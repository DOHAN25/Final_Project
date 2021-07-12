<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!--jquery (부트스트랩의 자바스트립트 플러그인을 위해 필요합니다.)-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>
svg {
	width: 100%;
	height: 100%;
}

path.slice{
	stroke-width:2px;
}

polyline{
	opacity: .3;
	stroke: black;
	stroke-width: 2px;
	fill: none;
}

</style>

<body>
    
    <div class="container" style="width: 100%;">
        
        <!--바디 (사이드바 포함 )-->
        <div class="row" style="padding-top:50px;">
            <!--왼쪽 사이드-->
            <div class="col-sm-2 col-md-2" >
            </div>
            <!--본문--> 
            <div class="col-sm-8 col-md-8">
                <div class="row" style="height: 500px;">
                    <div class="col-sm-12 col-md-12">
                        <h3>차트 제목 작성칸</h3>
                    </div>
                    <!--div박스 안에 차트 넣으면 됩니다.-->
                    <div id="chart" class="col-sm-12 col-md-12" style="height:800px;">
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

var width = 1600,
    height = 500,
	radius = Math.min(width, height) / 2;
    
svg.append("text")
.attr("class", "sum")
.attr("transform", "translate("+(width/2)+","+(height/3)+")")
.text("채광량(단위: umol/m2/sec)");





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
	.domain(["상추, 케일, 적근대, 시금치, 곤드레나물, 방울토마토", "상추, 쑥갓, 청경채, 잎브로콜리, 셀러리, 잎들깨, 참나물, 돌나물", " 오크상추, 치커리, 신선초, 미나리, 아욱, 부추, 쪽파, 달래, 생강"])
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
		});
	
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
                    
                    </div>

                    <!--div박스 안에 차트 넣으면 됩니다.-->
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-12 ">
                        <h3>꿀팁 영상</h3>
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <!-- 16:9 aspect ratio -->
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/O2PF8FmEKbg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <!-- 16:9 aspect ratio -->
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/vq29w5g5_8s" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        
                    </div>
                    <div class="col-sm-4 col-md-4">
                        <!-- 16:9 aspect ratio -->
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe width="560" height="315" src="https://www.youtube.com/embed/Q9jGHZKmq-g" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                        
                    </div>
                </div>
            </div>
            <!--오른쪽 사이드-->
            <div class="col-sm-2 col-md-2">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="http://bootstrapk.com/components/#responsive-embed"title="로그인" style="color:rgb(116, 116, 116)"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></a></li>
                    <li><a href="#" title="로그아웃" style="color:rgb(116,116,116)"><span class="glyphicon glyphicon-log-out" aria-hidden="true"></span></a></li>
                    <li><a href="#"title="회원가입" style="color:rgb(116, 116, 116)"><span class="glyphicon glyphicon-registration-mark" aria-hidden="true"></span></span></a></li>
                    <li><a href="#" title="마이페이지" style="color:rgb(116,116,116)"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>

                </ul>
            </div>
</body>
</html>