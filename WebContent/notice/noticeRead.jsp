<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../member/auth.jsp" %>
<%@ include file="../header.jsp" %>

		<h1> * 상세보기 * </h1>
		<p><a href="noticeList.jsp">[글목록]</a></p>
		
		<%
			int noticeno=Integer.parseInt(request.getParameter("noticeno"));
		dto=dao.read(noticeno);
			if(dto==null){
				out.println("해당 글 없음!!");
			}else{
				
		%>
			<table>
			<tr>
				<th>글번호</th>
				<td><%=dto.getNoticeno() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getNid() %></td>
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
				<th>작성일</th>
				<td><%=dto.getRegdt() %></td>
			</tr>
			</table>
			<form>
				<input type="hidden" name="noticeno" value="<%=noticeno%>">
				<input type="hidden" name="col" value="<%=col%>">
				<input type="hidden" name="word" value="<%=word%>">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
			<% if(s_mlevel.equals("A1")){ %> <!-- A1인 등급인 애들만 수정 삭제 가능 -->
				<input type="button" value="수정" onclick="move(this.form, 'noticeUpdate.jsp')">
				<input type="button" value="삭제" onclick="move(this.form, 'noticeDel.jsp')">
			<%}//if end %>
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