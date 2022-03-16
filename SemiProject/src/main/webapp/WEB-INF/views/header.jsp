<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/templatemo.css">
    <link rel="stylesheet" href="assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
	
</head>
<body>
 <!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:1석4조@mulcam.com">mailto:1석4조@mulcam.com</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-1234-5678">010-1234-5678</a>
                </div>
                <div>
                    <a class="text-light" href="https://fb.com/templatemo" target="_blank" rel="sponsored"><i class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://twitter.com/" target="_blank"><i class="fab fa-twitter fa-sm fa-fw me-2"></i></a>
                    <a class="text-light" href="https://www.linkedin.com/" target="_blank"><i class="fab fa-linkedin fa-sm fa-fw"></i></a>
                </div>
            </div>
    </nav>
    <!-- Close Top Nav -->

<div id="nav-container">
        <nav class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">
            <a class="navbar-brand text-success logo h1 align-self-center" href="main">
                Run
            </a>
            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
            <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                <li class="nav-item"><a class="nav-link" href="/mate_main">메이트구하기</a></li>
                <li class="nav-item"><a class="nav-link" href="/today">오늘의러닝</a></li>
                <li class="nav-item"><a class="nav-link" href="/route">코스공유</a></li>
                <li class="nav-item"><a class="nav-link" href="/fb_main">자유게시판</a></li>
            </ul>
            </div>
            
            <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    
                    
                    <a class="nav-icon d-none d-lg-inline" href="#" data-bs-toggle="modal" data-bs-target="#templatemo_search">
                        <i class="fa fa-fw fa-search text-dark mr-2"></i>
                    </a>
				<c:choose>
		          	<c:when test="${empty id}">
	                    <a class="nav-icon position-relative text-decoration-none" href="login">
	                        <i class="">로그인</i>
	                    </a>
	                    <a class="nav-icon position-relative text-decoration-none" href="join">
                        	<i class="">회원가입</i>
                   		</a>
                    </c:when>
                        
	                    
	                    <c:when test="${adminCheck == 0 }">
		                    <a class="nav-icon position-relative text-decoration-none" href="logout">
		                        <i class="">로그아웃</i>
		                    </a>
                        	<a class="nav-icon position-relative text-decoration-none" href="mypage">
                        		<i class="fa fa-fw fa-user text-dark mr-3"></i>
                        		<span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+2</span>
                   			</a>
                   		</c:when>
		          		<c:otherwise>
		          			<a class="nav-icon position-relative text-decoration-none" href="logout">
	                        	<i class="">로그아웃</i>
	                    	</a>
	                   		<a class="nav-icon position-relative text-decoration-none" href="memberlist">
                        		<i class="fa fa-fw fa-user text-dark mr-3"></i>
                        		<span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">+2</span>
                   			</a>
                    	</c:otherwise>
               </c:choose>
	          	
                    
                </div>
            
            </div>
            <div class="clear"></div>
            </div>
        </nav>
        
    </div>
    
</body>
</html>