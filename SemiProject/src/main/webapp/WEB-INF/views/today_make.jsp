<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />


<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>Insert title here</title>

</style>
<!DOCTYPE html>
<html>
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
		<div class="row">


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
				<div class="col-lg-10 border">
					<section class="pt-4">
						<div class="container px-lg-4">
							<div class="row">
								<!--1행 1열-->
								<div class="col" style="width: 18rem; height: 18rem">
									<header
										class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">

										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src="${pageContext.request.contextPath}/resources/img/1.gif"
												class="col-lg-6 d-flex flex-row" /> <span id="user_id">아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">날짜/시간</span>

									</header>

									<!--두번째 row : 타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">타이틀</div>

									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<!--세번째 row : 썸네일-->
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />
											</div>

											<h></h>
										</div>
									</body>

									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">숫자</span>
											</span>
										</div>
									</footer>
								</div>

								<!--1행2열-->
								<!-- Page Features-->
								<div class="col" style="width: 18rem; height: 18rem">
									<header
										class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">

										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src="${pageContext.request.contextPath}/resources/img/1.gif"
												class="col-lg-6 d-flex flex-row" /> <span id="user_id">아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">날짜/시간</span>

									</header>

									<!--두번째 row : 타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">타이틀</div>

									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<!--세번째 row : 썸네일-->
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />
											</div>

											<h></h>
										</div>
									</body>

									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">숫자</span>
											</span>
										</div>
									</footer>
								</div>

								<!--1행3열-->
								<!-- Page Features-->
								<div class="col" style="width: 18rem; height: 18rem">
									<header
										class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">

										<div class="d-flex justify-content-start">
											<span class="col-lg"> <img
												src="${pageContext.request.contextPath}/resources/img/1.gif"
												class="col-lg-6 d-flex flex-row" /> <span id="user_id">아이디</span>
											</span>
										</div>
										<span class="col-lg d-flex justify-content-end"
											id="today_date" name="today_name">날짜/시간</span>

									</header>

									<!--두번째 row : 타이틀-->
									<div class="d-inline-block d-flex justify-content-start border"
										id="today_title" name="today_title">타이틀</div>

									<body class="card bg-white border-0 h-100">
										<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
											<div
												class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<!--세번째 row : 썸네일-->
												<img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													id="today_thumb" name="today_thumb" />
											</div>

											<h></h>
										</div>
									</body>

									<footer>
										<div class="card bg-white border h-100">
											<span class="col-lg d-flex justify-content-start"> <i
												class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
											</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

												<span class="d-flex justify-content-end align-bottom"
												id="today_views" name="today_views">숫자</span>
											</span>
										</div>
									</footer>
								</div>

								<!--여백사이즈-->
								<div class="row bg-white" style="height: 5rem">&nbsp</div>
							</div>

							<div class="container px-lg-4">
								<div class="row">

									<!--2행 1열-->
									<div class="col" style="width: 18rem; height: 18rem">
										<header
											class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">

											<div class="d-flex justify-content-start">
												<span class="col-lg"> <img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													class="col-lg-6 d-flex flex-row" /> <span id="user_id">아이디</span>
												</span>
											</div>
											<span class="col-lg d-flex justify-content-end"
												id="today_date" name="today_name">날짜/시간</span>

										</header>

										<!--두번째 row : 타이틀-->
										<div
											class="d-inline-block d-flex justify-content-start border"
											id="today_title" name="today_title">타이틀</div>

										<body class="card bg-white border-0 h-100">
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<div
													class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
												<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
													<!--세번째 row : 썸네일-->
													<img
														src="${pageContext.request.contextPath}/resources/img/1.gif"
														id="today_thumb" name="today_thumb" />
												</div>

												<h></h>
											</div>
										</body>

										<footer>
											<div class="card bg-white border h-100">
												<span class="col-lg d-flex justify-content-start"> <i
													class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
												</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

													<span class="d-flex justify-content-end align-bottom"
													id="today_views" name="today_views">숫자</span>
												</span>
											</div>
										</footer>
									</div>

									<!--2행2열-->
									<!-- Page Features-->
									<div class="col" style="width: 18rem; height: 18rem">
										<header
											class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">

											<div class="d-flex justify-content-start">
												<span class="col-lg"> <img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													class="col-lg-6 d-flex flex-row" /> <span id="user_id">아이디</span>
												</span>
											</div>
											<span class="col-lg d-flex justify-content-end"
												id="today_date" name="today_name">날짜/시간</span>

										</header>

										<!--두번째 row : 타이틀-->
										<div
											class="d-inline-block d-flex justify-content-start border"
											id="today_title" name="today_title">타이틀</div>

										<body class="card bg-white border-0 h-100">
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<div
													class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
												<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
													<!--세번째 row : 썸네일-->
													<img
														src="${pageContext.request.contextPath}/resources/img/1.gif"
														id="today_thumb" name="today_thumb" />
												</div>

												<h></h>
											</div>
										</body>

										<footer>
											<div class="card bg-white border h-100">
												<span class="col-lg d-flex justify-content-start"> <i
													class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
												</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

													<span class="d-flex justify-content-end align-bottom"
													id="today_views" name="today_views">숫자</span>
												</span>
											</div>
										</footer>
									</div>

									<!--2행 3열-->
									<!-- Page Features-->
									<div class="col" style="width: 18rem; height: 18rem">
										<header
											class="d-flex border feature bg-white bg-gradient rounded-3 mb-4 mt-n4">

											<div class="d-flex justify-content-start">
												<span class="col-lg"> <img
													src="${pageContext.request.contextPath}/resources/img/1.gif"
													class="col-lg-6 d-flex flex-row" /> <span id="user_id">아이디</span>
												</span>
											</div>
											<span class="col-lg d-flex justify-content-end"
												id="today_date" name="today_name">날짜/시간</span>

										</header>

										<!--두번째 row : 타이틀-->
										<div
											class="d-inline-block d-flex justify-content-start border"
											id="today_title" name="today_title">타이틀</div>

										<body class="card bg-white border-0 h-100">
											<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
												<div
													class="feature bg-primary bg-gradient text-white rounded-3 mb-4 mt-n4"></div>
												<div class="card-body text-center p-4 p-lg-5 pt-0 pt-lg-0">
													<!--세번째 row : 썸네일-->
													<img
														src="${pageContext.request.contextPath}/resources/img/1.gif"
														id="today_thumb" name="today_thumb" />
												</div>

												<h></h>
											</div>
										</body>

										<footer>
											<div class="card bg-white border h-100">
												<span class="col-lg d-flex justify-content-start"> <i
													class="bi bi-heart"></i>&nbsp <i class="bi bi-chat"></i>
												</span> <span class="col-lg d-flex justify-content-end">조회&nbsp

													<span class="d-flex justify-content-end align-bottom"
													id="today_views" name="today_views">숫자</span>
												</span>
											</div>
										</footer>
									</div>

									<!--여백사이즈-->
									<div class="row bg-white" style="height: 5rem">&nbsp</div>
								</div>



								<div div="row">
									<ul class="pagination pagination-lg justify-content-end">
										<li class="page-item disabled"><a
											class="page-link active rounded-0 mr-3 shadow-sm border-top-0 border-left-0"
											href="#" tabindex="-1">1</a></li>
										<li class="page-item"><a
											class="page-link rounded-0 mr-3 shadow-sm border-top-0 border-left-0 text-dark"
											href="#">2</a></li>
										<li class="page-item"><a
											class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark"
											href="#">3</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script>
		$(function(){
			$("#todayMake").click(function(){
				let id = $('#user_id').val();
				if(id == ''){
					alert("로그인 먼저 진행해주세요");
				}else{
					console.log("값넘기는거확인1");
					return "today_make";
				}
			});
		});
	</script>
	<%@include file ="fotter.jsp" %>
	
</body>
</html>