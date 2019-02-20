<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../pds/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>pdsDelProc.jsp</title>
	</head>
	
	<body>
	<%
	String checkRow[] = request.getParameterValues("checkRow");
	
	int res=dao.pdsDel(checkRow);
	
	if(res==0){ 
		out.print("<p>글 삭제 실패<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('글 삭제 성공');");
		out.print(" location.href='pdsList.jsp'");
		out.print("</script>");
	}
	%>
	</body>
</html>