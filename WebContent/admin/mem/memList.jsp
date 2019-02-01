<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../member/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>mem/memList.jsp</title>
	</head>
	
	<body>
		<h3>* 회원 목록 *</h3>
		전체 회원수 : <strong><%=dao.recordCount() %></strong>
		<hr>
		<table>
		<tr>
			<th>아이디</th>
			<th>비번</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>가입일</th>
			<th>등급</th>
			<th></th>
		</tr>
	<%
		col=Utility.checkNull(request.getParameter("col"));
		ArrayList<MemberDTO> list=dao.list(col);
		if(list==null){
			out.println("<tr><td colspan='8'>자료없음</td>");			
		}else{
			for(int idx=0; idx<list.size(); idx++){
				dto=list.get(idx);
				String mlevel=dto.getMlevel();
	%>
		<tr>
			<th><%=dto.getId() %></th>
			<th><%=dto.getPasswd() %></th>
			<th><%=dto.getMname() %></th>
			<th><%=dto.getTel() %></th>
			<th><%=dto.getEmail() %></th>
			<th><%=dto.getMdate().substring(0, 10) %></th>
			<th><%=dto.getMlevel() %></th>
		</tr>
	<%
			}
	%>
		<!-- 정렬 -->
		<tr>
			<td colspan="7">
				<form action="memList.jsp">
					<select name="col" onchange="sort(this.form)">
						<option value="id" <%if(col.equals("")||col.equals("id")){out.println("selected");} %>>ID순
						<option value="mname" <%if(col.equals("mname")){out.println("selected");} %>>이름순
						<option value="mdate" <%if(col.equals("mdate")){out.println("selected");} %>>가입일순
					</select>
				</form>
			</td>
		</tr>
	<%
		}//if end
		
	%>
		</table>
				
		<script>
			function sort(f){
				f.submit();
			}//sort() end
		</script>
	</body>
</html>