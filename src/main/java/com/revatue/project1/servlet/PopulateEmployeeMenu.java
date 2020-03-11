package com.revatue.project1.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.revature.project1.dao.PostgresDao;
import com.revature.project1.dao.PostgresDaoImpl;
import com.revature.project1.pojo.Employee;
import com.revature.project1.pojo.Request;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
/**
 * Servlet implementation class PopulateEmployeeMenu
 */
public class PopulateEmployeeMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Logger log = Logger.getRootLogger();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopulateEmployeeMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		log.trace("PopulateEmployeeMenu -> doService");
//		//System.out.println("PopulateEmployeeMenu -> doService");
//	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.trace("PopulateEmployeeMenu -> doGet");
		System.out.println("PopulateEmployeeMenu -> doGet");
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sess = request.getSession(false);
		log.debug("sess!=null : " + (sess!=null));
		log.debug("sess.getAttribute(employee) != null" + (sess.getAttribute("employee") != null));
		if (sess != null && sess.getAttribute("employee") != null) { // user has logged in
			log.debug("debug");
			PostgresDao dao = new PostgresDaoImpl();
			Employee emp = (Employee) sess.getAttribute("employee");
			List<Request> reqList = dao.getRequests(emp);
			log.debug("reqList is null? " + (reqList == null));
			String reqJsonList = new GsonBuilder().create().toJson(reqList);
			PrintWriter pw = response.getWriter();
			pw.write(reqJsonList);
			log.debug("reqJsonList: " + reqJsonList);
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
		//doGet(request, response);
		//Employee emp = (Employee) request.getAttribute("employee");
//		PostgresDao dao = new PostgresDaoImpl();
//		HttpSession sess = request.getSession(false);
//		Employee emp = (Employee) sess.getAttribute("employee");
//		List<Request> reqList = dao.getRequests(emp);
//		String reqJsonList = new GsonBuilder().create().toJson(reqList);
//		log.debug("reqJsonList: " + reqJsonList);
		log.trace("PopulateEmployeeMenu -> doPost");
		//System.out.println("PopulateEmployeeMenu -> doPost");
		
	}

}
