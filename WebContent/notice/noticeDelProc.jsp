<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeReplyProc.jsp -->
<h3>* 글 삭제 결과 *</h3>
<% 
	String passwd=request.getParameter("passwd").trim();
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));

	dto.setNoticeno(noticeno);
	dto.setPasswd(passwd);

	int res=dao.noticeDel(dto);

	if(res==0){
		out.print("<p>삭제 실패<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('삭제 성공');");
		out.print("  location.href='noticeList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");
		out.print("</script>");
	}
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>