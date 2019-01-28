<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsDelProc.jsp -->
<p>* 삭제 결과 *</p>
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	String passwd=request.getParameter("passwd").trim();
	String saveDir=application.getRealPath("/upload");
	
	dto.setPdsno(pdsno);
	dto.setPasswd(passwd);
	
	int res=dao.delete(pdsno, passwd, saveDir);
	
	if(res==0){
		out.print("<p>비밀번호가 일치하지 않습니다<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('삭제 성공');");
		out.print("  location.href='pdsList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");
		out.print("</script>");
	}
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>