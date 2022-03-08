<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fb_delete</title>
<script type="text/javascript">
	function popupClose(form) {
		form.target = opener.name;
		
		form.submit();
		
		if(opener !=null) {
			opener.insert = null;
			
			self.close();
		}
	}
</script>
<style>
	.delete2{
		text-align: center;
		padding-top: 1em;
	}
	h1{
		padding: 1em 0 0 10px;
	}
</style>
</head>
<body>
<section>
<form name="deleteForm" action="fb_delete?fb_articleNo=${fb_articleNo}" method="post" target="fb_main">
<input type = "hidden" name = "page" value = '${page }'/>
<table>

<tr>
	<td class="delete2">
		<h1>정말로 삭제하시겠습니까?</h1>
		<input type="submit" value = "예" onclick="window.close()"/>
		&nbsp;&nbsp;
		<input type = "button" value = "아니오" onClick ="window.close()"/>
	</td>
</tr>
</table>
</form>
</section>
</body>
</html>