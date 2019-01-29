<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 Search_pwProc.jsp -->
	<h3>* 비번 찾기 결과 *</h3>
<%
	String id=request.getParameter("id").trim();
	String mname=request.getParameter("mname").trim();
	String email=request.getParameter("email").trim();

	dto.setMname(mname);
	dto.setEmail(email);

	String passwd=dao.pwsearch(mname, email);

	if(passwd==null){
		out.print("<script>");
		out.print("  alert('이름/메일 다시 한번 확인해주세요');");
		out.print("	history.back();");
		out.print("</script>");
	}else {
		//조회 성공했다면
		out.print("<p>"+email+"로 임시비밀번호를 전송하였습니다"+"</p>");
		out.print("<p> 다른 이메일로 받으려면 아래에 입력해주세요 </p>");
%>
<form method="get" action="Search_pwUpdate.jsp">
	<table>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" size="50"></td>
			<td>
				<input type="submit" value="확인"></td>
		</tr>
	</table>
</form>
<%
	}
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>