package com.revatue.project1.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.revature.project1.pojo.Employee;
import com.revature.project1.service.AuthenticateLoginService;
import com.revature.project1.service.ValidateUser;

/**
 * Servlet implementation class EmployeeLoginServlet2
 */
public class EmployeeLoginServlet2 extends HttpServlet {
	private static Logger log = Logger.getRootLogger();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeLoginServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		//doGet(request, response);
//		System.out.println("Works");
//	}
	private static AuthenticateLoginService serv = new ValidateUser();
		
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		log.debug("ValidateUser()");
		System.out.println("Something");
		String empUsername = req.getParameter("empUsername");
		String empPassword = req.getParameter("empPassword");
		log.debug("Username: " + empUsername + " Password: " + empPassword);
		Employee emp = serv.authenticate(empUsername, empPassword);
		System.out.println("Empolyee: " + emp);
		if (emp == null) {
			log.debug("emp is null");
			resp.setStatus(resp.SC_UNAUTHORIZED);
		} else {
			log.debug("emp is not null");
			HttpSession sess = req.getSession(true);
			sess.setAttribute("employee", emp);
			resp.sendRedirect("html/employeeMenu.html");
		}
	}

}
