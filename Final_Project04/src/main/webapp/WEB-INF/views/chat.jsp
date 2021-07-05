<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
</head>
<script type="text/javascript">
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('')
	});

	let sock = new SockJS("http://localhost:8787/controller/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send($("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		$("#messageArea").append(data + "<br/>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");

	}
</script>
<body>


<c:if test="${messageList == null }">

	<div id="messageArea">
			<br>
			<div>대화를 시작해 보세요. 욕설과 비속어 사용은 금지되어있습니다. 매너를 지켜 주세요.</div>
	</div>

	<input type="text" id="message" />
	
	<input type="button" id="sendBtn" value="submit"/>
</c:if>

<c:if test="${messageList != null }">
	
	<div id="messageArea">
			<label>"${messageList.sender }"</label>
			<br>

	</div>

	<input type="text" id="message" />
	
	<input type="button" id="sendBtn" value="submit"/>


</c:if>

</body>
</html>