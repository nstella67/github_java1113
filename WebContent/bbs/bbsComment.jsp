<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsList.jsp -->
	<h3>* 댓글 목록 *</h3>
	<p><a href="bbsForm.jsp">[글쓰기]</a></p>
	<p><a href="bbsList.jsp">[게시판 목록]</a></p>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>그룹번호</th>
			<th>글제목</th>
			<th>조회수</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
	
	<%		
		//글갯수
		int totalRecord=dao.count(col, word);
	
		//한페이지당 출력할 글의 줄수
		int recordPerPage=10;
	
		//전체목록
		ArrayList<BbsDTO> comment=dao.comment(col, word, nowPage, recordPerPage);
		if(comment==null){
			out.println("<tr>");
			out.println("	<td colspan='6'>글없음!!</td>");
			out.println("</tr>");
		}else{
			//오늘날짜를 "2019-01-16" answkduf wkrtjd
			String today=Utility.getDate();
			
			for(int idx=0; idx<comment.size(); idx++){
				dto=comment.get(idx);
			
		%>
		
			
			<tr>
				<td><%=dto.getBbsno()%></td>
				<td><%=dto.getGrpno() %></td>
				<td style="text-align:left">			
					<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno() %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>&recordPerPage=<%=recordPerPage%>">
					<%=dto.getSubject() %> (<%=dto.getComment() %>)</a>
						<%
						// 오늘 작성한 글제목 뒤에 new이미지 출력
						String regdt=dto.getRegdt().substring(0, 10);
						if(regdt.equals(today)){
							out.print("<img src='../images/yellowstar.png' width='15'>");
						}//if end
						
						//조회수가 10 이상이면 hot 이미지 출력
						if(dto.getReadcnt()>=10){
							out.println("<img src='../images/tenor (8).gif' width='30'>");
						}
						%>
				</td>
				<td><%=dto.getReadcnt() %></td>
				<td><%=dto.getWname()%></td>
				<td><%=dto.getRegdt() %></td>
			</tr>
		<%
			}//for end
			
			//글갯수
			out.println("<tr>");
			out.println("	<td colspan='6'>");
			out.println("		글갯수 : <strong>");
			out.println(totalRecord);
			out.println("		</strong>");
			out.println("	</td>");
			out.println("</tr>");
			
		%>
		
		<!-- 페이지 리스트 -->
		<tr>
			<td colspan="6">
			<%
			String paging = new Paging().paging(totalRecord, nowPage, recordPerPage, col, word, "bbsComment.jsp");
			out.println(paging);
			%>
			</td>
		</tr>
		
		
		<!-- 검색 -->
		<tr>
			<td colspan="6" style="text-align: center; height:50px;">
				<form method="get" action="bbsComment.jsp" onsubmit="return searchCheck(this)">
					<select name="col">
						<option value="wname">작성자
						<option value="subject">제목
						<option value="content">내용
						<option value="subject_content">제목+내용
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