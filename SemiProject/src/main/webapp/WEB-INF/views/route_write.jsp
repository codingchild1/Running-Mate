<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<link rel="apple-touch-icon" href="/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">

    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">

	<script src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>
	<script src="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.js"></script>
	<link href="https://api.tiles.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css" rel="stylesheet"/>
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.js"></script>
	<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-draw/v1.0.9/mapbox-gl-draw.css" type="text/css" />
	<script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.4.2/mapbox-gl-geocoder.min.js"></script>

	<link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-geocoder/v4.7.2/mapbox-gl-geocoder.css" type="text/css">
	
	<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@grabzit/js@3.5.2/grabzit.min.js"></script>

	<!-- 넓이 높이 조절 -->
	<style>
	#map {
        top: 0;
        bottom: 0;
        width: 100%;
        height: 500px;
      }
	.ck-editor__editable {
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
		<div><form id="route_write" action="/route_reg" method="post">
			<div id="user_info" style="height:80px; display: flex; align-items: center;">
				<div style="height:40px; width:40px; overflow:hidden;">
					<!-- 썸네일 이미지 -->
					<img id="thumb_img"
						src="https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg"
						style="width:100%; object-fit:cover;">
				</div>
				<!-- 사용자 ID -->
				<div id="user_id" style="height:40px; display:inline-block; line-height: 40px; padding-left : 10px;" >김길동</div>
			</div>
			<!-- 글 제목 -->
			<input type="text" id="route_title" name="route_title" class="form-control mt-1" value="제목"/><br>
			<p>코스를 그려주세요</p>
			<div id="map"></div>
			
			<input type="hidden" id="form_user_id" name="user_id">
			<input type="hidden" id="form_thumb_img" name="route_thumb">
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
			mapboxgl.accessToken = 'pk.eyJ1IjoidmhxbHRrZmtkMjQiLCJhIjoiY2wwMDZ3eG92MDA2MzNjcnlpNmEzN3YydCJ9.eu7sOlz2memREpbstyzmjA';
		    const map = new mapboxgl.Map({
		    	container: 'map', // Specify the container ID
		      	style: 'mapbox://styles/mapbox/streets-v11', // Specify which map style to use
		      	center: [127.035812,37.570149], // Specify the starting position
		      	zoom: 14.5, // Specify the starting zoom
		    });
		    
		    var thumb_img =""
		    const coordinatesGeocoder = function (query) {
		    	// Match anything which looks like
		    	// decimal degrees coordinate pair.
		    	const matches = query.match(
		    		/^[ ]*(?:Lat: )?(-?\d+\.?\d*)[, ]+(?:Lng: )?(-?\d+\.?\d*)[ ]*$/i
		    	);
		    	if (!matches) {
		    		return null;
		    	}
		    	 
		    	function coordinateFeature(lng, lat) {
		    		return {
		    			center: [lng, lat],
		    			geometry: {
		    				type: 'Point',
		    				coordinates: [lng, lat]
		    			},
		    			place_name: 'Lat: ' + lat + ' Lng: ' + lng,
		    			place_type: ['coordinate'],
		    			properties: {},
		    			type: 'Feature'
		    		};
		    	}
		    	 
		    	const coord1 = Number(matches[1]);
		    	const coord2 = Number(matches[2]);
		    	const geocodes = [];
		    	 
		    	if (coord1 < -90 || coord1 > 90) {
		    		// must be lng, lat
		    		geocodes.push(coordinateFeature(coord1, coord2));
		    	}
		    	 
		    	if (coord2 < -90 || coord2 > 90) {
		    		// must be lat, lng
		    		geocodes.push(coordinateFeature(coord2, coord1));
		    	}
		    	 
		    	if (geocodes.length === 0) {
		    		// else could be either lng, lat or lat, lng
		    		geocodes.push(coordinateFeature(coord1, coord2));
		    		geocodes.push(coordinateFeature(coord2, coord1));
		    	}
		    	 
		    	return geocodes;
		    };
		    	 
		    // Add the control to the map.
		    map.addControl(
		    	new MapboxGeocoder({
		    		accessToken: mapboxgl.accessToken,
		    		localGeocoder: coordinatesGeocoder,
		    		zoom: 4,
		    		placeholder: 'Try: -40, 170',
		    		mapboxgl: mapboxgl,
		    		reverseGeocode: true
		    	})
		    );
		    	
		    var mapinfo = {};
		    
		    const draw = new MapboxDraw({
		    	// Instead of showing all the draw tools, show only the line string and delete tools.
		    	displayControlsDefault: false,
		    	controls: {
		    		line_string: true,
		    	    trash: true
		    	},
		    	// Set the draw mode to draw LineStrings by default.
		    	defaultMode: 'draw_line_string',
		    		styles: [
		    	    // Set the line style for the user-input coordinates.
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
		    	    // Style the vertex point halos.
		    	    {
		    	    	id: 'gl-draw-polygon-and-line-vertex-halo-active',
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
		    	    // Style the vertex points.
		    	    {
		    	    	id: 'gl-draw-polygon-and-line-vertex-active',
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
		    
		 	// Add the draw tool to the map.
	    	//map.addControl(draw);
		 	map.addControl(
		 		draw
		    );
	    	// Use the coordinates you drew to make the Map Matching API request
	    	function updateRoute() {
	    		// Set the profile
	    	  	const profile = 'walking';
	    	  	// Get the coordinates that were drawn on the map
	    	  	const data = draw.getAll();
	    	  	const lastFeature = data.features.length - 1;
	    	  	const coords = data.features[lastFeature].geometry.coordinates;
	    	  	// Format the coordinates
	    	  	const newCoords = coords.join(';');
	    	  	// Set the radius for each coordinate pair to 25 meters
	    	  	const radius = coords.map(() => 25);
	    	  	getMatch(newCoords, radius, profile);
	    	}

	    	
	    	// Make a Map Matching request
	    	async function getMatch(coordinates, radius, profile) {
	    		console.log(coordinates+" " + radius + " "+profile);
	    	  	// Separate the radiuses with semicolons
	    	  	const radiuses = radius.join(';');
				const url = "https://api.mapbox.com/matching/v5/mapbox/"+profile+"/"+coordinates+"?geometries=geojson&radiuses="+radiuses+"&steps=true&access_token="+mapboxgl.accessToken;
	    	  	console.log(url);
	    	  
	    	  	// Create the query
	    	  	const query = await fetch(
	    			url,
	    	    	{ method: 'GET', headers: {"Access-Control-Allow-Origin":"*"} }
		    	  );
		   	  	//, mode: 'no-cors' 
	    	  	console.log(query);
	    	  	const response = await query.json();
	    	  
	    	  	// Handle errors
	    	  	if (response.code !== "Ok") {
	    	    	alert(
	    	      		`${response.code} - ${response.message}.\n\nFor more information: https://docs.mapbox.com/api/navigation/map-matching/#map-matching-api-errors`
	    	    	);
	    	    	return;
	    	  	}
	    	  	mapinfo = response;
	    	  	console.log(mapinfo);
	    	  	console.log("hello");
	    	  	console.log(response.matchings[0].distance);
	    	  	// Get the coordinates from the response
	    	  	const coords = response.matchings[0].geometry;
	    	  	console.log(coords);
	    	  
	    	  	// Code from the next step will go here
	    	  	addRoute(coords);
	    	  	
	    	}
	    	
	    	map.on('draw.create', updateRoute);
	    	map.on('draw.update', updateRoute);
	    	
	    	// Draw the Map Matching route as a new layer on the map
	    	function addRoute(coords) {
	    		// If a route is already loaded, remove it
	    	  	if (map.getSource('route')) {
	    	    	map.removeLayer('route');
	    	    	map.removeSource('route');
	    	  	} else {
	    	    // Add a new layer to the map
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
	    	
	    	map.on('draw.delete', removeRoute);	  
	    	
			$('#reset').click(function(){
				
			    console.log("route_articleNo: service"); 
				console.log("user_id: "+ $('#user_id').text());
				console.log("route_title: "+$('#route_title').val());
				console.log("route_thumb: "); 
				console.log("route_date: service"); 
				console.log("route_views: service"); 
				console.log("route_likes: service"); 
				console.log("route_content: "); 
				console.log(mapinfo.matchings[0].geometry);
				console.log("route_area: " ); 
				console.log("route_distance: "+ mapinfo.matchings[0].distance);
				console.log("warning: service" ); 
			});
		});
		
	</script>

</body>
</html>