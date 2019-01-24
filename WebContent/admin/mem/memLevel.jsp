<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../member/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>mem/memLevel.jsp</title>
	</head>
	
	<body>
		<h3>* 회원 등급 조정 *</h3>
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
		String col=Utility.checkNull(request.getParameter("col"));
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
			<!-- 회원 등급 변경 -->
			<form action="memLevelProc.jsp">
			<td>
				<input type="hidden" name="id" id="id" value="<%=dto.getId() %>">
				<select name="mlevel" onchange="levelChange(this.form)">
					<option value="A1" <%if(mlevel.equals("A1")){out.print("selected");} %>>최고관리자
					<option value="B1" <%if(mlevel.equals("B1")){out.print("selected");} %>>중간관리자
					<option value="C1" <%if(mlevel.equals("C1")){out.print("selected");} %>>우수사용자
					<option value="D1" <%if(mlevel.equals("D1")){out.print("selected");} %>>일반사용자
					<option value="E1" <%if(mlevel.equals("E1")){out.print("selected");} %>>비회원
					<option value="F1" <%if(mlevel.equals("F1")){out.print("selected");} %>>탈퇴회원
					<option value="X1" <%if(mlevel.equals("X1")){out.print("selected");} %>>휴면계정
				</select>
			</td>
			</form>
		</tr>
	<%
			}
	%>
		<!-- 정렬 -->
		<tr>
			<td colspan="8">
				<form action="memLevel.jsp">
					<select name="col" onchange="sort(this.form)">
						<option value="id" <%if(col.equals("")||col.equals("id")){out.println("selected");} %>>ID순
						<option value="mname" <%if(col.equals("mname")){out.println("selected");} %>>이름순
						<option value="mdate" <%if(col.equals("mdate")){out.println("selected");} %>>가입일순
					</select>
				</form>
			</td>
		</tr>
		
		<script>
			function sort(f){
				f.submit();
			}//sort() end
			
			function levelChange(f){
				var message="회원 등급을 변경할까요?"
				if(confirm(message)){
					f.submit();
				}
			}//levelChange() end
		</script>
	<%
		}//if end
		
	%>
		</table>
	</body>
</html>