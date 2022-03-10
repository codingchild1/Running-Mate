<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/main.css">

<title>글 상세페이지</title>
<style>
.modify {
	float: right;
	font-size: 10px;
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


</style>

<script type="text/javascript">

</script>

<%@include file="header.jsp"%>
<%@include file="slides.jsp"%>
</head>
<body>
	<!-- 내용 -->
	<section class="a123">
		<div class="fb_detail">
			<div class="detail_title">
				<h2>${article.fb_title }</h2>
				<div class="detail_writer">
					<a href="#"><img src="images/마이페이지.PNG" width="20px"
						height="20px" alt="" />${article.writer }</a>
				</div>
				<div class="modify">
				
				<c:if test= "${id eq article.writer }" >	
				<%-- <c:when test= "${id  eq todayselect.user_id || id eq 'admin' }"> --%>
				<!-- 세션 id 랑 글 작성자가 같을 경우 -->
					<a href="fb_modify?fb_articleNo=${article.fb_articleNo}"> 수정 </a> 
					<a href="fb_delete?fb_articleNo=${article.fb_articleNo}&page=${page}"onclick="return confirm('정말 게시글을 삭제하시겠습니까?')"><span id="delete" style="float:right;">삭제</span></a>
				</c:if>
				</div>
				<div>
					<span id="detail_time" style="color: #A9A9A9; font-size: 12px;">${article.fb_date }</span>

				</div>

				<span class="views1">
					<input type="button" value="신고" class="warning"
						onclick="location.href='warning?fb_articleNo=${article.fb_articleNo}'"/>
						
					조회 ${article.fb_views }
						
				</span>

			</div>
		</div>

		<section id="line">
		<hr style="border: 1px color= silver; " width="100%">
		<table>
		<tr>
		<td>
			
			${article.fb_content }<br><br><br><br><br><br><br><br>
			</td>
			
		</tr>
		</table>
		</section>
		<section>
			<br><br><br><br><br><br><br><br>
			<a href="./fb_main?page=${page}"> [목록]</a>&nbsp;&nbsp;
		</section>
	</section>
	<%@include file="fotter.jsp"%>
</body>
</html>