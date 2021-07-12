<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 </title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!--jquery (부트스트랩의 자바스트립트 플러그인을 위해 필요합니다.)-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
        h3{
            text-align: center;
        }
        th{
            text-align: center;
        }
        tr{
            text-align: center;
        }
         .img-circle{
             margin-bottom:50px;
         }
         
         #id{
             font-size: 30px;
             font-weight:lighter; 
         }
         #panel-margin{
             margin-top: 0px;
             margin-bottom: 0px;
         }

         
         
    </style>
</head>
<body>
<%@include file ="/WEB-INF/views/1header.jsp" %>
    <div class="container" style="width: 100%;">
        
        <!--바디 (사이드바 포함 )-->
        <div class="row" style="padding-top:50px;">
            <!--왼쪽 사이드-->
            <div class="col-sm-3 col-md-3" >
            </div>
            <!--본문--> 
            <div class="col-sm-6 col-md-6 ">
                
                <div class="row">
                    <div class="col-md-3"><img src="https://via.placeholder.com/150" alt="프로필 이미지" class="img-circle img-responsive"></div>
                    <div class="col-md-9">
                        <span id="id">아이디</span>
                        <p style="padding-top:20px; ">자기소개 글 </p>
                        <button type="button" class="btn btn-default btn-sm" onclick="location.href='userUpdate.do'">개인정보 수정 </button>
                    </div>
                </div>

                
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                    <div class="panel panel-default">
                      <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            <h3 id="panel-margin">주문내역</h3>
                          </a>
                        </h4>
                      </div>
                      <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <th>상품명</th>
                                    <th>결제금액</th>
                                    <th>주소</th>
                                    <th>구매일자</th>
                                    <th></th>
                                    
                                </tr>
                                <tr>
                                    <td>싱싱한 당근</td>
                                    <td>3,000</td>
                                    <td>서울시 강남구 남도빌딩</td>
                                    <td>2020.02.02</td>
                                    <td><button type="button" class="btn btn-default">필요시 사용</button></td> 
                                </tr>
                                
                            </table>
                        </div>
                      </div>
                    </div>
                    <div class="panel panel-default">
                      <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                          <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <h3 id="panel-margin">채팅내역</h3>
                          </a>
                        </h4>
                      </div>
                      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <th>날짜</th>
                                    <th>게시글 제목</th>
                                    <th>상대방 id </th>
                                    <th></th>
                                    
                                </tr>
                                <tr>
                                    <td>2020.02.02</td>
                                    <td>호미 판매합니다~</td>
                                    <td>앨리스</td>
                                    <td><button type="button" class="btn btn-default">필요시 사용</button></td> 
                                </tr>
                                
                            </table>
                        </div>
                      </div>
                    </div>
                    
                  </div>







                
                
            </div>
            <!--오른쪽 사이드-->
            <div class="col-sm-3 col-md-3 " >
            </div>
        </div>
    </div>
    <%@include file ="/WEB-INF/views/1footer.jsp" %>
</body>
</html>