<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${not empty login }">

		<div>${login.userid}님의 피드입니다.</div>
		
	</c:if>
	<c:if test="${empty login }">
		<div>로그인해주세요</div>
	</c:if>

</body>
</html>