<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fb_delete</title>
</head>
<body>
<section id = "passForm">
        <!-- <form name="deleteForm" action="boarddelete?board_num=${board_num}" method="post"> -->
        <input type = "hidden" name = "page" value = '${page }'/>
        <table>
        <tr>
            <td>
                <input type="submit" value = "삭제"/>
                &nbsp;&nbsp;
                <input type = "button" value = "돌아가기" onClick ="javascript:history.go(-1)"/>
            </td>
        </tr>
        </table>
        <!-- </form> -->
        </section>
</body>
</html>