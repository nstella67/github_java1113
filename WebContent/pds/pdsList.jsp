<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 pdsList.jsp -->
<h3>* 포토갤러리 *</h3>
<p><a href="pdsForm.jsp">[사진올리기]</a></p>
<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>사진</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
	
	<%
		int totalRecord=dao.count(col, word);
		int recordPerPage=5;
		
		ArrayList<PdsDTO> list=dao.list(col, word, nowPage, recordPerPage);
		if(list==null){
			out.println("<tr>");
			out.println("	<td colspan='6'>관련 자료 없음!!</td>");
			out.println("</tr>");
		}else{
			String today=Utility.getDate();
			
			for(int idx=0; idx<list.size(); idx++){
				dto=list.get(idx);
		%>
			<tr>
				<td><%=dto.getPdsno()%></td>
				<td><a href="pdsRead.jsp?pdsno=<%=dto.getPdsno() %>"><%=dto.getSubject()%></a>
					<%
					String regdt=dto.getRegdate().substring(0, 10);
					if(regdt.equals(today)){
						out.print("<img src='../images/yellowstar.png' width='15'>");
					}//if end
					
					if(dto.getReadcnt()>=10){
						out.println("<img src='../images/tenor (8).gif' width='30'>");
					}
					%>
				</td>
				<td style="text-align:left"><img src="../upload/<%=dto.getFilename() %>" width="50">	</td>
				<td><%=dto.getWname()%></td>
				<td><%=dto.getReadcnt() %></td>
				<td><%=dto.getRegdate().substring(0, 10) %></td>
			</tr>
		<%
			}//for end
			
			//글갯수
			out.println("<tr>");
			out.println("	<td colspan='6'>");
			out.println("		전체 글 갯수 : <strong>");
			out.println(totalRecord);
			out.println("		</strong>");
			out.println("	</td>");
			out.println("</tr>");
		%>
		<!-- 페이지 리스트 시작 -->
		<tr>
			<td colspan="6">
			<%
			String paging = new Paging().paging(totalRecord, nowPage, recordPerPage, col, word, "pdsList.jsp");
			out.println(paging);
			%>
			</td>
		</tr>
		<!-- 페이지 리스트 끝 -->
		
		<!-- 검색시작 -->
		<tr>
			<td colspan="6" style="text-align: center; height:50px;">
				<form method="get" action="pdsList.jsp" onsubmit="return searchCheck(this)">
					<select name="col">
						<option value="wname">작성자
						<option value="subject">제목
					</select>
					<input type="text"` name="word" class="search">
					<input type="submit" value="검색" class="search">
				</form>
			</td>
		</tr>
	<%
	}//if end
	%>
	</table>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>