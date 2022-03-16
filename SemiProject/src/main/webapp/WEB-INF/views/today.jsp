<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />


	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>오늘의러닝</title>

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
	width:1200px;
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
	text-align: center;
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
	display : inblock;
	text-align: center;
	flex:center;
}
#search{
	text-align: center;
}
.userProfile { width:35px; height:35px; }


</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<%-- <%@include file="slides.jsp"%>  --%>
		<!---------------헤더 : 오늘의런닝, 검색(formsearch), 글쓰기(button:todayMake)  -->

		<div class="outer">
			<div class="title" >
				<div>
					<h1 style="float:left; margin-top:25px; margin-bottom:55px;">오늘의 런닝</h1>
				</div>

				<table class="search" style="float:right; padding: 10px; margin: 20px auto;">
				<tr><td>
					<form action="/today_search" method="get">
<!-- 						<input class="" type="text" id="todaySearchText" name="todaySearchText"  style="width: 250px; height: 38px; font-color:white;" placeholder="Search" aria-label="Search" />
						<input class="btn btn-outline-secondary" type="submit" style="width: 30; height: 40px; padding: 6px 6px; margin: 7px; border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem;"value="검색"/>
						&nbsp&nbsp
						 -->
						<div style="display: flex; align-items: flex-end;">
							<div style="border: 1px solid; padding: 2px; width: 210px; margin-top: 20px;">
								<span><img class="search" src="images/search.png" style="width: 20px; height: 20px; float: left; margin-left: 5px; margin-top: 5px;"></span>
								<input class="search" id="todaySearchText" name="todaySearchText"  type="text"style="width: 170px; height: 30px; margin-left: 5px; border: none;"placeholder="키워드를 입력해보세요">
							</div>
								<input id="search2" type="submit" style="border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem; color: white; height: 38px; margin-left: 5px;" value="검색"; >
									
						</div>
				
				
					</form></td>
					<td>
					<c:choose>
						<c:when test="${id!=null}">
							<button id="todayMake" name="todayMake" type="submit" style="border: 1px solid #59ab6e; background-color: #59ab6e; border-radius: .25rem; color: white; height: 38px; margin-left: 5px; margin-top: 19px;">글쓰기</button>
						</c:when>
					</c:choose>						
					</td></tr>
				</table>
			</div>
			
			
			<div class="content">
				<!---------------페이지 내용------------------------------------------------ -->
				<c:choose>
					<c:when test="${todayList!=null && pageInfo.listCount>0 }">
						<div class="" id="container1"> 
									<!--1행 1열-->
									<c:forEach var="tboard" items="${todayList}">
										<div class=" mycard"	style="margin-bottom:40px;" >
										<!-- 회원이미지, 아이디, 날짜/시간 -->
										<header	class="">
											<div class="">
												<span class="col-lg">
													<span><img  style="border-radius: 70%;" src="/profileview/${profileImgMap[tboard.user_id]}" class="userProfile border" onerror="this.src='/profile/profile.png'" ></span> <span id="user_id">${tboard.user_id}</span>
												</span>
											</div>
											<span class="" id="today_date">${tboard.today_date}</span>
											 <input type="hidden" id="today_articleNo" name="today_articleNo" value="${tboard.today_articleNo}">
										</header>

										<!--타이틀-->
										<input class="todaytitle" id="today_title" style="text-overflow: ellipsis; border:none; width:150px; background-color:white;" value="${tboard.today_title }" disabled>
										<!--썸s네일-->
										<div class="bg-white">
													<a href="today_select/${tboard.today_articleNo}"><img src="/thumbfileview/${tboard.today_thumb}"
															id="today_thumb" name="today_thumb"  width="150px" height="150px" /></a>
										</div>

										<!-- 조회, 좋아요, 숫자 -->
										<div class="d-flex" ">
											<span class="d-flex justify-content-start">
												<img class="heart" src="images/하트.png" style="width: 30px; height: 30px;">
											</span>
											<span>
												<input type="text" id="today_likes" value='${tboard.today_likes}'
													style="width: 30px; display: inline-block; vertical-align: right; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;"
													disabled>&nbsp&nbsp&nbsp&nbsp&nbsp
											</span>
											<span class="d-flex justify-content-end" id="today_views">${tboard.today_views}
											</span>
										</div>
										</div>
									</c:forEach>
						</div>
					</c:when>
				</c:choose>
				
				
				
				<div id="paging" style="text-align: center; margin-top:30px; margin-bottom :30px;">
					<c:choose>
						<c:when test="${pageInfo.page<=1}">
							«&nbsp;
						</c:when>
						<c:otherwise>
						<a href="today?page=${pageInfo.page-1}">«&nbsp;</a>&nbsp;
						</c:otherwise>
					</c:choose>
					
					
					<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
						<c:choose>
							<c:when test="${pageInfo.page==i }">
							${i }&nbsp;</c:when>
							<c:otherwise>
								<a href="today?page=${i}">${i }&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					
					<c:choose>
						<c:when test="${pageInfo.page>=pageInfo.maxPage }">
							»&nbsp;
						</c:when>
						<c:otherwise>
						<a href="today?page=${pageInfo.page+1}">»&nbsp;</a>
						</c:otherwise>
					</c:choose>				
				</div>	
			</div>
			
		
		</div>
	<br>	<br>	<br>
	
	
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script>
		$(document).ready(function(){
			//console.log("${todayList[0].today_title}");
			$('#todayMake').on('click',function(){
				location.href="today_make";
			});


		});
		
	</script>
	 <%@include file ="fotter.jsp" %>
</body>
</html>