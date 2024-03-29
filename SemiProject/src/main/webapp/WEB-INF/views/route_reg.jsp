<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

	<!-- zag bootstrap -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">
    <link rel="apple-touch-icon" href="/assets/img/apple-icon.png">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

	<!-- ckeditor5 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
	<style>
		.ck-editor__editable {
			min-height: 550px;
			min-width: 300px;
		}
		.ck.ck-reset.ck-editor.ck-rounded-corners {
    		width: 100%;
		}
	</style>
	
	<!-- mapbox -->
	<script src="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js"></script>
	<link href="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css" rel="stylesheet"/>
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.js"></script>
	<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.css" type="text/css" />
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.2/mapbox-gl-geocoder.min.js"></script>
	<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css" type="text/css">
	<style>
		.main { width: 70%; margin: 0 auto; }
		.container2 { max-width:1024px; margin:30px auto;}
		.routeboardHeader { border-bottom: 1px solid gray; padding-bottom:20px; }
		.userProfile { width:25px; height:25px; }
		.route_title { height:80px; width: 100%; border: 0px; font-size:23pt; font-weight: bold; margin-bottom: 5px;}
		.deletetag { float:right; padding-left:10px; } 
		.boardbox { diplay:block; height:580px; }
		.editorbox { display:inline-block; float:left; width:48%; height:500px;}
		.mapresult { width: 48%; height:550px; margin-bottom:50px; display:inline-block; float:right; }
		.listbtn { width:15%; display:inline-block; }
		input:disabled { background: white; }
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
        <p>나만의 러닝 코스를 공유해주세요!</p>
        
        <div id="routeboardHeader" class="routeboardHeader">
        	<input type="text" id="route_title" name="route_title" class="route_title" value="${route.route_title}" disabled/>
        	<img src="/profileview/${profileImg }" class="userProfile">
			<span id="user_id">${route.user_id }</span>
			<span id="board_time">${route.route_date }</span>
			<c:if test= "${id eq route.user_id }">
				<a href="routeDelete?articleNo=${route.route_articleNo}" onclick="return confirm('정말 게시글을 삭제하시겠습니까?')"><span id="delete" class="deletetag">삭제</span></a>
				<a href="routeModify?articleNo=${route.route_articleNo}"><span id="modify" style="float:right;">수정</span></a>
			</c:if><br>
			
		</div><br><br>
		
		<div id="routeboardMain" class="boardbox">
			<div class="editorbox"><textarea id="content" name="content" style="width: 100%; " ></textarea></div>
			<div id="map" class="mapresult"></div>
    	</div><br><br>
    	
       	<div style="text-align:center; margin-top:20px; margin-bottom:20px;">
    		<form action ="/route" method="post" ><button class="listbtn btn btn-dark">목록</button></form>
		</div>
    	
    </div>
	</main>

	<%@include file="fotter.jsp"%>
	
	<script>
	$(function(){
		ClassicEditor.create(document.querySelector("#content"))
    	.then(editor=>{
    		window.editor = editor;
    	    editor.isReadOnly = true;
    	    const toolbarElement = editor.ui.view.toolbar.element;
    	    toolbarElement.style.display = 'none';
        	editor.setData('${route.route_content }');
        })
	    .catch((error) => {
    	   	console.error(error);
	    });
	});
	</script>	
	<script>	
	$(function(){
		var route_center = ${route.route_center };
		mapboxgl.accessToken = 'pk.eyJ1IjoidmhxbHRrZmtkMjQiLCJhIjoiY2wwMDZ3eG92MDA2MzNjcnlpNmEzN3YydCJ9.eu7sOlz2memREpbstyzmjA';
		const map = new mapboxgl.Map({
			container: 'map', // Specify the container ID
		    style: 'mapbox://styles/mapbox/streets-v11', // Specify which map style to use
		    center: [route_center.longitude,route_center.latitude], // Specify the starting position
		    zoom: 14.5, // Specify the starting zoom
		});
		
		var mapinfo = ${route.route_mapinfo};
		if (map.getLayer('route')) {
			map.removeLayer('route');
		}
		if (map.getSource('route')) {
			map.removeSource('route');
		}
		
		const draw = new MapboxDraw({
    		displayControlsDefault: false,
    		defaultMode: 'draw_line_string',
    		styles:[
    			{
    	    		id: 'route',
    	      		type: 'line',
    	      		source: {
    	    	    	type: 'geojson',
    	    	        data: {
    			        	type: 'Feature',
    		          		properties: {},
    	    	      		geometry: mapinfo
    	        		}
    	      		},
    		      	layout: {
    		        	'line-join': 'round',
    		        	'line-cap': 'round'
    		      	},
    	    	  	paint: {
    		    	    'line-color': '#03AA46',
    		        	'line-width': 8,
    			        'line-opacity': 0.8
    			    }
    			}
    		]
    	});
    	map.addControl(draw);
	});
	</script>
	
</body>
</html>