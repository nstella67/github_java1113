package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsDeleteform implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		//�ش�۹�ȣ
		int num=Integer.parseInt(req.getParameter("num"));
		//�ش���������ȣ
		int pageNum= Integer.parseInt(req.getParameter("pageNum"));
		//��й�ȣ
		String passwd=req.getParameter("passwd");
		
		req.setAttribute("num", new Integer(num));
		req.setAttribute("pageNum", new Integer(pageNum));
		req.setAttribute("passwd", passwd);
		
		return "bbsDeleteform.jsp";
	}
	
}//class end
