<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>Insert title here</title>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<!-- Start Content -->
	<%@include file ="header.jsp" %>
	<%@include file ="slides.jsp" %>
	
	<div class="container py-5">
		


			<div class="col-lg-1 border">첫번째컬럼</div>
			<!---------------헤더 : 오늘의런닝, 검색(formsearch), 글쓰기(button:todayMake)  -->
			<div class="col-lg-11 border">

				<div class="row">
					<div class="col-md-6">
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li class="list-inline-item">
								<h1 class="display-5 fw-bold">오늘의 런닝</h1>
							</li>
						</ul>
					</div>

					<div class="col-md-6 mt-2">
						<div class="d-flex">
							<ul class="list-inline shop-top-menu pb-3 pt-1">
								<li class="list-inline-item">
									<form class="d-flex" id="formsearch" name="formsearch"
										action="" method="post">
										<input class="form-control" type="search"
											style="width: 250px; height: 40px;" placeholder="Search"
											aria-label="Search" /> <i class="bi-search" type="submit"></i>
									</form>
								</li>
								<li class="list-inline-item">
									<button class="btn btn-outline-secondary" id="todayMake"
										name="todayMake" type="button"
										style="width: 80px; height: 40px;">글쓰기</button>
								</li>
							</ul>
						</div>
					</div>
				</div>


				<!---------------페이지 내용------------------------------------------------ -->
		<c:choose>
		<c:when test="${todayList!=null && pageInfo.listCount>0 }">
				<div class="col-lg-10 border">
					<section class="pt-4">
						<div class="container px-lg-4">
							
								<!--1행 1열-->
							<c:forEach var="tboard" items="${todayList }">
								<div class="col" style="width: 18rem; height: 18rem">
								
								<!-- 회원이미지, 아이디, 날짜/시간 -->
									<header	class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">
										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src=""
												class="col-lg-6 d-flex flex-row" />유저이미지 <span id="user_id">${tboard.user_id}</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">${tboard.today_date}</span>

									</header>

									<!--타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">${tboard.today_title }</div>
									<!--썸네일-->
									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />${tboard.today_thumb }
											</div>
										</div>
									</body>
									<!-- 조회, 좋아요, 숫자 -->
									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">${tboard.today_views}</span>
											</span>
										</div>
									</footer>
								</div>
						   </c:forEach>
								
								<!--1행2열-->
								<!-- Page Features-->
							<c:forEach var="tboard" items="${todayList }">
								<div class="col" style="width: 18rem; height: 18rem">
								
								<!-- 회원이미지, 아이디, 날짜/시간 -->
									<header	class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">
										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src=""
												class="col-lg-6 d-flex flex-row" />유저이미지 <span id="user_id">${tboard.user_id}아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">${tboard.today_date}날짜/시간</span>

									</header>

									<!--타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">${tboard.today_title }타이틀</div>
									<!--썸네일-->
									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />${tboard.today_thumb }
											</div>
										</div>
									</body>
									<!-- 조회, 좋아요, 숫자 -->
									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">${tboard.today_views}</span>
											</span>
										</div>
									</footer>
								</div>
						   </c:forEach>
								
						 
						 
								<!--1행3열-->
								<!-- Page Features-->
						<c:forEach var="tboard" items="${todayList }">
								<div class="col" style="width: 18rem; height: 18rem">
								
								<!-- 회원이미지, 아이디, 날짜/시간 -->
									<header	class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">
										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src=""
												class="col-lg-6 d-flex flex-row" />유저이미지 <span id="user_id">${tboard.user_id}아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">${tboard.today_date}날짜/시간</span>

									</header>

									<!--타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">${tboard.today_title }타이틀</div>
									<!--썸네일-->
									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />${tboard.today_thumb }
											</div>
										</div>
									</body>
									<!-- 조회, 좋아요, 숫자 -->
									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">${tboard.today_views}</span>
											</span>
										</div>
									</footer>
								</div>
						   </c:forEach>
								

							<!--여백사이즈-->
							<div class="row bg-white" style="height: 5rem">&nbsp</div>
							
								<!--2행 1열-->
							<c:forEach var="tboard" items="${todayList }">
								<div class="col" style="width: 18rem; height: 18rem">
								
								<!-- 회원이미지, 아이디, 날짜/시간 -->
									<header	class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">
										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src=""
												class="col-lg-6 d-flex flex-row" />유저이미지 <span id="user_id">${tboard.user_id}아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">${tboard.today_date}날짜/시간</span>

									</header>

									<!--타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">${tboard.today_title }타이틀</div>
									<!--썸네일-->
									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />${tboard.today_thumb }
											</div>
										</div>
									</body>
									<!-- 조회, 좋아요, 숫자 -->
									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">${tboard.today_views}</span>
											</span>
										</div>
									</footer>
								</div>
						   </c:forEach>
								
								
								<!--2행2열-->
								<!-- Page Features-->
							<c:forEach var="tboard" items="${todayList }">
								<div class="col" style="width: 18rem; height: 18rem">
								
								<!-- 회원이미지, 아이디, 날짜/시간 -->
									<header	class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">
										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src=""
												class="col-lg-6 d-flex flex-row" />유저이미지 <span id="user_id">${tboard.user_id}아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">${tboard.today_date}날짜/시간</span>

									</header>

									<!--타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">${tboard.today_title }타이틀</div>
									<!--썸네일-->
									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />${tboard.today_thumb }
											</div>
										</div>
									</body>
									<!-- 조회, 좋아요, 숫자 -->
									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">${tboard.today_views}</span>
											</span>
										</div>
									</footer>
								</div>
						   </c:forEach>
								
						 
						 
								<!--2행3열-->
								<!-- Page Features-->
							<c:forEach var="tboard" items="${todayList }">
								<div class="col" style="width: 18rem; height: 18rem">
								
								<!-- 회원이미지, 아이디, 날짜/시간 -->
									<header	class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">
										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src=""
												class="col-lg-6 d-flex flex-row" />유저이미지 <span id="user_id">${tboard.user_id}아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">${tboard.today_date}날짜/시간</span>

									</header>

									<!--타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">${tboard.today_title }타이틀</div>
									<!--썸네일-->
									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />${tboard.today_thumb }
											</div>
										</div>
									</body>
									<!-- 조회, 좋아요, 숫자 -->
									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">${tboard.today_views}</span>
											</span>
										</div>
									</footer>
								</div>
						   </c:forEach>
								

							<!--여백사이즈-->
							<div class="row bg-white" style="height: 5rem">&nbsp</div>
					</div>		
				</section>
			</div>				
	<!--페이징-->
		<section id="pageList">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[pre]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="boardlist?page=${pageInfo.page-1}">[pre]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">[${i }]</c:when>
					<c:otherwise>
						<a href="boardlist?page=${i}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[next]
				</c:when>
				<c:otherwise>
					<a href="boardlist?page=${pageInfo.page+1}">[next]</a>
				</c:otherwise>
			</c:choose>
		</section>
	</c:when>	
	<c:otherwise>
		<section id="emptyArea">등록된 글이 없습니다.</section>
	</c:otherwise>
	</c:choose>
	
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
	<%@include file ="fotter.jsp" %>
	
</body>
</html>