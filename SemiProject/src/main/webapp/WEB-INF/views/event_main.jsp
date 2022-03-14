<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.container1 {
	margin: 20px;
	width: 1060px;
}
</style>

<title>Insert title here</title>
</head>
	<div>
		<c:choose>
		<c:when test="${id='admin04'}">
			<button class="btn btn-outline-secondary" id="eventMake" name = "eventMake" type="button" style="float:right; width:80px; height:40px;">글쓰기</button>
		 </c:when>
	</c:choose>	
	</div>
	
	<div class="content">
<%-- 		<c:choose>
			<c:when test="${eventList !=null && pageInfo.listCount>0}">
				<div class="container1">
					<c:forEach var="bboard" items="${eventList} varStatus="status">
						<div>
							<c:if test = "${status.index<3}">
							${satus.index}
							<hr>							
							</c:if>
							
							<c:if test = "${status.index>2 && status.index<7}">
							${satus.index}
							<hr>							
							</c:if>
							
							<c:if test = "${status.index>6 && status.index<11}">
							${satus.index}
							<hr>							
							</c:if>
							
							<c:if test = "${status.index>10 && status.index<15}">
							${satus.index}
							<hr>							
							</c:if>
							
						</div>
					</c:forEach>
				</div>
				</c:when>
		</c:choose> --%>
		
		
		ㄴㅁㅇㄻㄴㅇㄻㄴㅇㄹㄴㅁㅇㄹ
	</div>
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

<body>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</body>
</html>