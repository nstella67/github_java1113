<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../notice/ssi.jsp" %>
<%@ include file="../../Admin_header.jsp" %>	
<!-- 본문 시작 bbsDel.jsp-->
<h3>* 글수정 *</h3>
<br />
<p>
	<a href="notList.jsp">[글목록]</a>
</p>
<%
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
	dto.setNoticeno(noticeno);
	dto=dao.notUpdateForm(dto);
%>
<form name="ntcfrm" method="post" action="notUpdate.jsp">
<input type="hidden" name="noticeno"  value="<%=dto.getNoticeno()%>">
	<table>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="nid" size="20" maxlength="20" required value="<%=dto.getNid()%>"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="subject" size="20" maxlength="100" required value="<%=dto.getSubject()%>"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="5" cols="30" name="content"><%=dto.getContent()%></textarea></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="text" name="passwd" size="10"  value="<%=dto.getPasswd()%>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정">
			<input type="reset" value="취소">
		</td>
	</tr>
	</table>
</form>
<!-- 본문 끝 -->

<%@ include file="../../Admin_footer.jsp" %>