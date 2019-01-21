<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

		<h1> * 상세보기 * </h1>
		<p><a href="bbsList.jsp">[글목록]</a><a href="bbsForm.jsp">[글쓰기]</a></p>
		
		<%
			int bbsno=Integer.parseInt(request.getParameter("bbsno"));
			dto=dao.read(bbsno);
			if(dto==null){
				out.println("해당 글 없음!!");
			}else{
				
		%>
			<table>
			<tr>
				<th>글번호</th>
				<td><%=dto.getBbsno() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWname() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getSubject() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<%//엔터 > < ' " 기호를 특수문자로 치환
						String content=Utility.convertChar(dto.getContent());
						out.println(content);
					%>
				</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getReadcnt() %></td>
			</tr>
			<tr>
				<th>그룹번호</th>
				<td><%=dto.getGrpno() %></td>
			</tr>
			<tr>
				<th>Ip</th>
				<td onclick="window.open('http://<%=dto.getIp() %>:9090/myweb/bbs/bbsList.jsp');">
					<%=dto.getIp() %>
				</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><%=dto.getRegdt() %></td>
			</tr>
			</table>
			<form>
				<input type="hidden" name="bbsno" value="<%=bbsno%>">
				<input type="hidden" name="col" value="<%=col%>">
				<input type="hidden" name="word" value="<%=word%>">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				<input type="button" value="목록" onclick="move(this.form, 'bbsList.jsp')">
				<input type="button" value="답변" onclick="move(this.form, 'bbsReply.jsp')">
				<input type="button" value="수정" onclick="move(this.form, 'bbsUpdate.jsp')">
				<input type="button" value="삭제" onclick="move(this.form, 'bbsDel.jsp')">
			</form>
			<script>
				function move(f, file){
					//alert(f);
					//alert(file);
					f.action=file;
					f.submit();
				}
			</script>
		<%
			}//if end
		%>
<%@ include file="../footer.jsp" %>