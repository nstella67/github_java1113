<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 loginForm.jsp -->
<h3>* 로 그 인 *</h3>
<form name="loginFrm" method="post" action="loginProc.jsp" onsubmit="return loginCheck(this)">
	<table>
	<tr>
		<td>
			<input type="text" name="id" id="id" placeholder="아이디" required>
		</td>
		<td rowspan="2">
			<input type="image" src="../images/bt_login.gif" style="cursor:pointer">
		</td>
	</tr>
	<tr>
		<td>
			<input type="password" name="passwd" id="passwd" placeholder="비밀번호" required>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<p>
				아이디저장
				&nbsp;&nbsp;
				<a href = "agreement.jsp">회원가입</a>
				&nbsp;&nbsp;
				아이디/비번찾기
			</p>
		</td>
	</tr>
	</table>
</form>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>