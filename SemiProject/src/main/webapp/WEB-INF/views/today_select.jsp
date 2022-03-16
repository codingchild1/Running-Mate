<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />

	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<title>오늘의러닝</title>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>


<style>
 main {
	display: flex;
	justify-content: center;
	float: center;
	width: 1170px;
	height: 600px;
	margin-top: 10px;

} 

.ck-editor__editable {
	min-height: 450px;
	/* min-width: 300px; */
	max-width: 100%;
}

#today_delete, #today_modify, #warning {
	text-decoration: none;
}

#todayboardFooter {
	height: 30px;
	width: 30px;
	display: inline-block;
	margin: 32px 50% 32px 50%;
	float : center;
}

header {
	display: center;
	padding-top: 50px;
	width: 1170px;
}

.userProfile {
	width: 35px;
	height: 35px;
	border-radius: 70%;
}

.undertitleshow{
 	display: inline-block;
 	 margin: 10px 5% 10px 4%;
 	  }
 	  
.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    border-color: var(--ck-color-base-border);
    height: 400px;
}

.ck.ck-editor__editable:not(.ck-editor__nested-editable).ck-focused{
height:400px;
}

.container2 { max-width:1024px; margin:20px auto;}

#wrap {
  padding-top: 10em;
  position: relative;
  width: 100%; 
  background-color: #212934 !important
}

section {
  padding-bottom: 30px;
}

footer {
  width: 100%;
  height: 90px;
  bottom: 50px;
  position: absolute;
  padding-top: 15px;
  color: #808080;
  font-size: 15px;
  text-align: center;
}

footer a {
  display: inline-block;
  margin: 0 20px 10px 20px;
  color: #808080; 
  font-size: 20px;  
}

footer p span {
  display: inline-block;
  margin-left: 20px;
}
</style>

</head>
<body>
	<%@include file="header.jsp"%>
	<div class="container py-5" style="margin-bottom:150px;" >
		<div class="row">
			<h1 style="float:left; margin-top:25px; margin-bottom:55px;">오늘의 런닝</h1>

			<div class="col-lg-1 "></div>
			<form action="/today_modify" method="post"
				enctype="multipart/form-data">
				<div class="col-lg-11">
					<header>
						<div class="row">
							<div class="container fluid">
								<div style="display: flex; align-items: center;">
									<span>
										<img class="userProfile" src='/profileview/${profileImg }' onerror="this.src='/profile/profile.png'">
									</span>
										
									<span>
										<input type="text" id="user_id" name="user_id" value='${todayselect.user_id}' style="height: 20px; border: none; background-color: white;"disabled>
									</span>
								</div>
										
								<input type="hidden" id="sessionid" value="${id }"/>
								<input name="articleNo" id="today_articleNo" type="hidden"value='${todayselect.today_articleNo}'>
							
								<ul class="list-inline shop-top-menu pb-3 pt-1">
									<li><input name="today_title" id="today_title" size="152" value='${todayselect.today_title}' style="border:none; border-bottom:1px solid black;"></li>
								</ul>
							</div>

							<div class="row">
								<table class="container d-flex">
									<tr>
										<td class="col" style="margin-left:20px;">${todayselect.today_date}</td>
										<td></td>
										<td id="today_views"  style="color:grey; margin-right:200px;">${todayselect.today_views}</td>
										<td> 
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											&nbsp&nbsp
											<c:choose>
												<c:when	test="${id eq todayselect.user_id || adminCheck eq 1 }">
													<button type="button" class="col gap-1 rounded btn btn-white" id="today_delete" name="today_delete">삭제</button>
													<c:if test="${id eq todayselect.user_id}">
														<input type="submit" class="col gap-1 rounded btn btn-white" id="today_modify" name="today_modify" value="수정" />
													</c:if>
												</c:when>
												<c:otherwise>
													<span id="alerts" onclick=alert()>
														<c:choose>
															<c:when test="${empty id}" ></c:when>
															<c:when test="${alert eq true }">
																<span id="alert" style="float: right; padding-left: 10px;">신고취소</span>
															</c:when>
															<c:when test="${alert eq false }">
																<span id="alert" style="float: right; padding-left: 10px;">신고</span>
															</c:when>
														</c:choose>
													</span>
													<span id="today_list" onclick=today_list()>목록</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</header>

					<!--------------------------------------------------ê²ìê¸ ---------------------------- -->
					<main>
						<table class="container-fluid">
							<tr>
								<td>
									<img class="col" src="/thumbfileview/${todayselect.today_thumb}" id="today_thumb" name="today_thumb" height="100px" width="100px"> 
									<label for="today_file">업로드</label> 
									<input type="file"name="today_file" id="today_file" accept="image/*" style="position: absolute; clip: rect(0, 0, 0, 0);">
								</td>
							</tr>
							<tr>
								<td>
									<textarea id="editor" class="ck-editor__editable" name="today_contents"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<div id="todayboardFooter"	class="todayboardFooter" >
										<div id="likes" onclick=changeImg()>
											<c:choose>
												<c:when test="${empty id}" ></c:when>
												<c:when test="${likes eq true }" >
													<img id="like"	src="${pageContext.request.contextPath }/images/like.PNG" style="width: 35px; margin-bottom: 50px;" />
												</c:when>
												<c:otherwise>
													<img id="like" src="${pageContext.request.contextPath }/images/nolike.PNG" style="width: 35px; margin-bottom: 50px;" />
												</c:otherwise>
											</c:choose>
										</div>
										<br>
									</div>
								</td>
							</tr>
						
						</table>
							
					</main>
					<div class="container2" style="border: 1px gray;">						
								<div class="card-header bg-light"><i class="fa fa-comment fa"></i> 댓글</div>
								<div id="replylist" class="card-body">
								<c:choose>
									<c:when test="${replylist!=null}">
										<c:forEach items="${replylist }" var="reply" varStatus="status">
										<div id="reply" style="padding:1em 0 1em 0;">
											<span class="reply"><img src="/profileview/${reply.user_img }"  style="width: 40px; height: auto; border-radius: 70%;"><b style="font-size: 12px; margin-left: 10px;">${reply.reply_id }</b></span>
											<c:choose>
											<c:when test="${id eq reply.reply_id }">
												<span class="reply_delete" style="float:right; padding-left:15px;">삭제</span>
												<span class="reply_modify" style="float:right; padding-left:10px;">수정</span>
											</c:when>
											</c:choose><br>
											<textarea id="reply_text" style="width: 85%; height:auto; border:none; font-size: 15px; margin-left: 4.3em; background-color:white;" disabled >${reply.reply_content }</textarea>
											
											<br>
											<span style="font-size: 10px; margin-left: 6.4em; color: gray">${reply.reply_date }</span>
											<span class="reply_reg btn btn-light" style="float:right; margin-right:10%; display:none;">등록</span>
											<br><br><hr></hr>
											<input type="hidden" class="reply_no" value="${reply.reply_no }"/>
										</div>
										</c:forEach>
									</c:when>
								</c:choose>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<div class="form-inline mb-2" style="margin-top: 2em;">
												<img src="/profileview/${user_profile }" style="width: 20px; height: auto;">${id }
											</div> 
											<textarea id="reply_content" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
											<button id="reply_button" class="btn btn-success" style="margin-top: 5px; float:right; ">등록</button>
											<input id="reply_img" type="hidden" value="${user_profile }" >
										</li>
									</ul>
								</div>
								<input type="hidden" id="session_id" value="${id }">
								<input type="hidden" id="reply_date" value="${reply.reply_date }">
						</div>
				</div>
			</form>
			&nbsp&nbsp&nbsp&nbsp&nbsp
		</div>
	</div>
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
function today_list(){
	  location.href="/today";	  
}
	  
function changeImg(){
	$.ajax({
		type:"post",
		url:"http://localhost:8090/likes",
		data: {"user_id": $("#writerId").text(), "board_type" : "today_select", "board_no": ${todayselect.today_articleNo}},
		dataType:"text",
		success:function(data){
			if(data=="true"){
				$("#like").attr("src", "${pageContext.request.contextPath }/images/like.PNG");
			} else {
				$("#like").attr("src", "${pageContext.request.contextPath }/images/nolike.PNG");
			}
			/* 새로고침 window.location.reload(); */
		}
	});			 
}

function alert(){
	var alert;
	if($("#alert").html() == "신고"){
		 alert = confirm('정말 게시글을 신고하시겠습니까?');
	}
	else if($("#alert").html() == "신고취소"){
		 alert = confirm('게시글을 신고를 취소하시겠습니까?');
	}
		
	if(alert==true){
		$.ajax({
			type:"post",
			url:"http://localhost:8090/alert",
			data: {"user_id": $("#user_id").text(), "board_type" : "today_select", "board_no": ${todayselect.today_articleNo}},
			dataType:"text",
			success:function(data){
				if(data=="true"){
					$("#alert").html("신고취소");
				} else {
					$("#alert").html("신고");
				}
			}
		});
	}
}
$(function(){
	$(".reply_modify").click(function(){
		if($(this).parent().children(".reply_modify").html()=="수정"){
			content = $(this).parent().children("textarea").val();
			$(this).parent().children(".reply_modify").html("수정취소");	
			$(this).parent().children(".reply_reg").show();
			$(this).parent().children("textarea").attr("disabled", false);
		} else if($(this).parent().children(".reply_modify").html()=="수정취소"){
			$(this).parent().children("textarea").value ='';
			//$(this).parent().children("textarea").value = content;
			$(this).parent().children(".reply_modify").html("수정");	
			$(this).parent().children(".reply_reg").hide();
			$(this).parent().children("textarea").attr("disabled", true);
		} 	
	});
	
	$(".reply_reg").click(function(){
		$(this).parent().children(".reply_modify").html("수정");	
		alert($(this).parent().children("textarea").val());
		$.ajax({
			type:"post",
			url:"http://localhost:8090/replyupdate",
			data: {"reply_no" : $(this).parent().children("input").val(), "reply_content" : $(this).parent().children("textarea").val() },
			dataType:"text",
			success:function(data){				
			}
		});		
		location.href="today_select?articleNo=" + ${todayselect.today_articleNo};
	});
	
	$(".reply_delete").click(function(){
		alert = confirm('댓글을 정말 삭제하시겠습니까?');
		if(alert==true){
			$.ajax({
				type:"post",
				url:"http://localhost:8090/replydelete",
				data: {"reply_no" : $(this).parent().children("input").val() },
				dataType:"text",
				success:function(data){				
				}
			});		
			location.href="today_select?articleNo=" + ${todayselect.today_articleNo};
		}
		else return false;
	});
			
	$("#reply_content").click(function(){
		var login = '<c:out value="${id}"/>';
		if(login==""){
			alert("로그인 후 사용 가능한 서비스입니다!");
		}
	});
	$("#reply_button").click(function(){
		var login = '<c:out value="${id}"/>';
		if(login==""){
			alert("로그인 후 사용 가능한 서비스입니다!");
			return false;
		}else{
			$.ajax({
				type:"post",
				url:"http://localhost:8090/reply",
				data: {"board_type": "today_select", "board_no" : ${todayselect.today_articleNo}, "reply_id": login, "user_img": $("#reply_img").val(), "reply_content": $('#reply_content').val()},
				dataType:"text",
				success:function(data){				
				}
			});		
			location.href="today_select?articleNo=" + ${todayselect.today_articleNo};
		}
		
	});
});


$(function(){
	//목록버튼
	$("#today_list").click(function(){
    		location.href="/today";
    });
	    	  
    //썸네일 이미지만 리드 
    $('#today_file').change(function (event) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#today_thumb').attr("src", e.target.result);	
		};
		reader.readAsDataURL(event.target.files[0]);
	});
    
    //ckeditor5 실행  
    if($("#sessionid").val()==$("#user_id").val() || $("#user_id").val() == "admin"){
	    	ClassicEditor.create(document.querySelector("#editor"), {
		    	initialData : '${todayselect.today_contents}',
		    	ckfinder : {
	          		uploadUrl : "/upload"
	          	}
		}).then(editor=> {
	      		window.editor=editor;
	      	}).catch((error) => {
				console.error(error);
			});
    } else {
    	$('#today_title').attr('readOnly', true);
    	$('#today_file').attr('disabled', 'disabled'); 	    		 
    	ClassicEditor.create(document.querySelector("#editor"), {
  			initialData : '${todayselect.today_contents}',
  		    ckfinder : {
  	       		uploadUrl : "/upload"
  	        }
  		}).then(editor=> {
   			editor.ui.view.toolbar.element.style.display = 'none';
  		})
	}
	      
    $('#today_delete').click(function (event) {
		let message = confirm('삭제하시겠습니까?');
		if(message == false){ 
			return;
		}
		else{
			alert(${todayselect.today_articleNo});
			$.ajax({     
	        	type:"post",
	        	dataType:"text",
	        	async:false,
	        	url:"http://localhost:8090/today_delete",
	        	data:{"articleNo":${todayselect.today_articleNo}},
	        	success: function(data, textStatus){ 
	        		alert(data);
	        			location.href="/today";
	        	},
	        	error:function(data, textStatus){
	        		alert(data);
	        	}
	        }); 
		}
	});

});


</script>	
	<%@include file ="fotter.jsp" %> 
</body>
</html>