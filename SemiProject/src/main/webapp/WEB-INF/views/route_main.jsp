<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
</head>

<body>
	<header><%@include file ="header.jsp" %></header>
	<main style="width: 70%; margin: 0 auto;">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-black">
        		<h2>나처럼 달려</h2><br><br>
	            <div id="route_buttons" style="width: 100%; height:60px; display:inline-block; align-items: center;">
    			<div style="width:150px; height:50px; display:inline-block;">
    				<form action ="/route" method="post" style=" display:inline-block">
    					<button id="routes_all" class="btn btn-success" style="width:150px;">전체보기</button>
    				</form></div>
    			<div style="width:200px; height:50px; display:inline-block;">
    				<form action ="/route_sort" method="post">
    					<button id="routes_sort" class="btn btn-success" style="width:200px;">지역별/거리별 보기</button>
    				</form></div>
    			<div style="width:150px; height:50px; display:inline-block; float:right;">
    				<form action ="/route_write" method="post">
    					<button id="route_reg" class="btn btn-success" style="width:150px;">코스등록하기</button>
    				</form></div>
    			</div>
        	</div>
		</div>
		
		<c:choose>
		<c:when test="${routeslist!=null && pageInfo.listCount>0 }">
		<div id="routes_list" style="width: 100%;">
		<c:forEach items="${routeslist }" var="route">
        <div id="route_mini" style="width: 32%; height:500px; display: inline-block; border: 1px solid gray; margin: auto 0.5%" >
            <div id="route_miniHeader">
                <span id="route_userThumb">
                	<img id="userImage" style="width:25px; height:25px;">
                </span>
                <span id="route_userName">${route.user_id }</span>
                <span id="route_uploadTime" style="float:right;">${route.route_date }</span> 
            </div>
            <div id="route_miniInfo">
                <div id="route_miniTitle" style="text"></div>
                <div id="route_miniThumbInfo">
                    <div id="routeThumbImg" style="width:100%;height:300px; display:block; margin: auto;">
                    	<div id="map" style="width:100%;height:300px; background-color:pink"></div>
                    </div>
                    <div id="route_miniContent"></div>
                </div>
            </div>
            <div id="route_miniFooter">
                <div id="route_miniFooterLeft" style="display: inline;">
                    <span><img id="route_myLike" src="https://media.istockphoto.com/vectors/red-heart-design-icon-flat-valentines-day-sign-emblem-isolated-on-vector-id1131944419?b=1&k=20&m=1131944419&s=170x170&h=X3hjbz0XmLxyxWtuSMY9rXqlI89mqk1gSvgHHOtVuYA=" style="width: 15px; height:15px;"/></span>
                    <span id="route_likes">${route.route_likes }</span>
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn6Horz4J02Of5NG7sPD2ieM6kG0ywqEJI1w&usqp=CAU" style="width:15px; height:15px;">
                    <span id="route_Replies">4</span>
                </div>
                <div id="route_miniFooterRight"style="display: inline-block; float:right">
                    <span>조회</span>
                    <span id="route_myViews">${route.route_views }</span>
                </div>
            </div>
        </div>
        </c:forEach>
    	</div>
    	
    	<div id="pageList" style="text-align: center; margin-top:30px; margin-bottom :30px;">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="route?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="route?page=${i}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="route?page=${pageInfo.page+1}">[다음]</a>
				</c:otherwise>
			</c:choose>
		</div>
		</c:when>	
		<c:otherwise>
			<section id="emptyArea">등록된 글이 없습니다.</section>
		</c:otherwise>
		</c:choose>
	</main>

    <script>
    	$(function(){
    		
    		var divs = $("#routes_list #route_mini");
    		var r =  ${routeslist};
    		console.log(r);
    		
    	});
    	
    </script>
    
	 
</body>
</html>