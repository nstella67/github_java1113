<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsUpdateProc.jsp -->
<h3>* 수정 결과 *</h3>
<% 
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String wname  =request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String passwd =request.getParameter("passwd").trim();
	String ip     =request.getRemoteAddr();	//요청PC의 IP

	dto.setBbsno(bbsno);
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);

	int res=dao.update(dto);

	if(res==0){
		out.print("<p>수정 실패<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('수정 성공');");
		out.print("  location.href='bbsList.jsp?col="+col+"&word="+word+"';");
		out.print("</script>");
	}
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>