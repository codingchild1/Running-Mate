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
				var chk = confirm("정말 삭제하시겠습니까?");
				$.ajax({
					url: url,
					type: 'POST',
					traditional: true,
					data: {
						valueArr: valueArr
					},
					success: function(jdata){
						if(jdata=1){
							alert("삭제 성공");
							location.replace("warninglist")
						}
						else{
							alert("삭제 실패");
						}
					}
				});
			}
		}
	</script>
</head>
<body>
	<header>
			<%@include file ="header.jsp" %>
	</header>
		<div>
			<ul>
				<li><a href="memberlist">회원 목록</a></li>
				<li><a href="warninglist"><b>신고 목록</b></a></li>
			</ul>
		</div>
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
	 			<td scope="row"><a href="http://www.naver.com">${warning.boardtype}</a></td>
	 			<td scope="row">${warning.warningdate}</td>
	 			<td scope="row">${warning.warningcnt}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>	 
</table>
<form>
	<input type="button" class="btn btn-success" value="삭제" onclick="deleteValue();" />
</form>
</body>
</html>
