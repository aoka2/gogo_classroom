package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LoginCheck;
import Model.Users;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8"); 
		String action = request.getParameter("action");
		if(action!=null &&action.equals("reLogin")) {
			
			ServletContext application = this.getServletContext();
			HttpSession session = request.getSession();
			
			String UserName = (String)session.getAttribute("userName");
			String UserPass = ((Users)application.getAttribute(UserName)).getUserPass();
			
			System.out.println(UserName);
			request.setAttribute("name",UserName);
			request.setAttribute("pass", UserPass);
			doPost(request,response);
		}else if(action!=null&&action.equals("logout")){
			HttpSession session = request.getSession();
			session.removeAttribute("userName");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request,response);
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/login.jsp");
			dispatcher.forward(request,response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = this.getServletContext();
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		String UserName = request.getParameter("name");
		String UserPass = request.getParameter("pass");
		
		//nullのときそのまま遷移session内容を確認して遷移
		if(((String)session.getAttribute("userName")) != null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/succcess.jsp");
			dispatcher.forward(request,response);
			return;
		}
		//アプリケーションスコープを取得
		//登録されているか確認
		
		boolean loginFlg = LoginCheck.execute(request,application,UserName,UserPass);
		if(loginFlg) {
			//ログイン失敗へ遷移
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/fail.jsp");
			dispatcher.forward(request,response);
		}else {
			//取得情報をJSP先で参照
			session.setAttribute("userName", UserName);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/succcess.jsp");
			dispatcher.forward(request,response);
		}
	
		return;
	}


}
