package com.revature.project1.dao;

import java.util.List;

import com.revature.project1.pojo.Employee;
import com.revature.project1.pojo.Request;

public interface PostgresDao {
	// CRUD methods
	
	// CREATE
	public void createRequest(Request req); // Form Data
	

	// READ
	public List<Request> getRequests(); //get all requests to populate page.
	public List<Request> getRequests(Employee emp); //get all requests for an employee.
	public Employee getLogin(String id); //get one user based on user name at login
	public Request getRequestDetails(Request req);
	
	// UPDATE
	
	
	// DELETE

}
