<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
    <style>
    body{
    display: flex;
    flex-direction: column;
    justify-content: center;
        }
        .profile {
            width: 30px;
            height: 30px;
            border-radius: 70%;
        }
        input:focus{
            outline: none;
        }
    </style>
</head>
<body>
<%@include file ="header.jsp" %>
    <div style="width: 940px; padding: 10px; margin:20px auto;">
    <h1>소모임 글쓰기</h1>
    <div style="margin-top: 100px;">
    <div style="display: flex; align-items: center;">
        <span><img class="profile" src="images/profile.png"></span>
        <span><input type="text" id="id" value="닉네임"
            style="height: 20px;border:none; background-color: white;"
            disabled> </span>
    </div>
    <div style="border-bottom: 1px solid; margin-top: 20px;">
        <input type="text" id="title"  style="border:none; border-bottom: 2px; height: 30px; font-size: 20px;width: 100%;" placeholder="제목">
    </div>
    <div style="display: flex; align-items: flex-end;">
    <div style="border: 1px solid;padding:2px;width: 210px; margin-top: 20px;">
        <span><img class="search" src="images/search.png" style="width: 20px; height: 20px; float: left; margin-left: 5px;margin-top: 5px;"></span>
    <input class="search" id="search" type="text" style="width: 170px;height: 30px; margin-left: 5px; border: none;" placeholder="주소를 입력하세요">
    </div>
    <button id="search2" style="border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem; height: 38px; margin-left: 5px;color: white; ">검색</button>
    </div>
    <div id="mapinfo" style="border: 1px solid; width: 250px; height: 250px; margin-top: 20px;"></div>
    <textarea name="content" id="editor" style="width: 100%;height: 500px;" placeholder="내용을 입력하세요"></textarea>
    <div style="display: flex; margin-top: 20px;">
        <a href="#"><img class="kakao" src="images/kakao.png" style="width: 30px; height: 30px;"></a>
        <input type="text"  style="margin-left: 10px;width: 100%;" placeholder="오픈카카오톡 링크를 입력하세요">
    </div>
    <div style="display: flex;margin-top: 10px;">
        <a href="#"><img class="insta" src="images/insta.png" style="width: 30px; height: 30px;"></a>
        <input type="text" style="margin-left: 10px; width: 100%;" placeholder="인스타 디엠 링크를 입력하세요">
    </div>
    <div style=" display: flex;align-items: center;margin-right: 55px;justify-content: center; margin-top: 50px;">
        <button style="border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem;color: white; width: 50px; height: 30px;margin: 15px;">작성</button>
        <button style="border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem;color: white; width: 50px; height: 30px;margin: 15px;"><a href="main" style="text-decoration-line: none;">취소</a></button>
    </div>
    </div>
    </div>
     <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff3a060b5b1b48bc2f77af63c6fa27a&libraries=services"></script>
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        ClassicEditor
            .create( document.querySelector( '#editor' ) )
            .catch( error => {
                console.error( error );
            } );
        	
       
            var infowindow = new kakao.maps.InfoWindow({zIndex:1});
            var mapContainer = document.getElementById('mapinfo'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  
		
		
        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new kakao.maps.services.Geocoder();

		$(document).ready(function(){
			$('#search2').bind("click", function(){
				var search = $('#search').val();
		        geocoder.addressSearch(search, function(result, status) {
			
		            // 정상적으로 검색이 완료됐으면 
		             if (status === kakao.maps.services.Status.OK) {
		                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		                // 결과값으로 받은 위치를 마커로 표시합니다
		                var marker = new kakao.maps.Marker({
		                    map: map,
		                    position: coords
		                });
		                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		                map.setCenter(coords);
		                marker.setDraggable(true);
		                console.log(marker);
		            }
		         	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		        	    
		        	    // 클릭한 위도, 경도 정보를 가져옵니다 
		        	    var latlng = mouseEvent.latLng; 
		        	    
		        	    // 마커 위치를 클릭한 위치로 옮깁니다
		        	    marker.setPosition(latlng);
		        	    
		        	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
		        	    message += '경도는 ' + latlng.getLng() + ' 입니다';
		        	    
		        	    var resultDiv = document.getElementById('clickLatlng'); 
		        	    console.log(message);
		        	    /* resultDiv.innerHTML = message; */
		        	    
		        	});
		        });  
			});
		});
		
       
  
        </script>
         <%@include file ="fotter.jsp" %>
</body>
</html>