<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsDel.jsp -->
<p>* 삭제 *</p>
<p><a href="pdsList.jsp">[사진목록]</a></p>
<form method="post" action="pdsDelProc.jsp" onsubmit="return pwCheck(this)">
	<input type="hidden" name="pdsno" value="<%=request.getParameter("pdsno") %>">
<%-- 
	<input type="hidden" name="col" value="<%=request.getParameter("col")%>">
	<input type="hidden" name="word" value="<%=request.getParameter("word")%>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage")%>"> --%>

<table>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd" size="10"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">
	</tr>
</table>
</form>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>