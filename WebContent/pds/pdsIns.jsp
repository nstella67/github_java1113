<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>

<!-- 본문 시작 pdsIns.jsp -->
<h3>* 사진 올리기 결과 *</h3>
<%
	try{
		//1) 첨부된 파일 저장하기---------------------------------------
		String saveDirectory=application.getRealPath("/upload");
		int maxPostSize=1024*1024*10;	//10M
		String encoding="UTF-8";
		MultipartRequest mr=new MultipartRequest(request, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());

		
		//2) 저장된 파일명, 파일크기 가져오기-------------------------
		String item="";
		String fileName="";	//파일명
		long filesize=0;		//파일크기
		File file=null;
		
		Enumeration files=mr.getFileNames();
		while(files.hasMoreElements()){
			item=(String)files.nextElement();
			fileName=mr.getFilesystemName(item);
			if(fileName!=null){
				file=mr.getFile(item);	//파일담기
				if(file.exists()){				//파일 존재하는지?
					filesize=file.length();
				}//if emd
			}//if end
		}//while end
		
		
		//3) tb_pds 테이블에 저장하기----------------------------------
		String wname=mr.getParameter("wname").trim();
		String subject=mr.getParameter("subject").trim();
		String passwd=mr.getParameter("passwd").trim();
		String ip     =request.getRemoteAddr();
		
		//System.out.println(wname+""+subject+""+passwd+""+fileName+""+filesize);
		
		dto.setWname(wname);
		dto.setSubject(subject);
		dto.setPasswd(passwd);
		dto.setFilename(fileName);
		dto.setFilesize(filesize);
		dto.setIp(ip);
		
		boolean flag=dao.insert(dto);

		if(flag){
			out.print("<script>");
			out.print("  alert('글쓰기 성공');");
			out.print("  window.location='pdsList.jsp?col="+col+"&word="+word+"';");
			out.print("</script>");
		}else {
			out.print("글쓰기 실패<br/>");
			out.print("<a href='javascript:history.back();'>[다시시도]</a>");
		}//if end
	}catch(Exception e){
		out.println(e);
		out.println("<p>사진 올리기 실패</p>");
		out.println("<a href='javascript:histrory.back();'>[다시시도]</a>");
	}//try end
%>
<!-- 본문 끝 -->
<%@ include file="../footer.jsp" %>