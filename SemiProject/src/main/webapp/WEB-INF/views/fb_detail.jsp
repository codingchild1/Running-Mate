<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">

<title>글 상세페이지</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
.modify {
	float: right;
	font-size: 15px;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

.views1 {
	color: #A9A9A9;
	display: inline-block;
	float: right;
	font-size: 15px;
}

.alerts {
	cursor: pointer;
}

.rock2{
	display: inline-block;
	margin-top: 5px;
}

li {
	list-style: none;
}

.replyd {
	margin-left: 1em;
}
</style>

<script type="text/javascript">

</script>

<%@include file="header.jsp"%>
<%@include file="slides.jsp"%>
</head>
<body>
	<!-- 내용 -->
	<section class="a123">
		<div style="padding: 10em 0 0 0;"></div>
		<button type="button" class="btn btn-success" onclick="location.href='./fb_main?page=${page}'" style= "margin-left: 92%;margin-bottom: 1em;">목록</button>
		<div class="a231">
		<div class="fb_detail">
		
			<div class="detail_title">
			
				<h2>${article.fb_title }</h2>
				<div class="detail_writer">
					<a href="#"><img src="${article.user_img }" width="20px;"
						height="20px" alt="" />${article.writer }</a>
				</div>
				<input type="hidden" id="articleWriter" value="${article.writer }">
				<div class="modify">

					<c:if test="${id eq article.writer || adminCheck eq 1}">
						<%-- <c:when test= "${id  eq todayselect.user_id || id eq 'admin' }"> --%>
						<!-- 세션 id 랑 글 작성자가 같을 경우 -->
						<a
							href="fb_delete?fb_articleNo=${article.fb_articleNo}&page=${page}"
							onclick="return confirm('정말 게시글을 삭제하시겠습니까?')"><span
							id="delete" style="float: right;">삭제</span></a>
					</c:if>
					<c:if test="${id eq article.writer}">
						<a href="fb_modify?fb_articleNo=${article.fb_articleNo}"> 수정&nbsp;&nbsp; </a>

					</c:if>
				</div>
				<div>
					<span id="detail_time" style="color: #A9A9A9; font-size: 12px;">${article.fb_date }</span>

				</div>

				<span class="views1"> <span id="alerts" onclick=alertpopup() style="cursor: pointer;">
						<c:choose>
							<c:when test="${alert eq true }">
								<span id="alert">신고취소</span>
							</c:when>
							<c:when test="${alert eq false }">
								<span id="alert">신고</span>
							</c:when>
						</c:choose>
				</span> 조회 ${article.fb_views }

				</span>

			</div>
		</div>

		<section id="line">
			<hr style="border: 1px;">
			<table>
				<tr>
					<td>${article.fb_content }<br>

					</td>

				</tr>
			</table>
		</section>
		<section>
			<div id="likes" onclick=changeImg() style="width: 50px; cursor: pointer; margin-left: 47%;">
				<c:choose>
					<c:when test="${likes eq true }">
						<img id="like"
							src="${pageContext.request.contextPath }/images/like.PNG"
							style="width: 50px;" />
					</c:when>
					<c:when test="${likes eq false }">
						<img id="like"
							src="${pageContext.request.contextPath }/images/nolike.PNG"
							style="width: 50px;" />
					</c:when>
				</c:choose>
				&nbsp;&nbsp;&nbsp;&nbsp;${article.fb_likes }
			</div>
			<br> 	
		</section>



			<div class="card-header bg-light">
				<i class="fa fa-comment fa"></i> 댓글
			</div>
			<div class="card-body">
			<div style="padding:1em 0 1em 0;">
			<span class="replyd""><img src="/images/고양이.PNG" style="width: 40px; height: auto; border-radius: 70%;"><b style="font-size: 12px; margin-left: 10px;">작성자1</b><br></span>
			<span style="font-size: 17px; margin-left: 3.8em;">비밀댓글입니다.</span>
			</div>
			<hr></hr>
			<div style="padding:1em 0 1em 0;">
			<span class="replyd""><img src="/images/강아지.PNG" style="width: 40px; height: auto; border-radius: 70%;"><b style="font-size: 12px; margin-left: 10px;">작성자2</b><br></span>
			<span style="font-size: 15px; margin-left: 4.3em;">와 좋은 정보!!<br></span>
			<span style="font-size: 15px; margin-left: 4.3em;">많은 도움이 됐습니다. 감사합니다.<br></span>
			<span style="font-size: 10px; margin-left: 6.4em; color: gray">2022-03-15 16:49 &nbsp;&nbsp;답글쓰기</span>
			</div>
			<hr></hr>
			<div style="padding:1em 0 1em 0;">
			<span class="replyd""><img src="/images/억울이.PNG" style="width: 40px; height: auto; border-radius: 70%;"><b style="font-size: 12px; margin-left: 10px;">작성자3</b><br></span>
			<span style="font-size: 15px; margin-left: 4.3em;">열심히 운동하셨네요.<br></span>
			<span style="font-size: 15px; margin-left: 4.3em;">저도 작성자님 못지 않게 앞으로 노력하겠습니다.<br></span>
			<span style="font-size: 10px; margin-left: 6.4em; color: gray">2022-03-15 16:49 &nbsp;&nbsp;답글쓰기</span>
			</div>
			<hr></hr>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="form-inline mb-2" style="margin-top: 2em;">
						<img src="${article.user_img }" style="width: 20px; height: auto;">${article.writer }
						</div> <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
						<button type="button" class="btn btn-success" onClick="javascript:addReply();" style="float: right; margin-top: 5px;">등록</button>
						<span>비밀댓글</span>
					<div class="rock2" style="position: relative; "><div style="display: inline-block;"><img id="img1" src="/images/rock1.PNG" style="width:13px;"></div>
   											 <div style="position: absolute; display: inline-block; left:0;"><img id="img2" src="/images/rock2.PNG" style="width:13px;"></div></div>
					</li>
				</ul>
				</div>

		</div>
	</section>
	<script>
	$(document).ready(function(){
        /*웹페이지 열었을 때*/
        $("#img1").show();
        $("#img2").hide();

        /*img1을 클릭했을 때 img2를 보여줌*/
        $("#img1").click(function(){
            $("#img1").hide();
            $("#img2").show();
        });

        /*img2를 클릭했을 때 img1을 보여줌*/
        $("#img2").click(function(){
            $("#img1").show();
            $("#img2").hide();
        });
    });
	
	function changeImg(){
		console.log("hello");
		$.ajax({
			type:"post",
			url:"http://localhost:8090/likes",
			data: {"user_id": $("#articleWriter").val(), "board_type" : "article", "board_no": ${article.fb_articleNo}},
			dataType:"text",
			success:function(data){
				if(data=="true"){
					console.log("true: " +data);
					$("#like").attr("src", "${pageContext.request.contextPath }/images/like.PNG");
				} else {
					console.log("false: " + data);
					$("#like").attr("src", "${pageContext.request.contextPath }/images/nolike.PNG");
				}
			}
		});			 
	}
	
	
	function alertpopup(){
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
				data: {"user_id": $("#articleWriter").val(), "board_type" : "article", "board_no": ${article.fb_articleNo}},
				dataType:"text",
				success:function(data){
					console.log(data);
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
	<%@include file="fotter.jsp"%>
</body>
</html>