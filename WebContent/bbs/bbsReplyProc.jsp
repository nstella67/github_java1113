<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsReplyProc.jsp -->
<h3>* 답변쓰기 결과 *</h3>
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

	//3) tb_bbs 테이블에 저장하기
	int res=dao.reply(dto);

	//4) 글쓰기 성공 후 목록 페이지로 이동하기
	if(res==0){
		out.print("<p>답변 실패<p>");
		out.print("<p><a href='javascript:history.back();'>[다시시도]</a><p>");
	}else {
		out.print("<script>");
		out.print("  alert('답변글 성공');");
		out.print("  location.href='bbsList.jsp?col="+col+"&word="+word+"&nowPage="+nowPage+"';");
		out.print("</script>");
	}
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>