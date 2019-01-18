<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsUpdateForm.jsp -->
<h3>* 글 수정 결과 *</h3>
<% 
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd").trim();

	dto.setBbsno(bbsno);
	dto.setPasswd(passwd);

	dto=dao.updateform(dto);

	if(dto==null){
		out.print("<script>");
		out.print("  alert('비밀번호가 일치하지 않습니다');");
		out.print("	history.back();");
		out.print("</script>");
	}else {
		//3) 수정폼에 출력
			//out.println(dto.getBbsno()+" "+dto.getSubject());
		%>
		<form name="bbsfrm" method="post" action="bbsUpdateProc.jsp"
				onsubmit="return bbsCheck(this)">
				<input type="hidden" name="bbsno"  value="<%=bbsno%>">
				<input type="hidden" name="col"  value="<%=col%>">
				<input type="hidden" name="word"  value="<%=word%>">
				<input type="hidden" name="passwd"  value="<%=passwd%>">
				<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="wname" size="20" maxlength="20" required value="<%=dto.getWname()%>"></td>
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
					<td><input type="password" name="passwd" size="10"  value="<%=dto.getPasswd()%>"></td>
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
		//4) 

	}
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>