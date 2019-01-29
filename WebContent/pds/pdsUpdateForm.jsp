<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsUpdateForm.jsp -->
<p>* 수정 *</p>
<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	String passwd=request.getParameter("passwd").trim();

	dto.setPdsno(pdsno);
	dto.setPasswd(passwd);

	dto=dao.updateform(pdsno, passwd);

	if(dto==null){
		out.print("<script>");
		out.print("  alert('비밀번호가 일치하지 않습니다');");
		out.print("	history.back();");
		out.print("</script>");
	}else {
%>
<form name="frmData" method="post" enctype="multipart/form-data" action="pdsUpdateProc.jsp">
	<input type="hidden" name="pdsno"  value="<%=pdsno%>">
	
	<table border="1">
	<tr>
		<th colspan="2">파일 등록 (* 필수 입력사항)</th>
	</tr>
	<tr> 
		<td colspan="2" height="30"></td>
	</tr>
	<tr>
		<th>성명*</th>
		<td><input type="text" name="wname" size="20"  maxlength="20" required value="<%=dto.getWname()%>"></td>
	</tr>
	<tr> 
		<th>제목*</th>
		<td><input name="subject" rows='5' cols='30' maxlength="100" required value="<%=dto.getSubject()%>"></td>
	</tr>
	<tr> 
		<th>비밀번호*</th>
		<td><input type="password" name="passwd" size="10"  value="<%=dto.getPasswd()%>"></td>
	</tr>
	<tr> 
		<th>파일명*</th>
		<td><input type="file" name="filename"></td>
	</tr>
	<tr> 
		<td colspan="2" align="center">
	        <input type="submit" value="수정">
	        <input type="reset" value="취소">
	     </td>
	</tr>
	</table>
</form>
<%
}
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>