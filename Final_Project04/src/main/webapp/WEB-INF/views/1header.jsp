<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--navbar-->
    <div class="container" style="width:100%;" >
        <div class="row">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                  <!-- Brand and toggle get grouped for better mobile display -->
                  <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                      <span class="sr-only">Toggle navigation</span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                      <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><img src="resources/image/당근팜_로고_2.png" alt="배너"  style=" height: 25px; width: 100px;"></a>
                  </div>
              
                  <!-- Collect the nav links, forms, and other content for toggling -->
                  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                    <c:if test="${login == null }">
                      <li><a href="loginform.do">로컷마켓</a></li>
                      <li><a href="loginform.do">씨앗,도구 구매</a></li>
                      <li><a href="loginform.do">모두의 당근</a></li>
                      <li><a href="loginform.do">꿀팁</a></li>
                      <li><a href="loginform.do">날씨/미세먼지</a></li>
                      <li><a href="loginform.do">공지사항</a></li>
                     </c:if>
                     
                     <c:if test="${login != null }">
                      <li><a href="usermarketplace.do">로컷마켓</a></li>
                      <li><a href="adminproduct.do">씨앗,도구 구매</a></li>
                      <li><a href="mian.do">모두의 당근</a></li>
                      <li><a href="honeytip.do">꿀팁</a></li>
                      <li><a href="weather.do">날씨/미세먼지</a></li>
                      <li><a href="noticeboardlist.do">공지사항</a></li>
                     </c:if>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"title="로그인 페이지 이동" style="color:rgb(116, 116, 116)"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></span></a></li>
                        <li><a href="#" title="메인 페이지 이동" style="color:rgb(116,116,116)"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
                    </ul>
                  </div><!-- /.navbar-collapse -->
                </div><!-- /.container-fluid -->
              </nav>
        </div>
    </div>
</body>
</html>