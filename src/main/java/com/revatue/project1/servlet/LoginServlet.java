package com.revatue.project1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.apache.log4j.Logger;

import com.revature.project1.pojo.Employee;
import com.revature.project1.service.*;

public class LoginServlet extends HttpServlet{
	private static Logger log = Logger.getRootLogger();
	public LoginServlet() {
	}
	private static AuthenticateLoginService serv = new ValidateUser();
		
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.debug("ValidateUser()");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		log.debug("Username: " + username + " Password: " + password);
		Employee emp = serv.authenticate(username, password);
		System.out.println("Empolyee: " + emp);
		if (emp == null) {
			log.debug("emp is null");
			resp.setStatus(resp.SC_UNAUTHORIZED);
		} else {
			log.debug("emp is not null");
			HttpSession sess = req.getSession(true);
			sess.setAttribute("employee", emp);
			resp.sendRedirect("bencoMenu");
		}
	}

	
}
