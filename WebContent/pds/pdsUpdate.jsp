<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsUpdate.jsp -->
<p>* 수정 *</p>
<p><a href="pdsList.jsp">[사진목록]</a></p>
<form method="get" action="pdsUpdateForm.jsp" onsubmit="return upPwCheck(this)">
	<input type="hidden" name="pdsno" value="<%=request.getParameter("pdsno") %>">
<table>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd" size="10"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="확인"></td>
	</tr>
</table>
</form>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>