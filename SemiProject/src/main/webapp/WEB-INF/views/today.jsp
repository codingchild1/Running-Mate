<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>Insert title here</title>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.profile {
	width: 50px;
	height: 50px;
	border-radius: 70%;
}
body {
	margin: 0 auto;
}
.outer {
	width:1100px;
	margin: 0 auto;
}
.content {
	width:1100px;
	height: 700px;
	margin: 0 auto;
}
.title {
	width:1100px;
	margin: 0 auto;
}
#to-title {
	text-align: center;
}
.cards {
	width:1100px;
	margin: 0 auto;
}
/* .register {
	width: 350px;
	height: 350px;
	padding: 8px 8px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	margin: 14px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
	display: inline-block;
} */
#container1 {
	width:820px;
	margin: 0 auto;
	height: 700px;
	padding-top: 50px;
}

.mycard {
            width: 250px;
            height: 250px;
            margin: 10px;
            float: left;
}
.mycard:nth-child(3n+1) {
        clear: both;
}
#paging {
	width:820px;
	margin: 0 auto;
	text-align: center;
}

.search {
	text-align: center;
}
</style>
</head>
<body>

	<%@include file="slides.jsp"%> 


		<!---------------헤더 : 오늘의런닝, 검색(formsearch), 글쓰기(button:todayMake)  -->
		<!-- <div class="col-lg-11 center border"> -->
		<div class="outer">

			<div class="title">
				<div>
					<h1 class="display-5 fw-bold" id="to-title">오늘의 런닝</h1>
				</div>

				<div class="search">
						<input class="" type="text"	style="width: 250px; height: 40px;" placeholder="Search" aria-label="Search" />
						<button class="btn btn-outline-secondary" id="todaySearch" name="todayMake" type="button" style="width: 80px; height: 40px;">검색</button>
						&nbsp&nbsp
						<button class="btn btn-outline-secondary" id="todayMake" name="todayMake" type="button" style="width: 80px; height: 40px;">글쓰기</button>
				</div>
			</div>
			<div class="content">
				<!---------------페이지 내용------------------------------------------------ -->
				<c:choose>
					<c:when test="${todayList!=null && pageInfo.listCount>0 }">
						<div class="" id="container1"> 
									<!--1행 1열-->
									<c:forEach var="tboard" items="${todayList}">
										<div class="border mycard" >

										<!-- 회원이미지, 아이디, 날짜/시간 -->
										<header	class="border">
											<div class="">
												<span class="col-lg">
													<span><img class="profile" src='images/user_icon_1.png' width=10px height=10px>i</span> <span id="user_id">${tboard.user_id}</span>
												</span>
											</div>
											<span class="" id="today_date">${tboard.today_date}</span>
											 <input type="hidden" id="today_articleNo" name="today_articleNo" value="${tboard.today_articleNo}">
										</header>

										<!--타이틀-->
										<div class="border" id="today_title">${tboard.today_title }</div>
										<!--썸네일-->
										<section class="bg-white">
													<a href="today_select/${tboard.today_articleNo}"><img src="/thumbfileview/${tboard.today_thumb}"
															id="today_thumb" name="today_thumb"  width="120px" height="120px" /></a>
										</section>

										<!-- 조회, 좋아요, 숫자 -->
										<footer class="d-flex">
											<span class="d-flex justify-content-start">
												<img class="heart" src="images/하트.png" style="width: 30px; height: 30px;">
											</span>
											<span>
												<input type="text" id="today_likes" value='${tboard.today_likes}'
													style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;"
													disabled>
											</span>
											<span class="d-flex justify-content-end" id="today_views">${tboard.today_views}
											</span>
										</footer>
										</div>
									</c:forEach>
						</div>
					</c:when>
				</c:choose>
				<div id="paging">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
							[pre]&nbsp;
						</c:when>
						<c:otherwise>
						<a href="today?page=${pageInfo.page-1}">[pre]</a>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">[${i }]</c:when>
							<c:otherwise>
								<a href="today?page=${i}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						[next]
						</c:when>
						<c:otherwise>
						<a href="today?page=${pageInfo.page+1}">[next]</a>
						</c:otherwise>
					</c:choose>				
				</div>	
			</div>
			
		
		</div>
	<br>	<br>	<br>
	
		
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
	console.log(${pageInfo.page});
/* 		$(function(){
			$("#todayMake").click(function(){
				let id = $('#user_id').val();
				if(id == ''){
					alert("로그인 먼저 진행해주세요");
				}else{
					console.log("값넘기는거확인1");
					return "today_make";
				}
			});
		}); */
		
		$(document).ready(function(){
			$('#todayMake').on('click',function(){
				location.href="today_make";
			});
			

		});
		

	</script>
		<%@include file="fotter.jsp"%>
</body>
</html>