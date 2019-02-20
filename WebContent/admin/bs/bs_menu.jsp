<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bs_menu.jsp</title>
<base target="down">
</head>
<body>
<form name="bsfrm" method="post">
<table>
<tr>
  <td><strong>게/시/판/관/리</strong></td>
  <td>
    <input type="button" value="게시판 관리" onclick="move('bsList.jsp')">
  </td>
  <td>    
     <input type="button" value="포토갤러리 관리" onclick="move('pdsList.jsp')">
  </td>
</tr>
</table>
</form>

<script>
function move(file){
	document.bsfrm.action=file;
	document.bsfrm.submit();
}
</script>
</body>
</html>
