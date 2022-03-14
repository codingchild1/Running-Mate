<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>메이트 구하기</title>
<script
	src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
<style>
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.profile {
	width: 40px;
	height: 40px;
	border-radius: 70%;
}
input:focus {
	outline: none;
}
.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    border-color: var(--ck-color-base-border);
    height: 400px;
}
.ck.ck-editor__editable:not(.ck-editor__nested-editable).ck-focused{
height:400px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<form id='form' action="mate_makemate" method="post">
		<div style="width: 940px; padding: 10px; margin: 20px auto;">
			<h1>번개 글쓰기</h1>
			<div style="margin-top: 100px;">
				<div style="display: flex; align-items: center;">
					<span><img class="profile" src='/profileview/${user_img2 }'id="user_img2" name="user_img2"></span>
						<input type="hidden"name="user_img" id="user_img" value=''>
					<span><input type="text" id="user_id" name="user_id" value='${id }'style="height: 20px; border: none; background-color: white;"disabled></span>
						<input type="hidden" id="user_id"name="user_id" value='${id }'>
				</div>
				<div style="border-bottom: 1px solid; margin-top: 20px;">
					<input type="text" id="mate_title" name="mate_title"style="border: none; border-bottom: 2px; height: 30px; font-size: 20px; width: 100%;"placeholder="제목">
				</div>
				<div style="display: flex; align-items: flex-end;">
					<div style="border: 1px solid; padding: 2px; width: 210px; margin-top: 20px;">
						<span><img class="search" src="images/search.png"style="width: 20px; height: 20px; float: left; margin-left: 5px; margin-top: 5px;"></span>
						<input class="search" id="search" type="text"style="width: 170px; height: 30px; margin-left: 5px; border: none;"placeholder="주소를 입력하세요">
					</div>
					<button id="search2"style="border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem; color: white; height: 38px; margin-left: 5px;">검색</button>
				</div>
				<div id="mapinfo"style="border: 1px solid; width: 300px; height: 300px; margin-top: 20px;"></div>
				<input type="hidden" id="mate_mapinfo" name="mate_mapinfo" value="">
				<input type="hidden" id="mate_address" name="mate_address" value="">
				<div>
				<textarea id="editor" name="mate_cont"style="width: 100%; height: 600px;"  placeholder="내용을 입력하세요"></textarea>
				</div>
				<div style="display: flex; align-items: center; margin-right: 55px; justify-content: center; margin-top: 50px;">
					<button id="submit"style="border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem; color: white; width: 50px; height: 30px; margin: 15px;">작성</button>
					<button style="border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem; color: white; width: 50px; height: 30px; margin: 15px;"><a href="mate_main" style="color: white;">취소</a></button>
				</div>
			</div>
		</div>
	</form>
<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff3a060b5b1b48bc2f77af63c6fa27a&libraries=services"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    
    $('#form').submit(function() {
		 let title = $('#mate_title').val();
		 if(title==''){
			 alert("제목을 입력하세요");
			 $('#mate_title').focus();
	         return false;
		 }
		 let search = $('#search').val();
		 if(search==''){
			 alert("주소를 입력하세요");
			 $('#search').focus();
	         return false;
		 }
	 });
    
    //ckeditor
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
    
    //카카오지도 api
	var mapContainer = document.getElementById('mapinfo'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	/* searchAddrFromCoords(map.getCenter(), displayCenterInfo); */
	
     var src = jQuery('#user_img2').attr("src");
	 $('input[name=user_img]').attr('value',src);   //이미지주소 관련
	 
	/*  var id = "닉네임";
	 $('input[name=user_id]').attr('value',"닉네임"); */  //value에 id값 넣기
	 
	$(document).ready(function(){
		$('#search2').bind("click", function(){
		var search = $('#search').val();
	   		geocoder.addressSearch(search, function(result, status) {
	        	
	       	// 정상적으로 검색이 완료됐으면 
	    		if(status === kakao.maps.services.Status.OK) {
	        		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                	map.setCenter(coords);
	                	marker.setDraggable(true);
	            	}
	            	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	            		searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	            			if(status === kakao.maps.services.Status.OK) {
	            	    		var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            	            	detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            	            	var content = '<div class="bAddr">' + detailAddr + '</div>';
	            	            	var latlng = mouseEvent.latLng;
	            	            	JSON.stringify(latlng);
	            	    	    	console.log("좌표: " + JSON.stringify(latlng));
	            	    	    	$('input[name=mate_mapinfo]').attr('value',JSON.stringify(latlng));
	            	            	// 마커를 클릭한 위치에 표시합니다 
	            	            	marker.setPosition(mouseEvent.latLng);
	            	            	marker.setMap(map);

	            	            	// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            	            	/* infowindow.setContent(content);
	            	            	infowindow.open(map, marker); */
	            	           
	            	        	/* console.log(result[0].address.address_name); */
	            	        		$('input[name=mate_address]').attr('value',result[0].address.address_name);
	            	    	}
	            	    	console.log($('#mate_address').val());
	            		});
					});
					return false; 
	    	});  
			return false;
		});
	});  

	function searchAddrFromCoords(coords, callback) {
		    // 좌표로 행정동 주소 정보를 요청합니다
		geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}

	function searchDetailAddrFromCoords(coords, callback) {
	// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	} 
		
</script>
<%@include file="fotter.jsp"%>
</body>
</html>