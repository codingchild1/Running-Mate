<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
  <nav>
    <div>
    	<ul>
	        <li>
	          <c:choose>
	          	<c:when test="${empty id }">
		            <a id="login" href="menu?cpage=login">로그인</a>
	          	</c:when>
	          	<c:otherwise>
	          		<a id="logout" href="logout">로그아웃</a>
	          	</c:otherwise>
	          </c:choose>
	        </li>
	        <li class="nav-item">
	       	 <c:choose>
	          	<c:when test="${empty id }">
		            <a id="join" href="menu?cpage=join">회원가입</a>
	          	</c:when>
	          	<c:otherwise>
	          		<a id="mypage" href="menu?cpage=mypage">마이페이지</a>
	          	</c:otherwise>
	          </c:choose>
	        </li>
	      </ul>
    </div>
  </nav>
  <div style="width:100%;height:500px;align-content: center;">
 	 <jsp:include page='${cpage }.jsp'/>
  </div>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script>
	 let id = "<c:out value='${id}'/>";
	 let cpage = "<c:out value='${cpage}'/>";
	 let page_id='#'+cpage;
	 
	 if(id==null){
	   	if(cpage=="join"){
    		$('a').removeClass('active');
    		$(page_id).addClass('active');
	    } else {
	   		$('a').removeClass('active');
	   		$('#login').addClass('active');
	   	}
	 } else {
    	$('a').removeClass('active');
    	$(page_id).addClass('active');
	 }
  </script>
</body>
</html>