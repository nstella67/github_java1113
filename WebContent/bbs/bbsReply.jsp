<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsReply.jsp -->
	<h3>*  답변쓰기 *</h3>
	<%	//부모글
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	%>
	<form name="bbsfrm" method="get" action="bbsReplyProc.jsp"
			onsubmit="return bbsCheck(this)">
	<input type="hidden" name="bbsno" value="<%=bbsno%>">
	<input type="hidden" name="col" value="<%=col%>">
	<input type="hidden" name="word" value="<%=word%>">
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="wname" size="20" maxlength="20" required></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" size="20" maxlength="100" required></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="5" cols="30" name="content"></textarea></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="passwd" size="10"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="답변쓰기">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>