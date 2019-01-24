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
			<th>등급변경</th>
		</tr>
	<%
		ArrayList<MemberDTO> list=dao.list();
		if(list==null){
			out.println("<tr><td colspan='8'>자료없음</td>");			
		}else{
			for(int idx=0; idx<list.size(); idx++){
				dto=list.get(idx);
	%>
		<tr>
			<th><%=dto.getId() %></th>
			<th><%=dto.getPasswd() %></th>
			<th><%=dto.getMname() %></th>
			<th><%=dto.getTel() %></th>
			<th><%=dto.getEmail() %></th>
			<th><%=dto.getMdate() %></th>
			<th><%=dto.getMlevel() %></th>
			<th></th>
		</tr>
	<%
			}
		}//if end
		
	%>
		</table>
	</body>
</html>