<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>

	<h1>대진이 메인 작업창</h1>
	<div id="page-content-wrapper">
		<div class="search-window">
			<input type="search" placeholder="검색어를 입력하세요."/>
			<input type="submit" value="검색" />
		</div>

        <!-- 글작성 -->
		<div class="content-container">
			<div class="timeline-insert-head">타임라인 글작성</div>
                <div class="timeline-insert-body">
                    <div class="insert-form">
                        <textarea class="form-control" cols="30" rows="10"></textarea>
                    </div>
                    <div class="insert-btn-group" role="group">
                        <button type="button" class="insert-btn">미디어</button>
                        <button type="submit" class="insert-fin">등록</button>
                    </div>         
            </div>
		</div>
        <!-- 뉴스피드 -->
        <div class="newsfeed">
            <div class="newsfeed-one">
                <div class="newsfeen-one-contents">
                    <button type="button" class="btn btn-light float-right">...</button>
                    <img src="" class="rounded-circle profile photo" width="50">
                    <a class="feed-information">아이디</a>
                    <a class="feed-information" id="insert-time">작성시간</a><br>
                    <img src="" class="user-insert-image">회원이 올린 이미지<br/>
                    <a href="#" class="feed-content" style="margin-top: 10px;">글내용<br/>
                        블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창
                        블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창
                        블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창
                        블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창
                        블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창 블라블라피드에팔로우한사람글내용나오는창   
                    </a>
                </div>
                <div align="center">
                    <div class="btn-group-comment" role="group" aria-label="Button group with nested dropdown">
                        <button type="button" class="comment-btn-secondary" data-toggle="tooltip" data-placement="top" title="좋아요">
                            <img src="">좋아요
                        </button>
                        <button type="button" class="comment-btn-secondary" data-toggle="tooltip" data-placement="top" title="답글">답글</button>
                        <button type="button" class="comment-btn-secondary" data-toggle="tooltip" data-placement="top" title="공유하기">공유하기</button>
                    </div>

                </div>
            </div>

            </div>
        </div>
	</div>

</body>
</html>