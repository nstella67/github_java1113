<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 memberProc.jsp -->
<% 
	//1) 사용자가 입력한 정보를 변수에 담기
	String id  =request.getParameter("id").trim();
	String passwd=request.getParameter("passwd").trim();
	String mname=request.getParameter("mname").trim();
	String email =request.getParameter("email").trim();
	String tel =request.getParameter("tel").trim();
	String zipcode =request.getParameter("zipcode").trim();
	String address1 =request.getParameter("address1").trim();
	String address2 =request.getParameter("address2").trim();
	String job =request.getParameter("job").trim();

	//2) 1)의 값을 dto객체에 담기
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setMname(mname);
	dto.setEmail(email);
	dto.setTel(tel);
	dto.setZipcode(zipcode);
	dto.setAddress1(address1);
	dto.setAddress2(address2);
	dto.setJob(job);

	//3) tb_bbs 테이블에 저장하기
	int res=dao.insert(dto);

	//4) 글쓰기 성공 후 목록 페이지로 이동하기
	if(res==0){
		  out.print("회원가입 실패<br/>");
		  out.print("<a href='javascript:history.back();'>[다시시도]</a>");
		}
		else {
		  out.print("<script>");
		  out.print("  alert('회원가입 성공');");
		  out.print("  window.location='loginForm.jsp';");
		  out.print("</script>");
		}
%>
<!-- 본문 끝 -->


<%@ include file="../footer.jsp" %>