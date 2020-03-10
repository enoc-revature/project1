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
		System.out.println("Something");
		String empUsername = req.getParameter("empUsername");
		String empPassword = req.getParameter("empPassword");
		String benUsername = req.getParameter("benUsername");
		String benPassword = req.getParameter("benPassword");
		log.debug("Username: " + empUsername + " Password: " + empPassword);
		log.debug("Username: " + benUsername + " Password: " + benPassword);
		if(!benPassword.contentEquals("")) {
			Employee emp = serv.authenticate(empUsername, empPassword);
			System.out.println("Empolyee: " + emp);
			if (emp == null) {
				log.debug("emp is null");
				resp.setStatus(resp.SC_UNAUTHORIZED);
			} else {
				log.debug("emp is not null");
				HttpSession sess = req.getSession(true);
				sess.setAttribute("employee", emp);
				resp.sendRedirect("employeeMenu.html");
			}
		} else {
			Employee emp = serv.authenticate(benUsername, benPassword);
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
}
