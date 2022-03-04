<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>

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
		
		<div id="routes_list" style="width: 100%; height:500px;">
        <div id="route_mini" style="width: 32%; height:500px; display: inline-block; border: 1px solid gray; margin: auto 0.5%">
            <div id="route_miniHeader">
                <span id="route_userThumb">
                	<img id="userImage" style="width:25px; height:25px;">
                </span>
                <span id="route_userName"></span>
                <span id="route_uploadTime" style="float:right;"></span> 
            </div>
            <div id="route_miniInfo">
                <div id="route_miniTitle" style="text"></div>
                <div id="route_miniThumbInfo">
                    <img id="routeThumbImg" style="width:100%;height:300px; display:block; margin: auto;"/>
                    <div id="route_miniContent">간단한설명</div>
                </div>
            </div>
            <div id="route_miniFooter">
                <div id="route_miniFooterLeft" style="display: inline;" style="background-color:black ;">
                    <span><img id="route_myLike" src="https://media.istockphoto.com/vectors/red-heart-design-icon-flat-valentines-day-sign-emblem-isolated-on-vector-id1131944419?b=1&k=20&m=1131944419&s=170x170&h=X3hjbz0XmLxyxWtuSMY9rXqlI89mqk1gSvgHHOtVuYA=" style="width: 15px; height:15px;"/></span>
                    <span id="route_likes">3</span>
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTn6Horz4J02Of5NG7sPD2ieM6kG0ywqEJI1w&usqp=CAU" style="width:15px; height:15px;">
                    <span id="route_Replies">4</span>
                </div>
                <div id="route_miniFooterRight"style="display: inline-block; float:right">
                    <span>조회</span>
                    <span id="route_myViews">3</span>
                </div>
            </div>
        </div>
    </div>
	</main>

    <script>
    	$(function(){ 
    		function downloadURI(uri, name){
			      var link = document.createElement("a")
			      link.download = name;
			      link.href = uri;
			      document.body.appendChild(link);
			      link.click();
			 }
    		$("#routes_all").click(function(){
    			var cloneElements = $("#route_mini").clone();
         		cloneElements.appendTo("#routes_list");
         		console.log("click");
         		
         		html2canvas($("#routes_list")[0]).then(function(canvas){
			          var myImage = canvas.toDataURL();
			          downloadURI(myImage, "route2.png");
			          console.log("route1.png 저장!");
			     });
				
    		});
    	});
    	
    </script>
    
	 
</body>
</html>