<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file ="header.jsp" %>
    <section id = "writeForm">
        <h2>게시판글수정</h2>
        <!-- <form action="boardmodify" method="post" name = "modifyform"> -->

        <!-- <input type = "hidden" name = "board_num" value = "${article.board_num}"/> -->

        <table>
            <tr>
                <td class="td_left">
                    <label for = "fb_title">제 목</label>
                </td>
                <td class="td_right">
                    <input name="fb_title" type="text" id = "fb_title" value = "${article.fb_title}"/>
                </td>
            </tr>
            <tr>
                <td class="td_left">
                    <label for = "fb_content">내 용</label>
                </td>
                <td>
                    <textarea id = "fb_content" name="fb_content" cols="40" rows="15">${article.fb_content}</textarea>
                </td>
            </tr>
        </table>
            <section id = "commandCell">
                    <a href="javascript:modifyboard()">[수정]</a>&nbsp;&nbsp;
                    <a href="javascript:history.go(-1)">[뒤로]</a>
                    
            </section>
        <!-- </form> -->
        </section>
        
</body>
</html>