<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
        table{
            text-align: center;
        }
        
        
    </style>
</head>
<body>

    
    <div class="container" style="width: 100%;">
        
        <!--바디 (사이드바 포함 )-->
        <div class="row" style="padding-top:50px;">
            <!--왼쪽 사이드-->
            <div class="col-sm-3 col-md-3" >
            </div>
            <!--본문--> 
            <div class="col-sm-6 col-md-6 ">
                <table class="table table-hover">
                    <tr>
                        <td>글번호</td>
                        <td>등록일자</td>
                        <td>제목</td>
                        <td>유저아이디</td>
                        <td>조회수</td>
                    </tr>
                    <tr class="active ">
                        <td>1</td>
                        <td>2020.07.07</td>
                        <td >관리자 공지사항 만약 지울거면 그냥 이부분지우면된다능 !
                            <span class="label label-danger" style="margin-left:10px;">공지사항</span>
                        </td>
                        <td>관리자</td>
                        <td>34</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>2020.07.07</td>
                        <td>제가키운 당근 보세요~~</td>
                        <td>앨리스</td>
                        <td>3</td>
                    </tr>
                  </table>
            </div>
            <!--오른쪽 사이드-->
            <div class="col-sm-3 col-md-3 " >
            </div>
        </div>
    </div>
    
    
</body>
</html>