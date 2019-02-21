<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>not_menu.jsp</title>
<base target="down">
</head>
<body>
<form name="notfrm" method="post">
<table>
<tr>
  <td><strong>공/지/사/항/관/리</strong></td>
  <td>
    <input type="button" value="수정/삭제" onclick="move('notList.jsp')">
  </td>
  <td>    
     <input type="button" value="공지사항 작성" onclick="move('notForm.jsp')">
  </td>
</tr>
</table>
</form>

<script>
function move(file){
	document.notfrm.action=file;
	document.notfrm.submit();
}
</script>
</body>
</html>
