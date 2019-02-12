package net.bbs2;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsInsert implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		BoardDataBean article=new BoardDataBean();
		article.setNum(Integer.parseInt(req.getParameter("num")));
		article.setWriter(req.getParameter("writer"));
		article.setEmail(req.getParameter("email"));
		article.setSubject(req.getParameter("subject"));
		article.setPasswd(req.getParameter("passwd"));
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(req.getParameter("ref")));
		article.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		article.setContent(req.getParameter("content"));
		article.setIp(req.getRemoteAddr());
		
		//System.out.println(article.toString());
		
		BoardDBBean dao=new BoardDBBean();
		dao.insertArticle(article);
		
		//System.out.println("dao빠져나왔나요");
		
		return "insertProc.jsp";
		
	}//requestPro() end
	
}//BbsInsert end
