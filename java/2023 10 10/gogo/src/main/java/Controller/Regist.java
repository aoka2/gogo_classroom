package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.RegistCheck;
import Model.Users;

/**
 * Servlet implementation class Servlet 
 */
@WebServlet("/Regist")
public class Regist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/entry.jsp");
		dispatcher.forward(request, response);
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		String UserName = request.getParameter("name");
		String UserPass = request.getParameter("pass");
		System.out.println(UserName);
		System.out.println(UserPass);
		//アプリケーションスコープを取得
		ServletContext application = this.getServletContext();
		//登録されているか確認
		//ユーザー情報参照　→　返り値：真偽
		boolean registFlg = RegistCheck.execute(request,application,UserName,UserPass);
		if(registFlg) {
			//アプリケーションスコープに登録
			Users inputUser = new Users(UserName,UserPass);
			request.setAttribute("userName", UserName);
			application.setAttribute(UserName,inputUser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/entrySucccess.jsp");
			dispatcher.forward(request,response);
		}else {
			//登録失敗へ遷移
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/entryFail.jsp");
			dispatcher.forward(request,response);
		}
		return;
	}

}
