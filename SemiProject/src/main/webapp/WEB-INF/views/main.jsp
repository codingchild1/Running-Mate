<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script type="text/javascript" src="js/main.js"></script>
</head>
<body>
<%@include file ="header.jsp" %>
<%@include file ="slides.jsp" %>
	 <!-- 최고의 러너 -->

    <!-- Start Featured Product -->
    <section>
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">최고의 러너</h1>
                    <p>

                    </p>
                </div>
            </div>
            <div class="row">

<c:forEach items="${BestList }" var="best">
	<div class="col-12 col-md-4 mb-4">
		<div class="card h-100">
			<a href="#">
				<img src="${pageContext.request.contextPath }/upload/${best.today_thumb }" class="card-img-top" alt="...">
			</a>
			<div class="card-body">
				<p class="card-text">
					${best.today_title }
				</p>
				<p class="text-muted">
					♥ (${best.today_likes })
				</p>
			</div>
		</div>
	</div>
</c:forEach>
			
 

                
            </div>
        </div>
    </section>
    <!-- End Featured Product -->


    <!-- 메이트 구하기 -->

     <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">번개 모임</h1>
                    <p>

                    </p>
                </div>
            </div>
            <div class="row">
            
            <c:forEach items="${MateList }" var="mate">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <div>
                            <"${mate.mate_mapinfo }"  >
                        </div>
                        <div class="card-body">

                            
                            <p class="card-text">
                                ${mate.mate_title }
                            </p>
                            <p class="text-muted">
					(${mate.mate_like })
				</p>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
    
    <%@include file ="fotter.jsp" %>
</body>
</html>