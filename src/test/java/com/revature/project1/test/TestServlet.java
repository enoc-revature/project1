package com.revature.project1.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.revature.project1.pojo.*;
import com.revature.project1.servlet.*;

public class TestServlet {
	public static Logger log = Logger.getRootLogger();
	Employee emp;
	Employee emp2;
	Request req;
	List<Request> reqList = new ArrayList<Request>();
	List<Employee> empList = new ArrayList<Employee>();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		emp = new Employee();
		emp2 = new Employee();
		req = new Request();
		reqList.clear();
		empList.clear();

		emp.setUserId("J123");
		emp.setName("Jim");
		emp.setPassword("password");
		emp2.setUserId("J123");
		emp2.setName("Jim");
		emp2.setPassword("password");
		req.setRequestId(1);
		req.setEventName("College");
		
		empList.add(emp);
		reqList.add(req);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
