<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../notice/ssi.jsp" %>
<%@ include file="../../Admin_header.jsp" %>	
	<%
	String checkRow[] = request.getParameterValues("checkRow");
	
	int res=dao.notDel(checkRow);
	
	if(res==0){ 
		out.print("<p>글 삭제 실패<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('글 삭제 성공');");
		out.print(" location.href='notList.jsp'");
		out.print("</script>");
	}
	%>
<%@ include file="../../Admin_footer.jsp" %>