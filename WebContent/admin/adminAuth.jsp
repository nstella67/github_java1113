<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.utility.*" %>
<%
	//adminAuth.jsp
	//관리자페이지 로그인 상태 확인 페이지 → 공통페이지로 
	String s_admin_id="";
	String s_admin_pw="";
	String s_admin_mlevel="";
	
	if(session.getAttribute("s_admin_id")==null || session.getAttribute("s_admin_pw")==null || session.getAttribute("s_admin_mlevel")==null){
		s_admin_id="guest";
		s_admin_pw="guest";
		s_admin_mlevel="guest";
		//로그인하지 않은 경우 관리자 로그인 페이지로 자동이동
		String root=Utility.getRoot();
%>
	<!DOCTYPE html>
	<html lang="ko">
		<head>
			<meta charset="UTF-8">
			<title>blank.jsp</title>
		</head>
		<script>
			function jumpTo(){
				alert("관리자 로그인해주세요");
				window.top.location.href="<%=root%>/admin/adminLogin.jsp";
			}
		</script>
		<body onload="jumpTo()"></body>
	</html>
<%
	}else{
		s_admin_id=(String)session.getAttribute("s_admin_id");
		s_admin_pw=(String)session.getAttribute("s_admin_pw");
		s_admin_mlevel=(String)session.getAttribute("s_admin_mlevel");
	}//if end
	
	
%>