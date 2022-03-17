<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<style>
	#modal.modal-overlay {
	z-index: 8;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	/* background: rgba(255, 255, 255, 0.25); */
	/* box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); */
	/* backdrop-filter: blur(1.5px); */
	/* -webkit-backdrop-filter: blur(1.5px); */
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}
 .ptplist {
	display: none;
} 
 .info:hover .ptplist {
	display: block;
} 
#modal .modal-window {
	background: #d3d3d3;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	/* backdrop-filter: none; */
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	/* height: 576px; */
	/* position: relative; */
	top: -100px;
	padding: 15px;
}
#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal .title h2 {
	display: inline;
}
#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}
#modal .content {
	padding: 0px 10px;
}
#modal2.modal-overlay {
	z-index: 8;
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: none;
}
#modal2 .modal-window {
	background: #d3d3d3;
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(50px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	/* height: 542px; */
	/* position: relative; */
	top: -100px;
	padding: 15px;
}
#modal2 .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
#modal2 .title h2 {
	display: inline;
}
#modal2 .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: black;
}
#modal2 .content {
	/* margin-top: 20px; */
	padding: 0px 10px;
/* 	text-shadow: 1px 1px 2px gray;
	color: white; */
}

	</style>
<!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
	<script>
		$(function() {
			var chkobj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "warningdelete";
			var valueArr = new Array();
			var list = $("input[name='RowCheck']");
			for(var i = 0; i<list.length; i++){
				if(list[i].checked){
					valueArr.push(list[i].value);
				}
			}
			if(valueArr.length == 0){
				alert("선택한 글이 없습니다.");
			}
			else {
				$.ajax({
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata){
						if(jdata=1){
							location.replace("warninglist")
						}
						else{
							alert("처리 실패");
						}
					}
				});
			}
		}
	</script>
	<style>
		.di{
			width: 60%;
		    justify-content: center;
		    margin: 130px auto;
		}
		.post li {
			float: left;
			margin: 10px;
			list-style: none;
		}
		.post {
			position: absolute;
			left: 25%;
			width: 1000px;
			margin-top: 51px;
			justify-content: space-between;
		}
		ul li a {
			text-decoration-line: none;
			color: black;
		}
	</style>
</head>
<body>
	<header>
			<%@include file ="header.jsp" %>
	</header>
		<div class="post">
			<ul>
				<li><a href="memberlist">회원 목록</a></li>
				<li><a href="warninglist"><b>신고 목록</b></a></li>
			</ul>
		</div>
		<div class="di">
	<h2>신고목록 조회</h2>
<table border=1 align="center" class="table table-hover"> 
<tr>
	<th>
	<input id="allCheck" class="form-check-input" type="checkbox" name="allCheck" />
	</th>
	<th scope="col">아이디</th>
	<th scope="col">게시물</th>
	<th scope="col">신고날짜</th>
	<th scope="col">횟수</th>
</tr>
<c:choose>
	<c:when test="${empty warninglist}">
	<tr>
		<td colspan="5">
			<b>등록된 회원이 없습니다.</b>
	</tr>
	</c:when>
	
	<c:when test="${!empty warninglist}">
		<c:forEach var='warning' items="${warninglist}">
			<tr class="table-active">
				<td scope="row"><input type="checkbox" name="RowCheck" value="${warning.warningid}"/></td>
    			<td scope="row">${warning.warningid}</td>
    			<c:choose>
    			<c:when test="${warning.boardtype eq 'today'}">
	 			<td scope="row"><a href="/today_select/${warning.boardno}">${warning.boardtype}</a></td>
	 			</c:when>
	 			<c:when test="${warning.boardtype eq 'route'}">
	 			<td scope="row"><a href="/routepost?articleNo=${warning.boardno}">${warning.boardtype}</a></td>
	 			</c:when>
	 			<c:when test="${warning.boardtype eq 'article'}">
	 			<td scope="row"><a href="/fb_detail?fb_articleNo=${warning.boardno}&page=1">${warning.boardtype}</a></td>
	 			</c:when>
	 			<c:otherwise>
	 			<td scope="row"><a href="#" onclick="detailModal('${groupandmate.no}','${groupandmate.type }')">${warning.boardtype}</a></td>
	 			</c:otherwise>
	 			</c:choose>
	 			<td scope="row">${warning.warningdate}</td>
	 			<td scope="row">${warning.warningcnt}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>	 
</table>
<form>
	<input type="button" class="btn btn-success" value="처리" onclick="deleteValue();" />
</form>
</div>

</body>
</html>
