package net.bbs2;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsUpdate implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		int num=Integer.parseInt(req.getParameter("num"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		String writer=req.getParameter("writer").trim();
		String subject=req.getParameter("subject").trim();
		String email=req.getParameter("email");
		String content=req.getParameter("content").trim();
		String passwd =req.getParameter("passwd").trim();
		String ip=req.getRemoteAddr();	//ø‰√ªPC¿« IP
		
		//System.out.println(num+" "+pageNum+" "+subject+" "+email+" "+content+" "+passwd+" "+ip);
		
		BoardDataBean article=new BoardDataBean();
		article.setWriter(writer);
		article.setSubject(subject);
		article.setEmail(email);
		article.setContent(content);
		article.setPasswd(passwd);
		article.setIp(ip);
		article.setNum(num);
		
		BoardDBBean dao=new BoardDBBean();
		int res=dao.update(article);
		
		//System.out.println(res);
		
		req.setAttribute("writer", writer);
		req.setAttribute("subject", subject);
		req.setAttribute("email", email);
		req.setAttribute("content", content);
		req.setAttribute("passwd", passwd);
		req.setAttribute("ip", ip);
		req.setAttribute("num", new Integer(num));
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("res", new Integer(res));
		
		return "bbsUpdateProc.jsp";
	}//requestPro() end
}//BbsInsert end
