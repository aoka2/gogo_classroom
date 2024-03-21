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

import Model.Message;

/**
 * Servlet implementation class makeComment
 */
@WebServlet("/makeComment")
public class makeComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ServletContext app = this.getServletContext();
		TreeMap<String,ArrayList<Message>> subjectMap = (TreeMap<String,ArrayList<Message>>)app.getAttribute("subjectList");
		String commnet = (String)request.getParameter("comment");
		String subject = (String)request.getParameter("subject");
		int listNumber = Integer.parseInt((String)request.getParameter("workName"));
		ArrayList<Message> mslist = subjectMap.get(subject);
		Message ms = mslist.get(listNumber-1);
		ArrayList<String> commnetlist = ms.getCommnet();
		commnetlist.add(commnet);
		System.out.println(commnet);
		ms.setCommnet(commnetlist);
		mslist.set(listNumber-1, ms);
		subjectMap.put(subject,mslist);
		app.setAttribute("subjectList", subjectMap);
		
		
		request.setAttribute("subject", subject);
		request.setAttribute("listNumber", (String)request.getParameter("workName"));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/view/messageDisplay.jsp");
		dispatcher.forward(request, response);
	}

}
