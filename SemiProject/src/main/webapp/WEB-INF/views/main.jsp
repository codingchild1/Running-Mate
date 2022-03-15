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
    <style>
    .container2 {
	
	width: 1060px;
}
.register {
	width: 360px;
	height: 180px;
	padding: 8px 8px;
	background: white;
	color: #2b2e4a;
	font-size: 14px;
	margin: 14px;
	box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.2);
	display: inline-block;
	margin:30px;
}
.profile {
	width: 60px;
	height: 60px;
	border-radius: 70%;
}


body {
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.ptpimg{
	margin-top: 40px;
	
	display: inline-block;
}
    </style>
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
				<img src="${pageContext.request.contextPath }/thumb/${best.today_thumb }" class="card-img-top" alt="..." style="width: 100%; height: 400px"/>
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
            
            <div class="container2">
			<c:forEach items="${mates }" var="groupandmate">
				<div class="register">
					<div style="margin: 5px; padding: 5px; display: flex; align-items: center; justify-content: space-between;">
						<span><img class="profile" src='${groupandmate.img }'></span>
						<div style="width: 150px">
							<span><input type="text" id="title"value='${groupandmate.title }'style="width: 170px;height: 35px; vertical-align: middle; font-weight: bold; font-size: 18px; border: none; background-color: white; text-overflow: ellipsis;"disabled> </span> 
							<span><input type="text" id="id" value='${groupandmate.id }'style="height: 20px; vertical-align: middle; border: none; background-color: white;font-size: 17px;"disabled> </span>
						</div>
						<c:choose>
							<c:when test="${groupandmate.type eq 'g'}">
								<div style="display: inline-block;line-height: 30px;margin-bottom: 30px;">소모임</div>
							</c:when>
							<c:otherwise>
								<div style="display: inline-block;line-height: 30px;margin-bottom: 30px;">번개</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div style="margin: 5px; padding: 5px; vertical-align: middle;">
						<c:choose>
							<c:when test="${groupandmate.type eq 'g'}">
							<div class="ptpimg">
						 		<span><img class="heart" src="images/white.png"style="width: 30px; height: 30px;margin-bottom:17px;"></span> 
								<span><input type="text" id="like" value='${groupandmate.likeno }'style="width: 30px;  vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;color:white;"disabled></span>
							</div>
							</c:when>
							<c:otherwise>
							<div class="ptpimg">
								<span><img class="heart" src="images/ptp2.png"style="width: 30px; height: 30px;margin-bottom:17px;"></span> 
								<span><input type="text" id="like" value='${groupandmate.likeno }'style="width: 30px; display: inline-block; vertical-align: middle; margin-bottom: 20px; font-size: 15px; font-weight: bold; border: none; background-color: white;"disabled></span>
							</div>
							</c:otherwise>
						</c:choose>
					<button id="btn-modal" class="more"style="border: none; float: right; margin-top: 40px; background-color: white; color: rgba(var(- -f52, 142, 142, 142), 1); cursor: pointer;"><a href="mate_main">더보기</a></button>
						<input type="hidden" id="warning" name="warning" value='${groupandmate.warning}'>
						<input type="hidden" id="type" name="type" value='${groupandmate.type}'>
					</div>
				</div>
			</c:forEach>
		</div>
            <%-- <c:forEach items="${MateList }" var="mate">
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
                </c:forEach> --%>
                
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
    
    <%@include file ="fotter.jsp" %>
</body>
</html>