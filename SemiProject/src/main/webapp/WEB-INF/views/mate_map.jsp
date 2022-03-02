<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
 * {
            padding: 0;
            /* margin: 0 auto; */
            box-sizing: border-box;
        }
        body{
            display: flex;
    flex-direction: column;
    justify-content: center;
        } 

        .post li {
            float: left;
            margin: 10px;
            list-style: none;
        }
              .post2 li {
            float: left;
            margin: 10px;
            list-style: none;
        }
        ul li a {
            text-decoration-line: none;
            color: black;
        }
        button a{
            text-decoration-line: none;
            color: white;
        }
        .post {
            display: inline-flex;
            /* flex-direction: column; */
            width: 1060px;
            margin-top: 51px;
            justify-content: space-between;
        }
        
        .container1 {
            display: flex;
            margin: 20px;
        }

        .register {
            width: 250px;
            height: 120px;
            padding: 8px 8px;
            background: white;
            color: #2b2e4a;
            font-size: 14px;
            /* margin: 20px; */
            box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
        }
        
        .profile {
            width: 50px;
            height: 50px;
            border-radius: 70%;
        }
        input:focus{
            outline:none;
        }
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            /* background: rgba(255, 255, 255, 0.25); */
            /* box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); */
            /* backdrop-filter: blur(1.5px); */
            /* -webkit-backdrop-filter: blur(1.5px); */
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            display: none;
        }
        .ptplist{
           display: none;
       }
        .info:hover .ptplist{
            display: block;
        }

        #modal .modal-window {
            background: rgba(69, 139, 197, 0.70);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(50px);
            /* backdrop-filter: none; */
            -webkit-backdrop-filter: blur(13.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 400px;
            height: 576px;
            /* position: relative; */
            top: -100px;
            padding: 15px;
        }

        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;

        }

        #modal .title h2 {
            display: inline;
        }

        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }

        #modal .content {
            /* margin-top: 20px; */
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        #modal2.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            /* backdrop-filter: blur(1.5px); */
            /* -webkit-backdrop-filter: blur(1.5px); */
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            display: none;
        }

        #modal2 .modal-window {
            background: rgba(69, 139, 197, 0.70);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(50px);
            /* backdrop-filter: none; */
            -webkit-backdrop-filter: blur(13.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
            width: 400px;
            /* height: 542px; */
            /* position: relative; */
            top: -100px;
            padding: 15px;
        }

        #modal2 .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;

        }

        #modal2 .title h2 {
            display: inline;
        }

        #modal2 .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }

        #modal2 .content {
            /* margin-top: 20px; */
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }

    </style>
</head>
<body>
<%@include file ="header.jsp" %>
    <div style="width: 1060px; padding: 10px; margin:20px auto;">
    <h1>메이트 구하기</h1>
    <div class="main">
        <div class="post">
            <ul>
                <li><a href="mate_main">전체</a></li>
                <li><a href="mate_search">검색</a></li>
                <li><a href="mate_map"><b>지도로 보기</b></a></li>
            </ul>
            <div style=" display: flex; float: right;align-items: center;margin-right: 55px;">
                 <button style="width: 30; height: 40px; padding: 6px 6px; margin: 7px;border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem;"><a href="mate_makemate">번개 글작성</a></button>
                <button style="width: 30; height: 40px; padding: 6px 6px; margin: 7px;border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem;"><a href="mate_makegroup">소모임 글작성</a></button>
            </div>
        </div>
    </div>
    <div style="margin: 40px;">
        <div style="float: left;">
        <div style="display: inline-block; border: 1px solid;padding: 2px;width: 210px;">
            <span><img class="search" src="images/search.png" style="width: 20px; height: 20px; float: left; margin-left: 5px;margin-top: 5px;"></span>
        <input type="text" style="width: 170px;height: 30px; margin-left: 5px; border: none;">
    </div>
    <span><img class="gps" src="images/gps.jpg" style="width: 30px; height: 30px; float: right; margin-top: 3px;"></span>
        
        <div class="post2" style="height: 50px;">
        <ul style="cursor: pointer;">
            <li><b>전체</b></li>
            <li>번개</li>
            <li>소모임</li>
        </ul>
        </div>
        <div class="register">
            <div
                style="padding: 2px;  display: flex; align-items:flex-start;justify-content: space-between;">
                <div style=" width: 150px;">
                    <span><input type="text" id="title" value="제목"
                            style="height: 35px; vertical-align: middle; font-weight: bold; font-size: 15px; border:none; background-color: white;"
                            disabled> </span>
                    <span><input type="text" id="id" value="닉네임"
                            style="height: 20px;vertical-align: middle; border:none; background-color: white;"
                            disabled> </span>
                </div>
                <div>
                    번개
                </div>
            </div>
            <div style=" vertical-align: middle;margin-top: 15px;">
                <span><img class="heart" src="images/하트.png" style="width: 20px; height: 20px; margin-top: 10px;"></span>
                <span><input type="text" id="like" value="13"
                        style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 13px; font-size: 15px; font-weight: bold; border:none; background-color: white;"
                        disabled></span>
                <button id="btn-modal"
                    style="float: right; margin-top: 10px;border:none; background-color: white;color: rgba(var(--f52,142,142,142),1); ">더
                    보기</button>
            </div>
        </div>
        <div class="register">
            <div
                style="padding: 2px;  display: flex; align-items:flex-start;justify-content: space-between;">
                <div style=" width: 150px;">
                    <span><input type="text" id="title" value="제목"
                            style="height: 35px; vertical-align: middle; font-weight: bold; font-size: 15px; border:none; background-color: white;"
                            disabled> </span>
                    <span><input type="text" id="id" value="닉네임"
                            style="height: 20px;vertical-align: middle; border:none; background-color: white;"
                            disabled> </span>
                </div>
                <div>
                    번개
                </div>
            </div>
            <div style=" vertical-align: middle;margin-top: 15px;">
                <span><img class="heart" src="images/하트.png" style="width: 20px; height: 20px; margin-top: 10px;"></span>
                <span><input type="text" id="like" value="13"
                        style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 13px; font-size: 15px; font-weight: bold; border:none; background-color: white;"
                        disabled></span>
                <button id="btn-modal2"
                    style="float: right; margin-top: 10px;border:none; background-color: white;color: rgba(var(--f52,142,142,142),1); ">더
                    보기</button>
            </div>
        </div>
        <div class="register">
            <div
                style="padding: 2px;  display: flex; align-items:flex-start;justify-content: space-between;">
                <div style=" width: 150px;">
                    <span><input type="text" id="title" value="제목"
                            style="height: 35px; vertical-align: middle; font-weight: bold; font-size: 15px; border:none; background-color: white;"
                            disabled> </span>
                    <span><input type="text" id="id" value="닉네임"
                            style="height: 20px;vertical-align: middle; border:none; background-color: white;"
                            disabled> </span>
                </div>
                <div>
                    번개
                </div>
            </div>
            <div style=" vertical-align: middle;margin-top: 15px;">
                <span><img class="heart" src="images/하트.png" style="width: 20px; height: 20px; margin-top: 10px;"></span>
                <span><input type="text" id="like" value="13"
                        style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 13px; font-size: 15px; font-weight: bold; border:none; background-color: white;"
                        disabled></span>
                <button
                    style="float: right; margin-top: 10px;border:none; background-color: white;color: rgba(var(--f52,142,142,142),1); ">더
                    보기</button>
            </div>
        </div>
    </div>
        </div>
        
        <div style="width: 640px;height: 500px; border: 1px solid; float: left;margin-left: 70px;">

        </div>
        </div>
     <!-- mateform -->
     <div id="modal" class="modal-overlay">
        <div class="modal-window">
            <div class="title">
                <input
                    style="border: none; font-size: 20px; font-weight: bold; background-color: rgba( 123, 173, 213, 0.70 ); margin-top: 20px;"
                    value="제목">
                <div class="close-area">X</div>
            </div>
            <input
                style="border: none; font-size: 15px; background-color: rgba( 123, 173, 213, 0.70 ); padding-left: 10px; margin-top: 10px; "
                value="아이디">
            <div style="font-size: 13px; float: right;">
                <span style="margin: 5px; cursor: pointer;">수정
                    <span style="margin: 5px; cursor: pointer;">삭제
                        <span style="margin: 5px; cursor: pointer;">신고
            </div>
             <input type="text" style="height: 20px; margin: 10px; border: none; font-size: 12px; background-color: rgba( 123, 173, 213, 0.70 );" value="2021.02.27 14:22:35">
            <div class="content">
                <div style="font:normal normal 400 12px/normal dotum, sans-serif; width:210px; height:200px; color:#333; position:relative"><div style="height: 200px;"><a href="https://map.kakao.com/?urlX=482233.0&amp;urlY=1132230.0&amp;name=%EC%84%9C%EC%9A%B8%20%EC%84%9C%EB%8C%80%EB%AC%B8%EA%B5%AC%20%EB%82%A8%EA%B0%80%EC%A2%8C%EB%8F%99&amp;map_type=TYPE_MAP&amp;from=roughmap" target="_blank"><img class="map" src="http://t1.daumcdn.net/roughmap/imgmap/64f8487a44c9c0785f3976c0e62d8d652a5b1890c8b57752d7e5f5d35ca02020" width="208px" height="198px" style="border:1px solid #ccc;"></a></div></div>
                <textarea style="width: 352px; height: 190px;"></textarea>
                <div 
                    style="display:flex; flex-direction: row-reverse; margin: 7px; margin-right: 0px;  float: right;position: relative;height: 32px;">
                    <div class="info" style="margin: 5px; width: 43px;">조회
                        <div class="ptplist"
                        style="position: relative; border: 1px solid; width: 200px; top: -150px; margin: 10px; background-color: #2b2e4a;">
                        <p style="font-size: 13px; margin:2px; padding: 5px;">참여자 목록</p>
                        <div style="margin: 5px;">
                            <input>
                            <input>
                            <input>
                        </div>
                    </div>
                    </div>
                    <button style="margin: 5px; width: 43px;">참여</button>
                </div>
            </div>
        </div>
    </div>
<!-- groupform -->
<div id="modal2" class="modal-overlay">
    <div class="modal-window">
        <div class="title">
            <input
                style="border: none; font-size: 20px; font-weight: bold; background-color: rgba( 123, 173, 213, 0.70 ); margin-top: 20px;"
                value="제목">
            <div class="close-area">X</div>
        </div>
        <input
            style="border: none; font-size: 15px; background-color: rgba( 123, 173, 213, 0.70 ); padding-left: 10px; margin-top: 10px; "
            value="아이디">
           
        <div style="font-size: 13px; float: right;">
            <span style="margin: 5px; cursor: pointer;">수정
                <span style="margin: 5px; cursor: pointer;">삭제
                    <span style="margin: 5px; cursor: pointer;">신고
        </div>
        <input type="text" style="height: 20px; margin: 10px; border: none; font-size: 12px; background-color: rgba( 123, 173, 213, 0.70 );" value="2021.02.27 14:22:35">
        <div class="content">
<div style="font:normal normal 400 12px/normal dotum, sans-serif; width:210px; height:200px; color:#333; position:relative"><div style="height: 200px;"><a href="https://map.kakao.com/?urlX=482233.0&amp;urlY=1132230.0&amp;name=%EC%84%9C%EC%9A%B8%20%EC%84%9C%EB%8C%80%EB%AC%B8%EA%B5%AC%20%EB%82%A8%EA%B0%80%EC%A2%8C%EB%8F%99&amp;map_type=TYPE_MAP&amp;from=roughmap" target="_blank"><img class="map" src="http://t1.daumcdn.net/roughmap/imgmap/64f8487a44c9c0785f3976c0e62d8d652a5b1890c8b57752d7e5f5d35ca02020" width="208px" height="198px" style="border:1px solid #ccc;"></a></div></div>
            
            <textarea style="width: 352px; height: 190px;"></textarea>
            <div>
            </div>
            <div
            style="display:flex; flex-direction: row-reverse; margin-top: 13px; margin-right: 0px;  float: right;position: relative;">
            <a href="#"><img class="kakao" src="images/kakao.png" style="width: 25px; height: 25px; margin-left: 13px;"></a>
            <a href="#"><img class="insta" src="images/insta.png" style="width: 25px; height: 25px;"></a>
           
            </div>
        </div>
    </div>
</div>
    <script>
            const modal = document.getElementById("modal")
        function modalOn() {
            modal.style.display = "flex"
        }
        function isModalOn() {
            return modal.style.display === "flex"
        }
        function modalOff() {
            modal.style.display = "none"
        }
        const btnModal = document.getElementById("btn-modal")
        btnModal.addEventListener("click", e => {
            modalOn()
        });
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modalOff()
        });
        modal.addEventListener("click", e => {
            const evTarget = e.target
            if (evTarget.classList.contains("modal-overlay")) {
                modalOff()
            }
        });
        window.addEventListener("keyup", e => {
            if (isModalOn() && e.key === "Escape") {
                modalOff()
            }
        });

        const modal2 = document.getElementById("modal2")
        function modalOn1() {
            modal2.style.display = "flex"
        }
        function isModalOn1() {
            return modal2.style.display === "flex"
        }
        function modalOff1() {
            modal2.style.display = "none"
        }
        const btnModal2 = document.getElementById("btn-modal2")
        btnModal2.addEventListener("click", e => {
            modalOn1()
        })
        const closeBtn2 = modal2.querySelector(".close-area")
        closeBtn2.addEventListener("click", e => {
            modalOff1()
        })
        modal2.addEventListener("click", e => {
            const evTarget2 = e.target
            if (evTarget2.classList.contains("modal-overlay")) {
                modalOff1()
            }
        })
        window.addEventListener("keyup", e => {
            if (isModalOn1() && e.key === "Escape") {
                modalOff1()
            }
        });
    </script>
     <%@include file ="fotter.jsp" %>
</body>
</html>