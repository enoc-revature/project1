package com.revatue.project1.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.google.gson.GsonBuilder;
import com.revature.project1.pojo.Request;

/**
 * Servlet implementation class SubmitFormData
 */
public class SubmitFormData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static Logger log = Logger.getRootLogger();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitFormData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("SubmitFormData -> doGet");
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("SubmitFormData -> doPost");
		//doGet(request, response);
		//HttpSession sess = req.getSession(false);
		HttpSession sess = request.getSession(false);

//		if (sess != null && sess.getAttribute("user") != null) { // user has logged in
//			System.out.println("Logged in");
//			System.out.println(sess.getAttribute("user"));
//			String carJson = req.getReader().readLine();
//			System.out.println(carJson);
//			Car myCar = new GsonBuilder().create().fromJson(carJson, Car.class);
//			try {
//				carService.addCar(myCar);
//				resp.getWriter().write("Success");
//			} catch (CarInsertionException e) {
//				resp.setStatus(resp.SC_INTERNAL_SERVER_ERROR);
//				resp.getWriter().write("Car could not be created");
//			}

		if (sess != null && sess.getAttribute("employee") != null) {
			log.debug("Logged in");
			log.debug(sess.getAttribute("employee"));
			String reqJson = request.getReader().readLine();
			log.debug(reqJson);
			Request req = new GsonBuilder().create().fromJson(reqJson, Request.class);
			try {
				
			} catch(Exception e) {
				response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
				response.getWriter().write("Car could not be created");
			}

		} else {
			response.getWriter().write("User not logged in");
			response.setStatus(response.SC_UNAUTHORIZED);
		}

	}

}
