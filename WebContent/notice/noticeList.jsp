<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./ssi.jsp" %>
<%@ include file="../header.jsp" %>
<%@ include file="auth.jsp" %>

<!-- 본문 시작 noticeList.jsp -->
	<h5>* 공지사항 *</h5>
			
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
			
		<%		
		//글갯수
		int totalRecord=dao.count(col, word);
	
		//한페이지당 출력할 글의 줄수
		int recordPerPage=10;
	
		//전체목록
		ArrayList<NoticeDTO> list=dao.list(col, word, nowPage, recordPerPage);
		if(list==null){
			out.println("<tr>");
			out.println("	<td colspan='4'>글없음!!</td>");
			out.println("</tr>");
		}else{
			//오늘날짜를 "2019-01-16" answkduf wkrtjd
			String today=Utility.getDate();
			
			for(int idx=0; idx<list.size(); idx++){
				dto=list.get(idx);
		%>
			<tr>
				<td><%=dto.getNoticeno()%></td>
				<td style="text-align:left">			
				<a href="noticeRead.jsp?noticeno=<%=dto.getNoticeno() %>&col=<%=col%>&word=<%=word%>&nowPage=<%=nowPage%>&recordPerPage=<%=recordPerPage%>"><%=dto.getSubject() %></a>
					<%
					String regdt=dto.getRegdt().substring(0, 10);
					if(regdt.equals(today)){
						out.print("<img src='../images/yellowstar.png' width='15'>");
					}//if end
					%>
				</td>
				<td><%=dto.getNid()%></td>
				<td><%=dto.getRegdt() %></td>
			</tr>
		<%
			}//for end
			
			//글갯수
			out.println("<tr>");
			out.println("	<td colspan='4'>");
			out.println("		글갯수 : <strong>");
			out.println(totalRecord);
			out.println("		</strong>");
			out.println("	</td>");
			out.println("</tr>");
			
		%>
		<!-- 페이지 리스트 시작 -->
		<tr>
			<td colspan="4">
			<%
			String paging = new Paging().paging(totalRecord, nowPage, recordPerPage, col, word, "noticeList.jsp");
			out.println(paging);
			%>
			</td>
		</tr>
		<!-- 페이지 리스트 끝 -->
		
		
		<!-- 검색시작 -->
		<tr>
			<td colspan="4" style="text-align: center; height:50px;">
				<form method="get" action="noticeList.jsp" onsubmit="return searchCheck(this)">
					<select name="col">
						<option value="subject">제목
						<option value="content">내용
						<option value="subject_content">제목+내용
					</select>
					<input type="text"` name="word" class="search">
					<input type="submit" value="검색" class="search">
				</form>
			</td>
		<!-- 검색끝 -->
		</tr>
		</table>

<form>
<%
if (s_mlevel.equals("A1")||s_mlevel.equals("B1")){
%>
	<input type="button" value="글쓰기" onclick="move(this.form, 'noticeForm.jsp')">
<%
}
%>
</form>	
<script>
	function move(f, file){
		f.action=file;
		f.submit();
	}
</script>
<%	
}//if end
%>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>