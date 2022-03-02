<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/main.js"></script>

    <title>글 상세페이지</title>
    <%@include file ="header.jsp" %>
<%@include file ="slides.jsp" %>
</head>
<body>
    <!-- 내용 -->
    <section class="a123">
        <div class="fb_detail">
            <div class="detail_title">
                <h2>글 제목</h2>
                <div class="detail_writer"><a href="#"><img src="images/마이페이지.PNG" width="20px" height="20px"
                            alt="" /></a>작성자</div>
                <input type="button" id="edit" class="modify"  value="수정" onclick="location.href='fb_modify'"/>
                <input type="button" id="delete" class="delete"  value="삭제"/>
                <div>
                    <div id="detail_time">1시간 전</div>
                    <button class="warning"
                        onclick="location.href='warning?fb_articleNo=${data.fb_articleNo}'">신고</button>
                </div>
                <div>
                    <label id="detail_view">조회: 2</label>
                </div>
            </div>
        </div>
    
    <div id="line">
        <hr style="border:1px color= silver;" width="100%">
        <textarea style="width: 100%; height: 50em;" >내용</textarea>

    </div>
    <input type="button" id="list" class="btn" onclick="location.href='main'" value="목록"/>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $("#list").on("click", function(){
                    location.href = "openBoardList.do";
                });

                $("#edit").on("click", function(){
                    var frm = $("#frm")[0];
                    frm.action = "updateBoard.do";
                    frm.submit();
                });

                $("#delete").on("click", function(){
                    var frm = $("#frm")[0];
                    frm.action = "deleteBoard.do";
                    frm.submit();
                });
            })
        </script>
</section>
<%@include file ="fotter.jsp" %>
</body>
</html>