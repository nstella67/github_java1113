<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>



<!-- 본문 시작 bbsIns.jsp -->
<% 
	//1) 사용자가 입력한 정보를 변수에 담기
	String wname  =request.getParameter("wname").trim();
	String subject=request.getParameter("subject").trim();
	String content=request.getParameter("content").trim();
	String passwd =request.getParameter("passwd").trim();
	String ip     =request.getRemoteAddr();	//요청PC의 IP

	//2) 1)의 값을 dto객체에 담기
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setPasswd(passwd);
	dto.setIp(ip);

	//3) tb_bbs 테이블에 저장하기
	int res=dao.insert(dto);

	//4) 글쓰기 성공 후 목록 페이지로 이동하기
	if(res==0){
		  out.print("글쓰기 실패<br/>");
		  out.print("<a href='javascript:history.back();'>[다시시도]</a>");
		}
		else {
		  out.print("<script>");
		  out.print("  alert('글쓰기 성공');");
		  out.print("  window.location='bbsList.jsp';");
		  out.print("</script>");
		}
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>