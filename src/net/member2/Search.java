package net.member2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class Search implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		String page=req.getParameter("page");
		String mname=req.getParameter("mname");
		String email=req.getParameter("email");
		
		MemberDataBean article=new MemberDataBean();
		article.setMname(mname);
		article.setEmail(email);
		MemberDBBean dao=new MemberDBBean();
		if(page.equals("searchId")) {
			article=dao.searchId(article);
		}
		if(page.equals("searchPw")) {
			String id=req.getParameter("id");
			article.setId(id);
			article=dao.searchPw(article);
			req.setAttribute("id", id);
		}

		req.setAttribute("article", article);
		return page+".jsp";
	}//requestPro end

}//class end
