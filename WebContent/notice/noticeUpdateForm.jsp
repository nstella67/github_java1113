<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 noticeUpdateForm.jsp -->
<h3>* 글 수정 *</h3>
<% 
	int noticeno=Integer.parseInt(request.getParameter("noticeno"));
	String passwd=request.getParameter("passwd").trim();

	dto.setNoticeno(noticeno);
	dto.setPasswd(passwd);

	dto=dao.ntcUpdateform(dto);

	if(dto==null){
		out.print("<script>");
		out.print("  alert('비밀번호가 일치하지 않습니다');");
		out.print("	history.back();");
		out.print("</script>");
	}else {
		//3) 수정폼에 출력
			//out.println(dto.getnoticeno()+" "+dto.getSubject());
		%>
		<form name="noticefrm" method="post" action="noticeUpdateProc.jsp"
				onsubmit="return noticeCheck(this)">
				<input type="hidden" name="noticeno"  value="<%=noticeno%>">
				<input type="hidden" name="col"  value="<%=col%>">
				<input type="hidden" name="word"  value="<%=word%>">
				<input type="hidden" name="nowPage"  value="<%=nowPage%>">
				<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="nid" size="20" maxlength="20" readonly value="<%=dto.getNid()%>"></td>
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