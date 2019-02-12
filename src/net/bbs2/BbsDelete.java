package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsDelete implements CommandAction {
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		int num=Integer.parseInt(req.getParameter("num"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		String passwd=req.getParameter("passwd");
		
		BoardDataBean article=new BoardDataBean();
		article.setPasswd(passwd);
		article.setNum(num);
		
		BoardDBBean dao=new BoardDBBean();
		int res=dao.delete(article);
		
		req.setAttribute("num", new Integer(num));
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("res", new Integer(res));
		System.out.println(res);
		return "bbsDelProc.jsp";
	}//requestPro() end
}//BbsInsert end
