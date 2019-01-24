<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../member/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>memLevelProc.jsp</title>
	</head>
	
	<body>
	<%
	String id=request.getParameter("id");
	String mlevel=request.getParameter("mlevel");
	
	dto.setMlevel(mlevel);
	dto.setId(id);
	
	int res=dao.updateM(id, mlevel);
	
	if(res==0){ 
		out.print("<p>등급 변경 실패<p>");
		out.print("<p>"+id+"<p>");
		out.print("<p>"+mlevel+"<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('등급 변경 성공');");
		out.print(" location.href='memLevel.jsp'");
		out.print("</script>");
	}
	%>
	</body>
</html>