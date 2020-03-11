package com.revature.project1.service;

import org.apache.log4j.Logger;

import com.revature.project1.dao.PostgresDao;
import com.revature.project1.dao.PostgresDaoImpl;
import com.revature.project1.pojo.Employee;

public class ValidateUser implements AuthenticateLoginService {
	public static Logger log = Logger.getRootLogger();
	public ValidateUser() {
	}

	private static PostgresDao dao = new PostgresDaoImpl();
	private static Employee emp = new Employee();

	@Override
	public Employee authenticate(String username, String password) {
		log.trace("authenticate(String, String)");
		emp = dao.getLogin(username);
		log.debug("emp!=null : " + (emp != null));
		log.debug("password equals : " + emp.getPassword().equals(password));
		//log.debug("emp != null && emp.getPassword().equals(password)" + (emp != null && emp.getPassword().equals(password)));
		if (emp != null && emp.getPassword().equals(password)) {
			//log.debug("debug");
			return emp;
		}
		return null;
	}
}
