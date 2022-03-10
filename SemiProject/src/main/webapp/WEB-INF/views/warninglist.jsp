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
	<h2>회원목록 조회</h2>
<table border=1 > 
<tr>
	<th>
	<input id="allCheck" type="checkbox" name="allCheck" />
	</th>
	<th>아이디</th>
	<th>게시물</th>
	<th>신고날짜</th>
	<th>횟수</th>
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
			<tr>
				<td><input type="checkbox" name="RowCheck" value="${warning.warningid}"/></td>
    			<td>${warning.warningid}</td>
	 			<td><a href="http://www.naver.com">${warning.boardtype}</a></td>
	 			<td>${warning.warningdate}</td>
	 			<td>${warning.warningcnt}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>	 
</table>
<form>
	<input type="button" value="삭제" onclick="deleteValue();" />
</form>
</body>
</html>
