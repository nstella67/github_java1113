<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="net.utility.*" %>

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>pdsTestProc2.jsp</title>
	</head>
	<body>
		<h3>* 파일 첨부 테스트 결과 (다중) *</h3>
	<%
		try{
			String saveDirectory=application.getRealPath("/upload");
			int maxPostSize=1024*1024*10;	//10M
			String encoding="UTF-8";
			
			MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			out.print("<p>파일 전송 저장 성공!!</p>");
			
			out.print(mr.getParameter("uname"));
			out.print("<hr>");
			out.print(mr.getParameter("subject"));
			out.print("<hr>");
			out.print(mr.getParameter("content"));
			out.print("<hr>");
			
			//파일 업로드 (다중)
			String item="";
			String ofileName="";
			String fileName="";
			File file=null;
			
			//<input type=file name=filenm1>
			//<input type=file name=filenm2>
			//<input type=file name=filenm3>
			Enumeration files=mr.getFileNames();
			
			int idx=1;
			while(files.hasMoreElements()){
				item=(String)files.nextElement();	//filenm1
				fileName=mr.getFilesystemName(item);
				ofileName=mr.getOriginalFileName(item);
				if(fileName!=null){
					file=mr.getFile(item);	//파일담기
					if(file.exists()){				//파일 존재하는지?
						long filesize=file.length();
						out.print(idx+") 원본파일명 : "+ofileName+"<hr>");
						out.print(idx+") 파일명 : "+file.getName()+"<hr>");
						out.print(idx+") 파일크기 : "+filesize+"<hr>");
					}//if emd
				}//if end
				idx++;
			}//while end
			
		}catch(Exception e){
			out.print(e);
			out.print("<p>파일 업로드 실패!!</p>");
			out.print("<a href='javascript:history.back();'>[다시시도]</a>");
			out.print(e);
		}//try end
		
	%>
	</body>
</html>