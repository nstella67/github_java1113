<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../adminAuth.jsp" %>
<%@ include file="../../member/ssi.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>mem/memDel.jsp</title>
	</head>
	
	<body>
		<h3>* 회원 삭제 *</h3>
		<h5 style="color: red">* 아이디 선택하거나 검색해서 삭제 가능 *</h5>
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
		</tr>
	<%
		String col=Utility.checkNull(request.getParameter("col"));
		ArrayList<MemberDTO> list=dao.list(col);
		if(list==null){
			out.println("<tr><td colspan='7'>자료없음</td>");			
		}else{
			for(int idx=0; idx<list.size(); idx++){
				dto=list.get(idx);
				String mlevel=dto.getMlevel();
	%>
		<tr>
			<th style="text-align:left">
				<form method="get" action="memDelProc.jsp" onchange="return mDel(this)">
					<input type="hidden" name="id" id="id" value="<%=dto.getId() %>">
					<input type="submit" value="<%=dto.getId()%>">
				</form>
<%-- 				<a href="memDelProc.jsp?id=<%=dto.getId() %>" onclick="javascript: return mDel(this)"><%=dto.getId() %></a> --%>
			</th>
			<th><%=dto.getPasswd() %></th>
			<th><%=dto.getMname() %></th>
			<th><%=dto.getTel() %></th>
			<th><%=dto.getEmail() %></th>
			<th><%=dto.getMdate().substring(0, 10) %></th>
			<th><%=dto.getMlevel() %></th>
		</tr>
	<%
			}//for end
		}//if end
	%>
		</table>
		<hr>
		<br>
		<table>
			<tr>
				<td>아이디</td>
				<td>
					<form method="get" action="memDelProc.jsp" onchange="return mDel(this)">
					<input type="text"` name="id">
					<input type="submit" value="삭제">
					</form>
				</td>
			</tr>
		</table>
		<script>			
			function mDel(f){
				var message="삭제한 회원은 되돌릴 수 없습니다. 삭제할까요?"
				if(confirm(message)){
					f.submit();
				}
			}//mDel() end
		</script>
	</body>
</html>