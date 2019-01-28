<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문 시작 pdsRead.jsp -->
<p>* 상세보기 *</p>
<p><a href="pdsList.jsp">[사진목록]</a></p>

<%
	int pdsno=Integer.parseInt(request.getParameter("pdsno"));
	dto=dao.read(pdsno);
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
		
%>
<table>
	<tr> 
		<th style="text-align:right">글번호</th><td><%=dto.getPdsno() %></td>
		<th style="text-align:right">제목</th><td><%=dto.getSubject() %></td>
		<th style="text-align:right">작성자</th><td><%=dto.getWname() %></td>
	</tr>
	<tr>
		<td colspan="6"><img src="../upload/<%=dto.getFilename() %>">
		</td>
	</tr>
	<tr> 
		<th style="text-align:right">파일명</th><td><%=dto.getFilename() %></td>
		<th style="text-align:right">파일크기</th><td><%=dto.getFilesize() %></td>
		<th>Ip</th>
			<td onclick="window.open('http://<%=dto.getIp() %>:9090/myweb/bbs/bbsList.jsp');">
			<%=dto.getIp() %>
			</td>
	</tr>
	<tr> 
		<th style="text-align:right">조회수</th><td><%=dto.getReadcnt() %></td>
		<th style="text-align:right">작성일</th>
		<td><%=dto.getRegdate() %></td>
	<td colspan="2" align="center">
	<form>
		<input type="hidden" name="pdsno" value="<%=pdsno%>">
		<input type="button" value="목록" onclick="move(this.form, 'pdsList.jsp')">
		<input type="button" value="수정" onclick="move(this.form, 'pdsUpdate.jsp')">
		<input type="button" value="삭제" onclick="move(this.form, 'pdsDel.jsp')">
		</form>
	</td>
 	</tr>
 </table>

 <script>
	function move(f, file){
		//alert(f);
		//alert(file);
		f.action=file;
		f.submit();
	}
</script>
<%
	}
%>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>