<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 bbsList.jsp -->
	<h3>* 글 목록 *</h3>
	<p><a href="bbsForm.jsp">[글쓰기]</a></p>
	
	<table>
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>그룹번호</th>
			<th>등록일</th>
		</tr>
	
	<%		
			//전체목록
			ArrayList<BbsDTO> list=dao.list();
			if(list==null){
				out.println("<tr>");
				out.println("	<td colspan='5'>글없음!!</td>");
				out.println("</tr>");
			}else{
				//오늘날짜를 "2019-01-16" answkduf wkrtjd
				String today=Utility.getDate();
				
				for(int idx=0; idx<list.size(); idx++){
					dto=list.get(idx);
		%>
			<tr>
				<td><%=dto.getBbsno()%></td>
				<td><%=dto.getWname()%></td>
				<td style="text-align:left">
				<%
					//답변이미지 출력
					for(int n=1; n<=dto.getIndent(); n++){
						out.print("<img src='../images/reply.gif' width='30'>");
					}
				%>				
				<a href="bbsRead.jsp?bbsno=<%=dto.getBbsno() %>"><%=dto.getSubject() %></a>
					<%
					// 오늘 작성한 글제목 뒤에 new이미지 출력
					// 작성일에서 "년월일"만 자르기 → 예)2019-01-16
					// 2019-01-16
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
				<td><%=dto.getGrpno() %></td>
				<td><%=dto.getRegdt() %></td>
			</tr>
		<%
			}//for end
		}//if end
		%>
		</table>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>