<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>러닝메이트</title>
	
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    
    <style>
    	.main { width: 70%; margin: 0 auto; }
		.container2 { max-width:1024px; margin:30px auto;}
		.writebtn { text-align: right;  display:inline-block; float:right; margin-right:10%; }
		.routebtns { width: 100%; height:60px; display:inline-block; align-items: center; margin-top:50px; margin-bottom:50px; }
		.routebtn { width:150px; height:50px; display:inline-block; }
		.route_mini { width: 30%; height:500px; display: inline-block; border: 1px solid gray; border-radius: 13px; margin: 15px 0.5% 15px 0.5%; }
		.route_miniTitle { margin-top: 5px; margin-bottom: 10px; font : 18px bold; text-overflow: ellipsis; width: 100%; border: 0px;  }
		.userProfile { width:25px;; height:25px; }
		.routeThumbImg { width:100%;height:300px; display:block; margin: auto; }
		.route_miniHeader { margin: 10px 5% 10px 2%; }
		.route_miniInfo { padding-left:10px; padding-right:10px; } 
		.route_miniFooter { display: inline-block;  margin: 10px 5% 10px 4%; }
		input:disabled { background: white; }
		
		a:link { color:black; text-decoration: none;}
     	a:visited { color: black; text-decoration: none;}
	 	a:hover { color: black; text-decoration: none;}
	</style>
</head>

<body>
	<header>
		<%@include file ="header.jsp" %>
		<%@include file ="slides.jsp" %>
    </header>
   	
   	<main class="main">
	<div class="container2">
		<h2>나처럼 달려</h2>
		<div id="route_buttons" class="routebtns">
			<div class="routebtn">
    			<form action ="/route" method="post" >
    				<button id="routes_all" class="btn btn-success" style="width:150px;">전체보기</button>
    			</form>
    		</div>
    		<div class="routebtn">
    			<form action ="/route_sort" method="post">
    				<button id="routes_sort" class="btn btn-success" style="width:200px;">지역별/거리별 보기</button>
    			</form>
    		</div>
    		<div class="writebtn">
    			<form action ="/route_write" method="post">
    				<c:if test="${!empty id }">
    					<button id="route_reg" class="btn btn-success" style="width:150px; ">코스등록하기</button>
    				</c:if>
    			</form>
    		</div>
		</div>
		
		<c:choose>
			<c:when test="${routesinfolist!=null && pageInfo.listCount>0 }">
			<div id="routes_list">
				<c:forEach items="${routesinfolist }" var="route">
					<a href="routepost?articleNo=${route.route_articleNo}">
					<div id="route_mini" class="route_mini">
            			<div id="route_miniHeader" class="route_miniHeader">
                			<img src="/profileview/${route.memberthumb }" style="width:27px; height:27px; border-radius:70%;" onerror="this.src='/profile/profile.png'" id="userImage" class="userProfile">
                			<span id="route_userName">${route.user_id }</span>
                			<span id="route_uploadTime" style="float:right;">${route.route_date }</span> 
           				 </div>
            			<div id="route_miniInfo" class="route_miniInfo">
            				<input type="text" id="route_title" name="route_title" class="route_miniTitle" value='${route.route_title }' disabled/>
                			<div id="route_miniThumbInfo">
              					<img src="/routethumbfileview/${route.route_thumb }" id="routeThumbImg" class="routeThumbImg">
                    			<div id="route_miniContent"></div>
                			</div>
            			</div>
           				<div id="route_miniFooter" >
                			<div id="route_miniFooterLeft" class="route_miniFooter" >
                    			<img src="${pageContext.request.contextPath }/images/like.PNG" class="userProfile" />
                    			<span id="route_likes">${route.route_likes }</span>
                    			<img src="${pageContext.request.contextPath }/images/reply.PNG" class="userProfile" />
                   				<span id="route_Replies">4</span>
                			</div>
               	 			<div id="route_miniFooterRight" class="route_miniFooter" style="float:right;" >
                    			<span>조회</span>
                    			<span id="route_myViews">${route.route_views }</span>
                			</div>
           			 	</div>
        			</div>
        			</a>
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
	</div>
	</main>
	 
	 <%@include file="fotter.jsp"%>
</body>
</html>