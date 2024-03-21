package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.TreeMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Message;
import Model.SubjectCheck;

/**
 * Servlet implementation class CrassMessage
 */
@WebServlet("/CrassMessage")
public class CrassMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		if(action.equals("newSubject")) {
			//フォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/newSubjectEntry.jsp");
			dispatcher.forward(request, response);
		}else if(action.equals("messageDisplay")) {
			//クリックされたリスト番号、科目名を取得しフォワード
			request.setAttribute("subject", request.getParameter("subject"));
			request.setAttribute("listNumber", request.getParameter("listNumber"));
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/messageDisplay.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//アプリケーションスコープ取得
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		ServletContext application = this.getServletContext();
		HttpSession session = request.getSession();
		if("addMessage".equals(action)) {
			//フォームデータ取得
			String name = (String)session.getAttribute("userName");
			String title = request.getParameter("title");
			String context = request.getParameter("context");
			String subject = request.getParameter("subject");
			
			Message ms = new Message(title,context,name,subject);
			TreeMap<String,ArrayList<Message>> subjectMap = (TreeMap<String, ArrayList<Message>>) application.getAttribute("subjectList");
			ArrayList<Message> messageList = subjectMap.get(subject);
			
			messageList.add(ms);
			subjectMap.put(subject, messageList);
			application.setAttribute("messageList", subjectMap);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Login?action=reLogin");
			dispatcher.forward(request, response);
		}else if("addSubject".equals(action)) {
			String subject=request.getParameter("subject");

			/*マップが既に作られていた場合*/
			if((TreeMap<String,ArrayList<Message>>)application.getAttribute("subjectList") != null) {
				TreeMap<String,ArrayList<Message>> subjectMap = (TreeMap<String,ArrayList<Message>>)application.getAttribute("subjectList");
				//is make subject
				SubjectCheck check = new SubjectCheck();
				boolean isSubject = check.check(subjectMap,subject);
				if(isSubject) {
					ArrayList<Message> mslist = new ArrayList<>();
					subjectMap.put(subject, mslist);
					application.setAttribute("subjectList", subjectMap);
				}else {
					request.setAttribute("error","true");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/succcess.jsp");
					dispatcher.forward(request,response);
				}
			}else {
				/*マップを初期化*/
				
				TreeMap<String,ArrayList<Message>> subjectMap = new TreeMap<>();
				//空のリストを作成
				ArrayList<Message> mslist = new ArrayList<Message>();
				subjectMap.put(subject, mslist);
				//マップに教科名付きのリストを格納
				application.setAttribute("subjectList", subjectMap);
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("Login?action=reLogin");
			dispatcher.forward(request, response);
		}else if(action.equals("addMessageFoward")) {
			//科目名を取得しフォワード
			String subject = request.getParameter("subject");
			request.setAttribute("subject", subject);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/newMessageEntry.jsp");
			dispatcher.forward(request, response);
		}else if(action.equals("delete")) {
			String subject = request.getParameter("subject");
			int listNumber = Integer.parseInt((String)request.getParameter("listNumber"));
			
			TreeMap<String,ArrayList<Message>> subjectMap = (TreeMap<String,ArrayList<Message>>)application.getAttribute("subjectList");
			ArrayList<Message> list = subjectMap.get(subject);
			list.remove(listNumber-1);
			
			subjectMap.put(subject, list);
			application.setAttribute("subjectList", subjectMap);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Login?action=reLogin");
			dispatcher.forward(request, response);
		}
	}

}
