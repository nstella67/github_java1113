<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.Timestamp" %>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<%@ page import="java.util.*" %>
<%@ page import="net.utility.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>

<!-- 본문 시작 memberProc.jsp -->
<c:choose>
	<c:when test="${res==0 }">
		<script>
			alert("이메일 전송이 실패했습니다");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<p>${email }</p>
		<p>${passwd }</p>
		<%
		String mailServer="mw-002.cafe24.com";
	    Properties props = new Properties();
	    props.put("mail.smtp.host", mailServer);
	    props.put("mail.smtp.auth", "true");
	    
		Authenticator myAuth=new MyAuthenticator();
	    
		Session sess = Session.getInstance(props, myAuth);
	    out.print("메일 서버 인증 성공!");
	    
	    request.setCharacterEncoding("UTF-8");
		String to=request.getParameter("email");
	    String from="admin@admin.admin";
    	String subject="임시 비밀번호";
    	String msgText=request.getParameter("passwd");
    	out.print(to+"/"+msgText);
		
		    try{
		    	msgText=Utility.convertChar(msgText);
		    	
		    	InternetAddress[] address={ new InternetAddress(to) };
		    	Message msg=new MimeMessage(sess);
		    	
		    	msg.setRecipients(Message.RecipientType.TO, address);
	    	
		    	msg.setFrom(new InternetAddress(from));
		    	
		    	msg.setSubject(subject);
		    	
		    	msg.setContent(msgText, "text/html; charset=UTF-8");
		    	
		    	Transport.send(msg);
				out.print("<p>"+to+"로 임시비밀번호를 전송하였습니다"+"</p>");
		    }catch(Exception e){
		    	out.println("<p>메일 전송 실패!"+e+"</p>");
		    	out.println("<p><a href='javascript:history.back();'>[다시시도]</a></p>");
		    }//try end
		%>
	</c:otherwise>
</c:choose>
<!-- 본문 끝 -->

<%@ include file="../footer.jsp" %>