package net.member2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class SearchPw implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp) throws Throwable {
		String email=req.getParameter("email");
		String Oemail=req.getParameter("Oemail");
		//System.out.println(email+".. "+Oemail);
		
		MemberDataBean article=new MemberDataBean();
		article.setEmail(email);
		
		MemberDBBean dao=new MemberDBBean();
		String passwd=dao.pwsearch(article);	//임시비밀번호 설정
		article.setPasswd(passwd);
		//System.out.println(passwd);
		
		int res=dao.newPw(passwd, email);	//임시비밀번호로 update
		//System.out.println(res);
		req.setAttribute("res", res);
		
		if(email!=Oemail) {
			email=Oemail;
		}
		req.setAttribute("email", email);
		req.setAttribute("passwd", passwd);
		return "searchPwPro.jsp";
	}//requestPro end

}//class end
