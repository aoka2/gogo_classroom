package Model;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public class RegistCheck {
	public static boolean execute(HttpServletRequest request,ServletContext application, String name, String pass) {
		Users user = (Users)application.getAttribute(name);
		if(user == null) {
			return true;
		}
		
		return false;
	}
}