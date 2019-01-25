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
		<title>pdsTestProc.jsp</title>
	</head>
	<body>
		<h3>* 파일 첨부 테스트 결과 *</h3>
	<%
		/*
		request.setCharacterEncoding("UTF-8");
		out.print(request.getParameter("uname"));
		out.print("<hr>");
		out.print(request.getParameter("subject"));
		out.print("<hr>");
		out.print(request.getParameter("content"));
		out.print("<hr>");
		out.print(request.getParameter("filenm"));
		out.print("<hr>");
		//----------------------------------------------------------------------------------------
		- 	폼에 enctype="" 추가되면 request 객체가 가지고 있는 값을 제대로 가져올 수 없다
			request.getParameter() 메소드는 null이 반환된다
		-	request 객체 가지고 있는 파일을 가져오려면
			1) 사용자가 직접 클래스 작성 (교재)
				web.tool.Upload
			2) 외부 라이브러리 다운 cos.jar
		*/
		try{
			String saveDirectory=application.getRealPath("/upload");
			int maxPostSize=1024*1024*10;	//10M
			String encoding="UTF-8";
			
			//사용자가 전송한 텍스트 정보 및 파일 저장하기
			MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			out.print("<p>파일 전송 저장 성공!!</p>");
			
			//1) mr 객체가 가지고 있는 텍스트 정보 가져오기
			out.print(mr.getParameter("uname"));
			out.print("<hr>");
			out.print(mr.getParameter("subject"));
			out.print("<hr>");
			out.print(mr.getParameter("content"));
			out.print("<hr>");
			
			//2) mr 객체가 /upload 폴더에 저장시킨 파일 관련 정보 모두 (파일명, 확장명, 용량) 가져오기
			//	<input type=file name=filenm1>
			//	<input type=file name=filenm2>
			//	<input type=file name=filenm3>
			Enumeration files=mr.getFileNames();
			
			//3) 2)가 가지고 있는 files 객체에서 개별 접근
			String item=(String)files.nextElement();
			out.print(item);			//<input type=file name=filenm>
			out.print("<hr>");
			
			//4) 3)에서 item 이름으로 전송된 파일을 mr 객체에서 가져오기
			String ofileName=mr.getOriginalFileName(item);
			String fileName=mr.getFilesystemName(item);
			out.print("원본파일명 : "+ofileName);
			out.print("<hr>");
			out.print("리네임 파일명 : "+fileName);
			
			//5) 저장된 파일의 기타 세부 정보 확인하기
			File file=mr.getFile(item);	//File class는 Java Standard 버전에 있음
			if(file.exists()){
				out.print("파일명 : "+file.getName());
				out.print("<hr>");
				out.print("파일크기 : "+file.length());
				out.print("<hr>");
				out.print("파일크기 : "+Utility.toUnitStr(file.length()));
				out.print("<hr>");
			}else{
				out.print("해당 파일이 존재하지 않음");
			}//if end
			
			//6) 파일 다운로드
			//	(단, 웹브라우저에서 해성되는 페이지는 제외 : .html, .jsp, .adp, .php, .png, .jpg, .gif, .avi, .mp3 등)
			out.print("첨부파일 : ");
			out.print("<a href='../upload/"+file.getName()+"'>");
			out.print(file.getName());
			out.print("</a>");
			
		}catch(Exception e){
			out.print(e);
			out.print("<p>파일 업로드 실패!!</p>");
			out.print("<a href='javascript:history.back();'>[다시시도]</a>");
			out.print(e);
		}//try end
		
	%>
	</body>
</html>