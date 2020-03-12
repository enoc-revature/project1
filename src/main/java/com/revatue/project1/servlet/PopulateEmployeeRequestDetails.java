package com.revatue.project1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.google.gson.GsonBuilder;
import com.revature.project1.dao.PostgresDao;
import com.revature.project1.dao.PostgresDaoImpl;
import com.revature.project1.pojo.Employee;
import com.revature.project1.pojo.Request;

/**
 * Servlet implementation class PopulateEmployeeRequestDetails
 */
public class PopulateEmployeeRequestDetails extends HttpServlet {
	private static Logger log = Logger.getRootLogger();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopulateEmployeeRequestDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.trace("PopulateEmployeeRequestDetails -> doGet");
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sess = request.getSession(false);
		log.debug("sess!=null : " + (sess!=null));
		log.debug("sess.getAttribute(employee) != null" + (sess.getAttribute("employee") != null));
		if (sess != null && sess.getAttribute("employee") != null) { // user has logged in
			log.debug("debug");
			PostgresDao dao = new PostgresDaoImpl();
//			Employee emp = (Employee) sess.getAttribute("employee");
//			List<Request> reqList = dao.getRequests(emp);
			Request req = null; // FIX
			//Request req = dao.getRequestDetails(req);
			log.debug("reqList is null? " + (req == null));
			String reqJson = new GsonBuilder().create().toJson(req);
			PrintWriter pw = response.getWriter();
			pw.write(reqJson);
			log.debug("reqJsonList: " + reqJson);
		} else {
			response.getWriter().write("User not logged in");
			response.setStatus(response.SC_UNAUTHORIZED);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		log.trace("PopulateEmployeeRequestDetails -> doPost");
		//doGet(request, response);
	}

}
