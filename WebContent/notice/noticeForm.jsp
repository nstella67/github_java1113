<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>

<!-- 본문 시작 noticeForm.jsp-->
<h3>* 공지사항 쓰기 *</h3>
<br />
<p>
	<a href="noticeList.jsp">[공지사항 목록]</a>
</p>
<form name="ntcfrm" method="post" action="noticeIns.jsp" onsubmit="return ntcCheck(this)">
<%
	String nid=(String)session.getAttribute("s_id");
%>
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" size="20" maxlength="100" required></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="30" name="content"></textarea></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="nid" size="20" maxlength="100" readonly value="<%=nid%>"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="passwd" size="10"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="쓰기">
				<input type="reset" value="취소"></td>
		</tr>
	</table>
</form>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp"%>