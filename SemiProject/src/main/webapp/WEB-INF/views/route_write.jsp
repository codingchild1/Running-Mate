<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<!-- mapbox -->
	<script src="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js"></script>
	<link href="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css" rel="stylesheet"/>
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.js"></script>
	<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.css" type="text/css" />
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.2/mapbox-gl-geocoder.min.js"></script>
	<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css" type="text/css">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6a41b354b6f502722e91503736b4d238&libraries=services"></script>
	

	<!-- 넓이 높이 조절 -->
	<style>
	#map {
        top: 0;
        bottom: 0;
        height: 500px;
      }
	.ck-editor__editable {
		max-width:100%;
	    min-height: 500px;
	}
	</style>
</head>
<body>
	<header><%@include file ="header.jsp" %></header>
	<main style="width: 70%; margin: 0 auto;">
		<div class="row align-items-center py-3">
			<div class="col-md-8 text-black">
        		<h2>나처럼 달려</h2>
            	<p>나만의 러닝 코스를 공유해주세요!</p>
        	</div>
		</div>
		<div><form id="route_write" action="/route_reg" method="post" enctype="multipart/form-data">
			<div id="user_info" style="height:80px; display: flex; align-items: center;">
				<div style="height:40px; width:40px; overflow:hidden;">
					<!-- 썸네일 이미지 -->
					<img id="thumb_img"
						src="https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg"
						style="width:100%; object-fit:cover;">
				</div>
				<!-- 사용자 ID -->
				<div id="user_id" style="height:40px; display:inline-block; line-height: 40px; padding-left : 10px;" >${id}</div>
			</div>
			<!-- 글 제목 -->
			<input type="text" id="route_title" name="route_title" class="form-control mt-1" value="제목"/><br>
			
			<img class="col" src="" id="route_thumb" name="route_thumb" height="100px" width="100px">
			<input type="file" id="route_file" name="route_file" />
			
			<!-- ckeditor -->
			<textarea id="editor" name="content"></textarea><br>
			
			<p id="test">코스를 그려주세요</p>
			<div id="map""></div>
			
			<input type="hidden" id="form_user_id" name="user_id">
			<input type="hidden" id="route_center" name="route_center">
			<input type="hidden" id="route_area" name="route_area">
			<input type="hidden" id="route_mapinfo" name="route_mapinfo">
			<input type="hidden" id="route_distance" name="route_distance">
			
			<div style="text-align:center; margin-top:20px; margin-bottom:20px;">
				<button id="submit" style="width:15%; display:inline-block;" class="btn btn-dark">등록</button>
				<button id="reset" type="reset" style="width:15%; display:inline-block;" class="btn btn-dark">취소</button>
			</div>
		</form></div>
	</main>

	<script>
		$(function(){
        	ClassicEditor
        		.create(document.querySelector("#editor"), {
	        		ckfinder : {
    	    			uploadUrl : "/upload"
        			}
        		}).then(editor=> {
	        		window.editor=editor;
    	    	})
        		.catch((error) => {
        			console.error(error);
 	       	});
		});
	</script>
	
	<script>
	$(function(){
		$("#route_file").change(function (event) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#route_thumb").attr("src", e.target.result);	
				console.log($("#route_thumb").src);
			};
			reader.readAsDataURL(event.target.files[0]);
		});
	
		/*var geocoder = new kakao.maps.services.Geocoder();
		
		var callback = function(result, status){
			if (status === kakao.maps.services.Status.OK) {
				//console.log('지역 명칭 : ' + result[0].address_name);
			   	//console.log('행정구역 코드 : ' + result[0].code);
			   	for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		              	//areaName = result[i].address_name;
		            	//return JSON.stringify(result[i].address_name);
		            	break;
		     	}
			}
		};
		
		function searchAddrFromCoords(longitude, latitude, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		    geocoder.coord2RegionCode(longitude, latitude, callback);
		    return callback;
		}
		var areaName = "";
		function displayCenterInfo(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        for(var i = 0; i < result.length; i++) {
		            // 행정동의 region_type 값은 'H' 이므로
		            if (result[i].region_type === 'H') {
		              	//areaName = result[i].address_name;
		            	return JSON.stringify(result[i].address_name);
		            	break;
		            }
		        }
		    }    
		}
		*/
		$("#submit").click(function(){	
			/*console.log(geocoder.coord2RegionCode(center_lo, center_la, callback));
			alert("2");
			alert(areaName);
			console.log(center_lo +", "+ center_la);
			*/
			/*
			geocoder.coord2RegionCode(center_lo, center_la, callback);
			
			var geocoder = new kakao.maps.services.Geocoder();
			var callback = function(result, status) {
			    if (status === kakao.maps.services.Status.OK) {
			        for(var i = 0; i < result.length; i++) {
			            // 행정동의 region_type 값은 'H' 이므로
			            if (result[i].region_type === 'H') {
			              	//areaName = result[i].address_name;
			            	//return JSON.stringify(result[i].address_name);
			            	alert("1");
			            	alert(result[i].address_name);
			            	//break;
			            }
			     	}
			    }
			};
			alert("2");
			alert(callback[0].address_name);
			alert(JSON.stringify(callback[0].address_name));
			
			$("#form_user_id").attr("value", $("#user_id").html());
			$("#route_center").attr("value", JSON.stringify({"latitude" : center_la, "longitude" : center_lo}));
			//$("#route_area").attr("value", areaName);
			
		    $("#route_area").attr("value", areaName);		               
			
			$("#route_mapinfo").attr("value", JSON.stringify(mapinfo.matchings[0].geometry));
			$("#route_distance").attr("value", mapinfo.matchings[0].distance);
			*/
			
			$.ajax({
				async:false,
				type:"post",
				url:"http://localhost:8090/route/routeCoords",
				traditional:true,
				data: {"longitude" : center_lo, "latitude" : center_la},
				dataType:"text",
				success:function(data){
					
					$("#form_user_id").attr("value", $("#user_id").html());
					$("#route_center").attr("value", JSON.stringify({"latitude" : center_la, "longitude" : center_lo}));
					$("#route_area").attr("value", data);
					$("#route_mapinfo").attr("value", JSON.stringify(mapinfo.matchings[0].geometry));
					$("#route_distance").attr("value", mapinfo.matchings[0].distance);
					//alert($('#route_thumb').src());
					
					$("#route_write").submit();
				}, error: function (e) { 
					console.log("ERROR : ", e); 
				}
			});
			
		});
		
		var mapinfo = {};
		var center_lo, center_la;
		mapboxgl.accessToken = 'pk.eyJ1IjoidmhxbHRrZmtkMjQiLCJhIjoiY2wwMDZ3eG92MDA2MzNjcnlpNmEzN3YydCJ9.eu7sOlz2memREpbstyzmjA';
		navigator.geolocation.getCurrentPosition(function(pos) {	// 현재 위치 정보 얻기
		    var latitude = pos.coords.latitude;
		    var longitude = pos.coords.longitude;
		    getMap(longitude, latitude);
		});
		
		function getMap(longitude, latitude){
			const map = new mapboxgl.Map({
		    	container: 'map', // Specify the container ID
		      	style: 'mapbox://styles/mapbox/streets-v11', // Specify which map style to use
		      	center: [longitude, latitude], // Specify the starting position
		      	zoom: 14.5, // Specify the starting zoom
		    });
			
		    map.addControl(
		    	new MapboxGeocoder({
		    		accessToken: mapboxgl.accessToken,
		    		zoom: 14.5,
		    		placeholder: '지역검색',
		    		mapboxgl: mapboxgl,
		    		reverseGeocode: true
		    	})
		    );
			
			// mapbox draw 기능!
		    const draw = new MapboxDraw({
		    	displayControlsDefault: false,		// Instead of showing all the draw tools, show only the line string and delete tools.
		    	controls: {
		    		line_string: true,
		    	    trash: true
		    	},	
		    	defaultMode: 'draw_line_string',	// Set the draw mode to draw LineStrings by default.
		    		styles: [						// Set the line style for the user-input coordinates.
		    	    {
		    	    	id: 'gl-draw-line',
		    	      	type: 'line',
		    	      	filter: ['all', ['==', '$type', 'LineString'], ['!=', 'mode', 'static']],
		    	      	layout: {
		    	        	'line-cap': 'round',
		    	        	'line-join': 'round'
		    	      	},
		    	      	paint: {
			    	        'line-color': '#438EE4',
			    	        'line-dasharray': [0.2, 2],
		    	        	'line-width': 4,
		    	        	'line-opacity': 0.7
		    	      	}
		    	    },
		    	    {								
		    	    	id: 'gl-draw-polygon-and-line-vertex-halo-active',	// Style the vertex point halos.
		    	      	type: 'circle',
		    	      	filter: [
			    	        'all',
			    	        ['==', 'meta', 'vertex'],
			    	        ['==', '$type', 'Point'],
		    		        ['!=', 'mode', 'static']
		    		    ],
		    	   		paint: {
		    	        	'circle-radius': 12,
		    	        	'circle-color': '#FFF'
		    	      	}
		    	    },
		    	    {
		    	    	id: 'gl-draw-polygon-and-line-vertex-active',	// Style the vertex points.
		    	      	type: 'circle',
		    	      	filter: [
		    	        	'all',
		    	        	['==', 'meta', 'vertex'],
		    	        	['==', '$type', 'Point'],
		    	        	['!=', 'mode', 'static']
		    	      	],
		    	      	paint: {
		    	        	'circle-radius': 8,
		    	        	'circle-color': '#438EE4'
		    	      	}
		    	    }
		    		]
		    });
			
			//draw 기능 추가! update/delete 기능 on
		    map.addControl(draw);
		    map.on('draw.create', updateRoute);
	    	map.on('draw.update', updateRoute);
	    	map.on('draw.delete', removeRoute);	  
			
		 	// Use the coordinates you drew to make the Map Matching API request
	    	function updateRoute() {
	    	  	const profile = 'walking';				// Set the profile
	    	  	const data = draw.getAll();				// Get the coordinates that were drawn on the map
	    	  	const lastFeature = data.features.length - 1;
	    	  	const coords = data.features[lastFeature].geometry.coordinates;
	    	  	const newCoords = coords.join(';');	
	    	  	const radius = coords.map(() => 25);	// Set the radius for each coordinate pair to 25 meters
	    	  	getMatch(newCoords, radius, profile);
	    	}

	    	
	    	// Make a Map Matching request
	    	async function getMatch(coordinates, radius, profile) {
	    		console.log(coordinates+" " + radius + " "+profile);
	    	  	const radiuses = radius.join(';');
				const url = "https://api.mapbox.com/matching/v5/mapbox/"+profile+"/"+coordinates+"?geometries=geojson&radiuses="+radiuses+"&steps=true&access_token="+mapboxgl.accessToken;	    	  
	    	  	const query = await fetch(	// Create the query
	    	  			url,
	    	    		{ method: 'GET', headers: {"Access-Control-Allow-Origin":"*"} }	//mode: 'no-cors' 
		    		);
	    	  	const response = await query.json();
	    	  
	    	  	// Handle errors
	    	  	if (response.code !== "Ok") {
	    	    	alert(
	    	      		`${response.code} - ${response.message}.\n\nFor more information: https://docs.mapbox.com/api/navigation/map-matching/#map-matching-api-errors`
	    	    	);
	    	    	return;
	    	  	}
	    	  	mapinfo = response;
	    	  	const coords = response.matchings[0].geometry;	// Get the coordinates from the response
	    	  	
	    	  	// geometry의 중심 좌표 구하기
	    	  	var lo=0, la=0;
	    	  	for(var coord of coords.coordinates){
	    	  		lo += coord[0];
	    	  		la += coord[1];
	    	  	}
	    	  	center_lo = lo/coords.coordinates.length;
	    	  	center_la = la/coords.coordinates.length;	    	  	
	    	  
	    	  	addRoute(coords);
	    	}
	    	
	    	// Draw the Map Matching route as a new layer on the map
	    	function addRoute(coords) {
	    	  	if (map.getSource('route')) {	// If a route is already loaded, remove it
	    	    	map.removeLayer('route');
	    	    	map.removeSource('route');
	    	  	} else {						// Add a new layer to the map
	    	    	map.addLayer({
	    	    		id: 'route',
	    	      		type: 'line',
	    	      		source: {
			    	    	type: 'geojson',
			    	        data: {
	    			        	type: 'Feature',
	    		          		properties: {},
	    	    	      		geometry: coords
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
	    		    });
	    		}
	    	}
	    	
	    	// If the user clicks the delete draw button, remove the layer if it exists
	    	function removeRoute() {
	    		if (!map.getSource('route')) return;
	    	  	map.removeLayer('route');
	    	  	map.removeSource('route');
	    	}		    
		}
	});
	</script>

	
</body>
</html>