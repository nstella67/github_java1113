<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsUpdateProc.jsp -->
<h3>* 수정 결과 *</h3>
<% 
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
	String nid  =request.getParameter("nid").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String passwd =request.getParameter("passwd").trim();
	
	dto.setNoticeno(noticeno);
	dto.setNid(nid);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	int res=dao.noticeupdate(dto);
	///////////////////////////

	if(res==0){ 
		out.print("<p>수정 실패<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('수정 성공');");
		out.print("  location.href='noticeList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");
		out.print("</script>");
	}
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>