package com.revature.project1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.revature.project1.pojo.Employee;
import com.revature.project1.pojo.Request;
import com.revature.project1.utilities.ConnectionFactory;

public class PostgresDaoImpl implements PostgresDao {
	public static Logger log = Logger.getRootLogger();

	public PostgresDaoImpl() {
	}

	@Override
	public List<Request> getRequests() {
		log.trace("getRequest()");
		List<Request> reqList = new ArrayList<Request>();
		Request req = new Request();
		
		try (Connection conn = ConnectionFactory.getConnection()) {
			String query =
					"SELECT * FROM request";
					//"SELECT * FROM customers_proj_0 " +
					//"WHERE userid = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			log.debug("ps made");
			//ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			log.debug("rs made");

			if(rs.next()) {
				log.debug("rs.next() returns true");
				req.setRequestId(rs.getInt("requestId"));
				req.setEventName(rs.getString("eventName"));
				reqList.add(req);
			} else {
				log.debug("rs.next() returned empty");
			}
			
			/*
			if(!recordExists(e.userId, 'E')) { // If the vehicle is not a duplicate entry
			} else {
				System.out.println("Duplicate Employee Entry!");
			*/
			/*
			while(rs.next()) {
				c = new Customer();
				c.firstName = rs.getString("firstName");
				c.lastName = rs.getString("lastName");
				c.address = rs.getString("address");
				c.userId = rs.getString("userid");
				c.password = rs.getString("password");
				c.email = rs.getString("email");
				c.creditCard = rs.getString("creditCard");
			}
			*/
		} catch (SQLException err) {
			err.printStackTrace();
		}
		return reqList;
	}

	/*
	public static boolean recordExists(String id, Character ch) {
		log.trace("recordExists(String,Character)");
		Boolean duplicate = false;
		String query = "";
		switch(ch) {
		case 'E': query = "SELECT * FROM employees_proj_0 WHERE userid=?";
					break;
		case 'C': query = "SELECT * FROM customers_proj_0 WHERE userid=?";
					break;
		case 'V': query = "SELECT * FROM vehicles_proj_0 WHERE vin=?";
					break;
		}
		log.debug("Query String: " + query);
		log.debug("ID: " + id);
		try (Connection conn = DriverManager.getConnection(credentials[0], credentials[1], credentials[2])) {
			log.debug("recordExists postgres connection");
			PreparedStatement psCheckUnique = conn.prepareStatement(query);
			psCheckUnique.setString(1, id);
			log.debug("psCheckUnique");
			ResultSet rsCheckUnique = psCheckUnique.executeQuery();
			log.debug("rsCheckUnique");
			duplicate = rsCheckUnique.next();
			log.debug("duplicate=rsChechUnique assigns " + duplicate);
			duplicate = rsCheckUnique.next();
			if(duplicate) {
				log.debug("Duplicate exists");
				System.out.println("Duplicate exists");
			}
		} catch(SQLException err) {
			err.printStackTrace();
		}
		return duplicate;
	}
	*/

	@Override
	public List<Request> getRequests(Employee emp) {
		return null;
	}
	
	@Override
	public Employee getLogin(String id) {
		log.trace("getLogin()");
		Employee emp = new Employee();
		
		try (Connection conn = ConnectionFactory.getConnection()) {
			String query =
					"SELECT * FROM employee WHERE employeeId=?";
					//"SELECT * FROM customers_proj_0 " +
					//"WHERE userid = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1,id);
			log.debug("ps made");
			//ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			log.debug("rs made");

			if(rs.next()) {
				log.debug("rs.next() returns true");
				emp.setUserId(rs.getString("employeeId"));
				emp.setName(rs.getString("employeeName"));
				emp.setPassword(rs.getString("employeePassword"));
			} else {
				log.debug("rs.next() returned empty");
			}
			
			/*
			if(!recordExists(e.userId, 'E')) { // If the vehicle is not a duplicate entry
			} else {
				System.out.println("Duplicate Employee Entry!");
			*/
			/*
			while(rs.next()) {
				c = new Customer();
				c.firstName = rs.getString("firstName");
				c.lastName = rs.getString("lastName");
				c.address = rs.getString("address");
				c.userId = rs.getString("userid");
				c.password = rs.getString("password");
				c.email = rs.getString("email");
				c.creditCard = rs.getString("creditCard");
			}
			*/
		} catch (SQLException err) {
			err.printStackTrace();
		}
		return emp;
	}
}