<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>러닝메이트</title>
	
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
		.userProfile { width:30px; height:30px; }
		.route_title { height:80px; width: 100%; border: 0px; font-size:23pt; font-weight: bold; margin-bottom: 5px;}
		.user_id { font-size : 15pt;}
		.board_time{ font-size : 10pt;}
		.boardbox { diplay:block; height:600px; }
		.editorbox { display:inline-block; float:left; width:48%; height:500px;}
		.mapsize { width: 48%; height:550px; float:right;  margin-bottom:50px; display:inline-block;  }
		.mapresult { width:100%; height:100%; position: relative; }
		
		.info-box {position: absolute; padding-left:15px; padding-top:15px; margin: 20px; width: 20%; top: 460px; background-color: #fff; }
		.ck-editor__editable { min-height: 550px; max-height: 550px;}
		input:disabled { background: white; }
	</style>
</head>
<body>
	<header><%@include file ="header.jsp" %></header>
	
	<main class="main">
	<div class="container2">
		<h2>나처럼 달려</h2>
        <p>나만의 러닝 코스를 공유해주세요!</p>
        
        <div id="routeboardHeader" class="routeboardHeader">
        	<input type="text" id="route_title" name="route_title" class="route_title" value="${route.route_title}" disabled/>
        	<img src="/profileview/${route.memberthumb }" class="userProfile">
			<span id="user_id" class="user_id">${route.user_id }</span>
			<c:if test= "${id eq route.user_id || adminCheck eq 1}">
				<span id="delete" onclick=deleteArticle() style="float:right; padding-left:10px;">삭제</span>
			</c:if>
			<c:if test="${id eq route.user_id}">
				<a href="routeModify?articleNo=${route.route_articleNo}"><span id="modify" style="float:right;">수정</span></a>
			</c:if>
			
			<br>
			<c:if test="${!empty id }">
    			<span id="alerts" onclick=alert()>
				<c:choose>
					<c:when test="${alert eq true }"><span id="alert" style="float:right; padding-left:10px;">신고취소</span></c:when>
					<c:when test="${alert eq false }"><span id="alert" style="float:right; padding-left:10px;">신고</span></c:when>
				</c:choose>
				</span>
    		</c:if>
    		
    		<span style="float:right;">${route.route_views }</span><span style="float:right;">조회</span>
			<span id="board_time" class="board_time">${route.route_date }</span>		
		</div><br><br>
		
		<div id="routeboardMain" class="boardbox">
			<div class="editorbox"><textarea id="content" name="content" style="width: 100%; " ></textarea></div>
			<div id="mapbox" class="mapsize">
				<div id="map"  class="mapresult"></div>
				<div class="info-box">
  					<p>
  						<b>거리 : ${route.route_distance } m</b><br>
   						<b>주소정보 : ${route.route_area } </b><br>
 	 				</p>
				</div>
			<div id="map" class="mapresult"></div>
			
    	</div><br><br>
    	</div>
    	<div id="routeboardFooter" class="routeboardFooter" style="display:block;">
       		<div id="likes" onclick=changeImg() style="text-align:center;">	
       			<c:if test="${!empty id }">
	    		<c:choose>
					<c:when test="${likes eq true }"><img id="like" src="${pageContext.request.contextPath }/images/like.PNG" style="width:50px; " /></c:when>
					<c:when test="${likes eq false }"><img id="like" src="${pageContext.request.contextPath }/images/nolike.PNG" style="width:50px; " /></c:when>
				</c:choose>
    			</c:if>	
			</div>
			<br><hr>
		</div>
		<input type="hidden" id="distnace_info" value="${route.route_distance }">
	</div>
	</main>
	
	
	<script>
	function deleteArticle(){
		alert = confirm('게시글을 정말 삭제하시겠습니까?');
		if(alert==true){
			window.location.href = 'http://localhost:8090/routeDelete?articleNo='+${route.route_articleNo};
		}
		else return false;
	}
	function changeImg(){
		$.ajax({
			type:"post",
			url:"http://localhost:8090/likes",
			data: {"user_id": $("#user_id").text(), "board_type" : "route", "board_no": ${route.route_articleNo}},
			dataType:"text",
			success:function(data){
				if(data=="true"){
					$("#like").attr("src", "${pageContext.request.contextPath }/images/like.PNG");
				} else {
					$("#like").attr("src", "${pageContext.request.contextPath }/images/nolike.PNG");
				}
			}
		});			 
	}
	function alert(){
		var alert;
		if($("#alerts span").html() == "신고"){
			 alert = confirm('정말 게시글을 신고하시겠습니까?');
		}
		else if($("#alerts span").html() == "신고취소"){
			 alert = confirm('게시글을 신고를 취소하시겠습니까?');
		}
		
		if(alert==true){
			$.ajax({
				type:"post",
				url:"http://localhost:8090/alert",
				data: {"user_id": $("#user_id").text(), "board_type" : "route", "board_no": ${route.route_articleNo}},
				dataType:"text",
				success:function(data){
					if(data=="true"){
						$("#alerts span").html("신고취소");
					} else {
						$("#alerts span").html("신고");
					}
				}
			});
		}
	}
	</script>
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
    	
    	//var distance= $("#distnace_info").val();
    	//const directions = document.getElementById('directions');
    	//directions.innerHTML = `<p><strong>Trip duration: min.</strong></p>`;
    	
	});
	
	function getInstructions(data) {
		// Target the sidebar to add the instructions
		const directions = document.getElementById('directions');
		let tripDirections = '';
		// Output the instructions for each step of each leg in the response object
		for (const leg of data.legs) {
		const steps = leg.steps;
		for (const step of steps) {
		tripDirections += `<li>${step.maneuver.instruction}</li>`;
		}
		}
		directions.innerHTML = `<p><strong>Trip duration: ${Math.floor(
		data.duration / 60
		)} min.</strong></p><ol>${tripDirections}</ol>`;
		}
	</script>
	

</body>
</html>