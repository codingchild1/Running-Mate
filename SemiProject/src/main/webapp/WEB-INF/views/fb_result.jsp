<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>자유게시판</title>

<style>
html {
	overflow: scorll;
}

h1, h2, a, form, table, caption, thead, tbody, tr, th, td, submit {
	margin: 0;
	outline: 0;
	border: 0;
	padding: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}

h1, h2, h3 {
	font-size: 1.5em;
}

p {
	margin: 0;
	padding: 0;
}

input {
	vertical-align: middle;
}

input:focus {
	outline: 0;
}

caption {
	display: none;
	width: 0;
	height: 0;
	margin-top: -1px;
	overflow: hidden;
	visibility: hidden;
	font-size: 0;
	line-height: 0;
}

.container2 {
	max-width: 1024px;
	margin: 30px auto;
}

.board_list {
	width: 100%;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc;
	margin: 15px 0;
	border-collapse: collapse;
}

.board_list thead th:first-child {
	background-image: none;
}

.board_list thead th {
	border-bottom: 1px solid #ccc;
	padding: 13px 0;
	color: #3b3a3a;
	text-align: center;
	vertical-align: middle;
}

.board_list tbody td {
	border-top: 1px solid #ccc;
	padding: 13px 0;
	text-align: center;
	vertical-align: middle;
}

.board_list tbody tr:first-child td {
	border: none;
}

.board_list tbody tr:hover {
	background: #ffff99;
}

.board_list tbody td.title {
	text-align: center;
	padding-left: 20px;
	padding-right: 18px;
}

.board_list tbody td a {
	display: inline-block
}

.board_detail {
	width: 100%;
	border-top: 2px solid #252525;
	border-bottom: 1px solid #ccc;
	border-collapse: collapse;
}

.board_detail tbody input {
	width: 100%;
}

.board_detail tbody th {
	text-align: left;
	background: #f7f7f7;
	color: #3b3a3a;
	vertical-align: middle;
	text-align: center;
}

.board_detail tbody th, .board_detail tbody td {
	padding: 10px 15px;
	border-bottom: 1px solid #ccc;
}

.board_detail tbody textarea {
	width: 100%;
	min-height: 500px
}

.btn2 {
	margin: 5px;
	padding: 5px 11px;
	color: #fff !important;
	display: inline-block;
	background-color: #7D7F82;
	vertical-align: middle;
	border-radius: 0 !important;
	cursor: pointer;
	border: none;
}

.btn2:hover {
	background: #6b9ab8;
}

a {
	text-decoration-line: none;
}

#pageList {
	margin: auto;
	width: 1000px;
	text-align: center;
}

.writebtn {
	text-align: right;
}
</style>

</head>
<body>

	<%@include file="header.jsp"%>
	<%@include file="slides.jsp"%>

	<Section class="top">
		<div class="container2">
			<div class="d-flex justify-content-center"><h2>게시글 목록</h2></div>
			<c:choose>
				<c:when test="${articleList!=null && pageInfo.listCount>0 }">
					<table class="board_list">
						<colgroup>
							<col width="*%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articleList }">
								<tr>

									<td><a
										href="./fb_detail?fb_articleNo=${article.fb_articleNo}&page=${pageInfo.page}">
											${article.fb_title} </a></td>
									<td>${article.writer }</td>
									<td>${article.fb_date }</td>
									<td>${article.fb_views }</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<section id=pageList>
						<c:choose>
							<c:when test="${pageInfo.page<=1}">
					«&nbsp;
				</c:when>
							<c:otherwise>
								<a href="fb_result?column=${column}&keyword=${keyword}&page=${pageInfo.page-1}">«&nbsp;</a>
				</c:otherwise>
						</c:choose>
						<c:forEach var="i" begin="${pageInfo.startPage }"
							end="${pageInfo.endPage }">
							<c:choose>
								<c:when test="${pageInfo.page==i }">${i }&nbsp;</c:when>
								<c:otherwise>
									<a href="fb_result?column=${column}&keyword=${keyword}&page=${i}">${i }&nbsp;</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					»&nbsp;
				</c:when>
							<c:otherwise>
								<a href="fb_result?column=${column}&keyword=${keyword}&page=${pageInfo.page+1}">»&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</section>
				</c:when>
				<c:otherwise>
					<section id="emptyArea" style="text-align: center;">등록된 글이 없습니다.</section>
				</c:otherwise>
			</c:choose>
			
			<div class="search">
				<form action="/fb_result" method="get">
				<div style="display: flex; justify-content: center;">
					<select name="column" style="margin-left: 10px;">
					    <option value="fb_title">제목</option>
					    <option value="writer">작성자</option>
					    <option value="fb_content">내용</option>
					</select>
					<input type="text" name="keyword" placeholder="검색어를 입력하세요" style="margin-left: 10px;">
					<input type="submit" value="검색" style="margin-left: 10px;background-color: #59ab6e;color: white;border: 1px solid #59ab6e">
					</div>
				</form>
			</div>
			
			
			<div class="writebtn">
				<c:if test="${!empty id }">
					<button class="btn btn-success"
						onclick="location.href='fb_writing';">글 쓰기</button>
				</c:if>
			</div>
		</div>
		
	</Section>
	<%@include file="fotter.jsp"%>


</body>
</html>