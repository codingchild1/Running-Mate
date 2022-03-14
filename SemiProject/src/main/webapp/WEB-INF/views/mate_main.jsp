<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>메이트 구하기</title>
<style>

* {
	padding: 0;
	/* margin: 0 auto; */
	box-sizing: border-box;
}
.post li {
	float: left;
	margin: 10px;
	list-style: none;
}
.post {
	display: inline-flex;
	width: 1060px;
	margin-top: 51px;
	justify-content: space-between;
}
.container1 {
	margin: 20px;
	width: 1060px;
}
.register {
	width: 300px;
	height: 160px;
	padding: 8px 8px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	margin: 14px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
	display: inline-block;
}
.profile {
	width: 50px;
	height: 50px;
	border-radius: 70%;
}
ul li a {
	text-decoration-line: none;
	color: black;
}
button a {
	text-decoration-line: none;
	color: white;
}
.main {
	position: relative;
}
#modal.modal-overlay {
	z-index: 8;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	/* background: rgba(255, 255, 255, 0.25); */
	/* box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); */
	/* backdrop-filter: blur(1.5px); */
	/* -webkit-backdrop-filter: blur(1.5px); */
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}
 .ptplist {
	display: none;
} 
 .info:hover .ptplist {
	display: block;
} 
#modal .modal-window {
	background: #d3d3d3;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	/* backdrop-filter: none; */
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	/* height: 576px; */
	/* position: relative; */
	top: -100px;
	padding: 15px;
}
#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal .title h2 {
	display: inline;
}
#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}
#modal .content {
	padding: 0px 10px;
}
#modal2.modal-overlay {
	z-index: 8;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	/* background: rgba(255, 255, 255, 0.25); */
	/* box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); */
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}
#modal2 .modal-window {
	background: #d3d3d3;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	/* height: 542px; */
	/* position: relative; */
	top: -100px;
	padding: 15px;
}
#modal2 .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal2 .title h2 {
	display: inline;
}
#modal2 .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}
#modal2 .content {
	/* margin-top: 20px; */
	padding: 0px 10px;
/* 	text-shadow: 1px 1px 2px gray;
	color: white; */
}
body {
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.more {
	cursor: pointer;
}

</style>
</head>
<body>
	 <%@include file ="header.jsp" %> 
	<!--  <form id='form' action="main" method="post">  -->
	<div style="width: 1060px; padding: 10px; margin: 20px auto;">
		<h1>메이트 구하기</h1>
		<div class="main">
			<div class="post">
				<ul>
					<li><a href="mate_main"><b>전체</b></a></li>
					<li><a href="mate_search">검색</a></li>
					<li><a href="mate_map">지도로 보기</a></li>
				</ul>
				<div style="display: flex; float: right; align-items: center; margin-right: 55px;">
					<button id="make" style="width: 30; height: 40px; padding: 6px 6px; margin: 7px; border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem;" ><a href="mate_makemate" >번개 글작성</a></button>
					<button id="make2" style="width: 30; height: 40px; padding: 6px 6px; margin: 7px; border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem;" ><a href="mate_makegroup">소모임 글작성</a></button>
				</div>
			</div>
		</div>
		<div class="container1">
			<c:forEach items="${mates }" var="groupandmate">
				<div class="register">
					<div style="margin: 5px; padding: 5px; display: flex; align-items: flex-start; justify-content: space-between;">
						<span><img class="profile" src='${groupandmate.img }'></span>
						<div style="margin-left: 10px;width: 150px">
							<span><input type="text" id="title"value='${groupandmate.title }'style="width:150px;height: 35px; vertical-align: middle; font-weight: bold; font-size: 15px; border: none; background-color: white;"disabled> </span> 
							<span><input type="text" id="id" value='${groupandmate.id }'style="height: 20px; vertical-align: middle; border: none; background-color: white;"disabled> </span>
						</div>
						<c:choose>
							<c:when test="${groupandmate.type eq 'g'}">
								<div style="display: inline-block;line-height: 30px;">소모임</div>
							</c:when>
							<c:otherwise>
								<div style="display: inline-block;line-height: 30px;">번개</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div style="margin: 5px; margin-top: 25px; padding: 5px; vertical-align: middle;">
						<c:choose>
							<c:when test="${groupandmate.type eq 'g'}">
						 		<span><img class="heart" src="images/white.png"style="width: 30px; height: 30px;margin-bottom:17px;"></span> 
								<span><input type="text" id="like" value='${groupandmate.likeno }'style="width: 30px;  vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;color:white;"disabled></span>
							</c:when>
							<c:otherwise>
								<span><img class="heart" src="images/ptp2.png"style="width: 30px; height: 30px;margin-bottom:17px;"></span> 
								<span><input type="text" id="like" value='${groupandmate.likeno }'style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;"disabled></span>
							</c:otherwise>
						</c:choose>
					<button id="btn-modal" class="more"style="border: none; float: right; margin-top: 10px; background-color: white; color: rgba(var(- -f52, 142, 142, 142), 1); cursor: pointer;"onclick="detailModal('${groupandmate.no}','${groupandmate.type }')">더보기</button>
						<input type="hidden" id="warning" name="warning" value='${groupandmate.warning}'>
						<input type="hidden" id="type" name="type" value='${groupandmate.type}'>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- mateform -->
	<div id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<input name='mate_title' id="mate_title" style="color: black; border: none; font-size: 20px; font-weight: bold; background-color: #d3d3d3; margin-top: 20px;"value='' >
				<div class="close-area">X</div>
			</div>
			<input name='user_id' id="user_id"style="color: black; border: none; font-size: 15px; background-color: #d3d3d3; padding-left: 10px; margin-top: 10px;"value=''>
			<div style="font-size: 13px; float: right;display: flex;">
				<form action="mate_updatemate" method="get"><span id="update" ><input type="hidden" id="ptp" name="ptp" value=''><input type="submit" value='수정' style="border:none;background-color:#d3d3d3; cursor:pointer;margin:5px;"></span></form>
				<span id="delete" style="margin: 5px;"><button class="delete" style="border:none;background-color:#d3d3d3;cursor:pointer;">삭제</button></span> 
					<span id="alerts" style="margin: 5px;">
						<span class="alert" style="border:none;background-color:#d3d3d3;cursor:pointer;width: 55px;padding:0px">신고</span>
						<input type="hidden" id="mwarning" name="mwarning" value=''>
					</span>
			</div>
			<input name='mate_date' type="text"style="color: black; height: 20px; margin: 10px; border: none; font-size: 12px; background-color:#d3d3d3;"value='' disabled>
			<div class="content">
				<div id="staticMap"style="width: 210px; height: 200px; border: 1px solid black;"></div>
					<input id="mapinfo" name="mapinfo" type="hidden" value=''> 
					<input id="mapinfo2" name="mapinfo2" type="hidden" value=''>
					<input id="mapinfo3" name="mapinfo3" type="hidden" value=''>
				<textarea id="editor" name="mate_cont"style="width: 352px; height: 190px;"></textarea> 
				<input id="mate_cont" name="mate_cont" type="hidden" value=''> 
				<div style="display: flex; flex-direction: row-reverse; margin: 7px; margin-right: 0px; float: right; position: relative; height: 32px;">
					<div class="info" style="margin: 5px;width: 60px;height: 30px;text-align: center;border: 1px solid #59ab6e;background-color: #59ab6e;border-radius: 0.25rem;color:white;cursor:pointer;line-height: 30px;font-size:13px;">조회
						<div class="ptplist"style="position: relative; border: 1px solid; width: 150px; top: -150px; margin: 10px; background-color: #59ab6e;">
							<p style="font-size: 13px; margin: 2px; padding: 5px;display:flex;">참여자 목록</p>
							<div class="list" style="margin: 5px;margin-left:10px">
								<input type="hidden" id="ptpli" name="ptpli" value=''>
							</div>
						</div>
					</div>
					<button class="ptp"  style="margin: 5px;width: 60px;height: 30px;text-align: center;border: 1px solid #59ab6e;background-color: #59ab6e;border-radius: 0.25rem;color:white;cursor:pointer;font-size:13px;">참여</button>
				</div>
			</div>
		</div>
	</div>
	<!-- groupform -->
	<div id="modal2" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<input name="group_title" id="group_title"style="color: black; border: none; font-size: 20px; font-weight: bold; background-color:#d3d3d3; margin-top: 20px;"value='' disabled>
				<div class="close-area">X</div>
			</div>
			<input name="user_id" id="user_id"style="color: black; border: none; font-size: 15px; background-color: #d3d3d3; padding-left: 10px; margin-top: 10px;"value=''>
			<div style="font-size: 13px; float: right;display: flex;">
				<form action="mate_updategroup" method="get"><span id="update2"><input type="hidden" id="ptp" name="ptp" value=''><input type="submit" value='수정' style="border:none;background-color:#d3d3d3; cursor:pointer;margin:4px;"></span></form>
				<span id="delete2" style="margin: 5px; cursor: pointer;"><button class="delete2" style="border:none;background-color:#d3d3d3;cursor:pointer;">삭제</button></span>
				<span id="alerts" style="margin: 5px;">
					<span class="alert2" style="border:none;background-color:#d3d3d3;cursor:pointer;width: 55px;">신고</span>
					<input type="hidden" id="gwarning" name="gwarning" value=''>
				</span>

			</div>
			<input name="group_date" type="text"style="color: black; height: 20px; margin: 10px; border: none; font-size: 12px; background-color: #d3d3d3;"value='' disabled>
			<div class="content">
				<div id="staticMap2"style="width: 210px; height: 200px; border: 1px solid black;"></div>
				<input id="mapinfo" name="mapinfo" type="hidden" value=''> 
				<input id="mapinfo2" name="mapinfo2" type="hidden" value=''>
					<input id="mapinfo3" name="mapinfo3" type="hidden" value=''>
				 <textarea id="editor2"style="width: 352px; height: 190px;"></textarea> 
					<input id="group_cont" name="group_cont" type="hidden" value=''> 
				<div style="display: flex; flex-direction: row-reverse; margin-top: 13px; margin-right: 0px; float: right; position: relative;">
					<a id=group_kl href='' target='_blank'><img class="kakao"src="images/kakao.png"style="width:25px;height:25px;margin-left:13px;"></a>
					<a id=group_il href='' target='_blank'><img class="insta"src="images/insta.png"style="width:25px;height:25px;"></a>

				</div>
			</div>
		</div>
	</div>
	<!-- </form> -->
	<script type="text/javascript"src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ff3a060b5b1b48bc2f77af63c6fa27a"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
	<script>
	
	$('#make').click(function(){
		var uid = '<%=(String)session.getAttribute("id")%>';
		 if(uid=='null'){
			alert("로그인이 필요한 서비스입니다.");
			return false;
			}
	});
	$('#make2').click(function(){
		var uid = '<%=(String)session.getAttribute("id")%>';
		 if(uid=='null'){
			alert("로그인이 필요한 서비스입니다.");
			return false;
			}
	});
		let m_editor;
		let g_editor;
	
		//mate ckeditor
    ClassicEditor.create(document.querySelector("#editor"))
        .then(editor=>{
        	window.editor = editor;
        	editor.isReadOnly = true;
        	const toolbarElement = editor.ui.view.toolbar.element;
        	toolbarElement.style.display = 'none';
        	m_editor=editor;
        })
    	.catch((error) => {
        	console.error(error);
        });
        
		//group ckeditor
     
	ClassicEditor.create(document.querySelector("#editor2"))
        .then(editor=>{
       		window.editor = editor;
        	editor.isReadOnly = true;
        	const toolbarElement = editor.ui.view.toolbar.element;
        	toolbarElement.style.display = 'none';
        	g_editor=editor;
     	})
    	.catch((error) => {
        	console.error(error);
        });

	//더보기 클릭시 모달창 띄어주는 코드
    function detailModal(no,type){
		//번개 모달창 ajax
    	if(type=='m'){
    	 modal.style.display = "flex";
            $.ajax({
    			type:"post",
    			dataType:"text",
    			async:false,
    			url:"http://localhost:8090/Mmodal",
    			data:{"no":no},
    			success: function(data, textStatus){ 
    			 	var jdata = JSON.parse(data);
    			 	var map = JSON.parse(jdata.mate_mapinfo);
    			  
     			 	$('input[name=mate_title]').attr('value',jdata.mate_title);
     			 	$('input[name=user_id]').attr('value',jdata.user_id); 
     			 	$('input[name=mate_date]').attr('value',jdata.mate_date); 
     			 	$('input[name=ptp]').attr('value',jdata.mate_articleNO);
     			 	$('input[name=mapinfo]').attr('value',map.La); 
     			 	$('input[name=mapinfo2]').attr('value',map.Ma); 
     			 	$('input[name=mapinfo3]').attr('value',jdata.mate_mapinfo); 
     			 	$('input[name=mate_cont]').val(jdata.mate_cont); 
     			 	$('input[name=mate_cont]').val(jdata.mate_cont);
     			 	$('input[name=mwarning]').val(jdata.warning);
     			   
     			 	var uid = '<%=(String)session.getAttribute("id")%>';
     			  	if($('#user_id').val()==uid){
     				 	$('#delete').show();
     				 	$('#update').show();
     			  	}else{
     				 	$('#delete').hide();
     				 	$('#update').hide();
     			 	}
     			  	
     				//메이트에디터에 값넣어주는 함수	  
     	   			m_editor.setData($('#mate_cont').val());
     	   	
     				var La = $('#mapinfo').val();
     				var Ma = $('#mapinfo2').val();
     			
     				//번개 지도정보 가져오는 함수
     				var mapContainer = document.getElementById('staticMap'), // 지도를 표시할 div 
     		   	 	mapOption = { 
     		        	center: new kakao.maps.LatLng(Ma, La), // 지도의 중심좌표
     		        	level: 3 // 지도의 확대 레벨
     		   	 	};

     				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

     				// 마커가 표시될 위치입니다 
     				var markerPosition  = new kakao.maps.LatLng(Ma, La); 

     				// 마커를 생성합니다
     				var marker = new kakao.maps.Marker({
     		    		position: markerPosition
     				});

     				// 마커가 지도 위에 표시되도록 설정합니다
     				marker.setMap(map);
    				},
    			error:function(data, textStatus){
    				alert("실패");
    			}
    		});
            //참여자 리스트 ajax
            	$.ajax({     
        			type:"post",
        			dataType:"text",
        			async:false,
        			url:"http://localhost:8090/ptplist",
        			data:{"no":no},
        			success: function(data, textStatus){ 
        				$('.list').html('');
        				var jdata = JSON.parse(data);
        				console.log(jdata);
        			 	for(let i of jdata) {
        				 	var clist = $('.list').html()+'<span style="float: left;">'+i.user_id+"</span><br>";
        				 	$('.list').html(clist);
        				}
        			},
        			error:function(data, textStatus){
        				alert("실패");
        			}
        		});
            //번개 신고버튼 체크
            	$.ajax({     
        			type:"post",
        			dataType:"text",
        			async:false,
        			url:"http://localhost:8090/alertcheck",
        			data:{"no":no},
        			success: function(data, textStatus){ 
        				if(data=='true'){
        					$("#alerts span").html("신고취소");
        				}else{
        					$("#alerts span").html("신고");
        				}
        			},
        			error:function(data, textStatus){
        				alert("실패");
        			}
        		});
            //참여버튼 체크
            	 $.ajax({     
        			type:"post",
        			dataType:"text",
        			async:false,
        			url:"http://localhost:8090/Likecheck",
        			data:{"no":no},
        			success: function(data, textStatus){ 
        				if(data=='true'){
        					$('.ptp').html('참여취소');
        				}else{
        					$('.ptp').html('참여');
        				}
        			},
        			error:function(data, textStatus){
        				alert("실패");
        			}
        		}); 

            //소모임 모달폼 ajax
    	}else{
    		modal2.style.display = "flex";
   		 		$.ajax({
 					type:"post",
 					dataType:"text",
 					async:false,
 					url:"http://localhost:8090/Gmodal",
 					data:{"no":no},
 					success: function(data, textStatus){ 
 			 			var jdata = JSON.parse(data); 
			 			var map = JSON.parse(jdata.group_area);
 			 			$('input[name=group_title]').attr('value',jdata.group_title);
 			 			$('input[name=user_id]').attr('value',jdata.user_id);
 			 			$('input[name=group_date]').attr('value',jdata.group_date);
 			 			$('input[name=ptp]').attr('value',jdata.group_articleNO);
 			 			$('#group_kl').attr('href',jdata.group_kl);
 			 			$('#group_il').attr('href',jdata.group_il);
 			 			$('input[name=mapinfo]').attr('value',map.La); 
			 			$('input[name=mapinfo2]').attr('value',map.Ma);  
			 			$("#group_cont").val(jdata.group_cont); 
			 			$('input[name=gwarning]').val(jdata.warning); 
			 	
			 			var uid = '<%=(String)session.getAttribute("id")%>';
			  			if($('#user_id').val()==uid){
  				 			$('#delete2').show();
  				 			$('#update2').show();
  			  			}else{
  				 			$('#delete2').hide();
  				 			$('#update2').hide();
  			  			}
			  
				//그룹게시물에디터 값 넣는 함수
				g_editor.setData($('#group_cont').val());
			 
 				var La = $('#mapinfo').val();
 				var Ma = $('#mapinfo2').val(); 
 			
 				//소모임 지도정보 함수
 				var mapContainer = document.getElementById('staticMap2'), // 지도를 표시할 div 
 		    	mapOption = { 
 		        	center: new kakao.maps.LatLng(Ma, La), // 지도의 중심좌표
 		        	level: 3 // 지도의 확대 레벨
 		    	};

 				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

 				// 마커가 표시될 위치입니다 
 				var markerPosition  = new kakao.maps.LatLng(Ma, La); 

 				// 마커를 생성합니다
 				var marker = new kakao.maps.Marker({
 		   		 	position: markerPosition
 				});

 				// 마커가 지도 위에 표시되도록 설정합니다
 				marker.setMap(map);
 				},
 				error:function(data, textStatus){
 					alert("실패");
 				}
 			});
   		 	//소모임 신고버튼 체크
            	$.ajax({     
        			type:"post",
        			dataType:"text",
        			async:false,
        			url:"http://localhost:8090/alertcheck2",
        			data:{"no":no},
        			success: function(data, textStatus){ 
        				if(data=='true'){
        					$("#alerts span").html("신고취소");
        				}else{
        					$("#alerts span").html("신고");
        				}
        			},
        			error:function(data, textStatus){
        				alert("실패");
        			}
        		});
    	}
    }
	//mate 모달창 함수
        const modal = document.getElementById("modal")
        function modalOn() {
            modal.style.display = "flex"
        }
        function isModalOn() {
            return modal.style.display === "flex"
        }
        function modalOff() {
            modal.style.display = "none"
        }
        const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modalOff()
        });
        modal.addEventListener("click", e => {
            const evTarget = e.target
            if (evTarget.classList.contains("modal-overlay")) {
                modalOff()
            }
        });
        window.addEventListener("keyup", e => {
            if (isModalOn() && e.key === "Escape") {
                modalOff()
            }
        });
	//group 모달창 함수
         const modal2 = document.getElementById("modal2")
        function modalOn1() {
            modal2.style.display = "flex"
        }
        function isModalOn1() {
            return modal2.style.display === "flex"
        }
        function modalOff1() {
            modal2.style.display = "none"
        }
        
        const closeBtn2 = modal2.querySelector(".close-area")
        closeBtn2.addEventListener("click", e => {
            modalOff1()
        })
        modal2.addEventListener("click", e => {
            const evTarget2 = e.target
            if (evTarget2.classList.contains("modal-overlay")) {
                modalOff1()
            }
        })
        window.addEventListener("keyup", e => {
            if (isModalOn1() && e.key === "Escape") {
                modalOff1()
            }
        }); 
	   
        //참여버튼 클릭시 참여자 수 +1, ptp테이블에 해당정보 저장 ajax
	var bt;
	$('.ptp').click(function(){
		var uid = '<%=(String)session.getAttribute("id")%>';
		if(uid=='null'){
    		alert("로그인이 필요한 서비스입니다.");
    		return false;
		}
	    $.ajax({
	        type:"post",
	        dataType:"text",
	        async:false,
	        url:"http://localhost:8090/Like",
	        data:{"no":$('#ptp').val()},
	        success: function(data, textStatus){
	        	if(data=='false') {
	        		alert("참여가 완료되었습니다.");
	        		$('.ptp').html('참여취소');
	        		
	        	} else{
	        		alert("참여가 취소되었습니다.");
	        		$('.ptp').html('참여');
	        	}	
	        },
	        error:function(data, textStatus){
	        	alert("실패");
	        }
        });
	    //참여자 리스트
	    $.ajax({     
			type:"post",
			dataType:"text",
			async:false,
			url:"http://localhost:8090/ptplist",
			data:{"no":$('#ptp').val()},
			success: function(data, textStatus){ 
				$('.list').html('');
				var jdata = JSON.parse(data);
				console.log(jdata);
			 	for(let i of jdata) {
				 	var clist = $('.list').html()+'<span style="float: left;">'+i.user_id+"</span><br>";
				 	$('.list').html(clist);
				}
			},
			error:function(data, textStatus){
				alert("실패");
			}
		}); 
	});
		
		//게시물 삭제 기능ajax
 	$('.delete').click(function(){
		$.ajax({
	        type:"post",
	        dataType:"text",
	        async:false,
	        url:"http://localhost:8090/deletemate",
	        data:{"no":$('#ptp').val()},
	        success: function(data, textStatus){
	        	alert("성공적으로 삭제되었습니다.");
	        	location.reload();
	        },
	        error:function(data, textStatus){
	        	alert("실패");
	        }
     	});
	}); 
	$('.delete2').click(function(){
		$.ajax({
	        type:"post",
	        dataType:"text",
	        async:false,
	        url:"http://localhost:8090/deletegroup",
	        data:{"no":$('#ptp').val()},
	        success: function(data, textStatus){
	        	alert("성공적으로 삭제되었습니다.");
	        	location.reload();
	        },
	        error:function(data, textStatus){
	        	alert("실패");
	        }
    	});
	});
		
	//mate게시물 신고
	$('.alert').click(function(){
		var uid = '<%=(String)session.getAttribute("id")%>';
		if(uid=='null'){
    		alert("로그인이 필요한 서비스입니다.");
    		return false;
		}
		$.ajax({
	        type:"post",
	        dataType:"text",
	        async:false,
	        url:"http://localhost:8090/alert",
	        data:{"board_no":$('#ptp').val(),
	        	  "user_id":$("#user_id").val(),
	        	  "board_type":"mate"},
	        success: function(data, textStatus){
	        	console.log(data);
	        	if(data=="true"){
	        		alert("성공적으로 신고되었습니다.");
	        		$('#alerts span').html('신고취소');
	        	}else{
	        		alert("신고가 취소되었습니다.")
	        		$('#alerts span').html('신고');
	        	}
	        },
	        error:function(data, textStatus){
	        	alert("실패");
	        }
   		});
	});
		
	//group게시물 신고
	$('.alert2').click(function(){
		var uid = '<%=(String)session.getAttribute("id")%>';
		if(uid=='null'){
    		alert("로그인이 필요한 서비스입니다.");
    		return false;
		}
		 $.ajax({
	        type:"post",
	        dataType:"text",
	        async:false,
	        url:"http://localhost:8090/alert",
	        data:{"board_no":$('#ptp').val(),
	        	  "user_id":$("#user_id").val(),
	        	  "board_type":"group"},
	        success: function(data, textStatus){
	        	console.log(data);
	        	if(data=="true"){
	        		alert("성공적으로 신고되었습니다.");
	        		$('#alerts span').html('신고취소');
	        	}else{
	        		alert("신고가 취소되었습니다.")
	        		$('#alerts span').html('신고');
	        	}
	        },
	        error:function(data, textStatus){
	        		lert("실패");
	        }
  		});
	});

</script>
 <%@include file ="fotter.jsp" %> 
</body>
</html>
