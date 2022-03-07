<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <title>Document</title>
    <script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
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

    <form id='form' action="mate_makemate" method="post"> 
    <div style="width: 940px; padding: 10px;margin:20px auto;">
    <h1>번개 글쓰기</h1>
    <div style="margin-top: 100px;">
    <div style="display: flex; align-items: center;">
        <span><img class="profile" src="images/profile.png" id="user_img2"></span>
         <input type="hidden" name="user_img" id="user_img" value="닉네임">   
        <span><input type="text" id="user_id" name="user_id" value=""
            style="height: 20px;border:none; background-color: white;"
            disabled> </span>
            <input type="hidden" id="user_id" name="user_id" value="">
    </div>
    <div style="border-bottom: 1px solid; margin-top: 20px;">
        <input type="text" id="mate_title" name="mate_title" style="border:none; border-bottom: 2px; height: 30px; font-size: 20px;width: 100%;" placeholder="제목">
    </div>
    <div style="display: flex; align-items: flex-end;">
    <div style="border: 1px solid;padding:2px;width: 210px; margin-top: 20px;">
        <span><img class="search" src="images/search.png" style="width: 20px; height: 20px; float: left; margin-left: 5px;margin-top: 5px;"></span>
    <input class="search" id="search" type="text" style="width: 170px;height: 30px; margin-left: 5px; border: none;" placeholder="주소를 입력하세요">
    </div>
    <button id="search2" style="border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem;color: white; height: 38px; margin-left: 5px;">검색</button>
    </div>
     <div id="mapinfo"  style="border: 1px solid; width: 250px; height: 250px; margin-top: 20px;"></div>
     <input type="hidden" id="mate_mapinfo" name="mate_mapinfo" value=""> 
  
    <textarea id="editor" name="mate_cont" style="width: 100%;height: 600px;"></textarea>
    <div style=" display: flex;align-items: center;margin-right: 55px;justify-content: center; margin-top: 50px;">
        <button id="submit" style="border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem;color: white; width: 50px; height: 30px; margin: 15px;">수정</button>
        <button style="border: 1px solid #59ab6e; background-color: #59ab6e;border-radius:.25rem;color: white; width: 50px; height: 30px;margin: 15px;"><a href="mate_main">취소</a></button>
    </div>
    </div>
    </div>
     </form>  
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff3a060b5b1b48bc2f77af63c6fa27a&libraries=services"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    
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
	
     //var src = jQuery('#user_img2').attr("src");
	 //$('input[name=user_img]').attr('value',src);   //이미지주소 관련
	 
	 //var id = "닉네임";
	// $('input[name=user_id]').attr('value',"닉네임");  //value에 id값 넣기
	 
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
	            }
	         	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	        	    
	        	    // 클릭한 위도, 경도 정보를 가져옵니다 
	        	    var latlng = mouseEvent.latLng;
	        	   /*  console.log(latLng); */
	        	    JSON.stringify(latlng);
	        	    console.log("좌표: " + JSON.stringify(latlng));
	        	    console.log(typeof latlng);
	        	    $('input[name=mate_mapinfo]').attr('value',JSON.stringify(latlng));
	        	    // 마커 위치를 클릭한 위치로 옮깁니다
	        	    marker.setPosition(latlng);
	        	    
	        	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	        	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	        	    console.log(message);
	        	    
	        	    var resultDiv = document.getElementById('clickLatlng'); 
	        	    
	        	    $('#submit').bind("click", function(){
	        	     /* console.log(latlng.getLat(),latlng.getLng());  */
	        	    	console.log("맵정보는"+$('#mate_mapinfo').val()); 
	        	    	console.log($('#user_img').val());
		        	    console.log($('#user_id').val());
		        	    console.log($('#mate_title').val());
		        	    console.log($('#mate_cont').val());
		        	    console.log(src);  
		        	    /* resultDiv.innerHTML = message; */
	        	    });
	        	    
	        	 });
		 return false; 
	        });  
		return false;
		});
	});  


        </script>
 <%@include file ="fotter.jsp" %>
</body>


</html>