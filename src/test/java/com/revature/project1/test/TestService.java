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
import com.revature.project1.service.*;
import com.revature.project1.pojo.*;


public class TestService {
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

		emp.setEmployeeId("J123");
		emp.setFirstName("Jim");
		emp.setPassword("password");
		emp2.setEmployeeId("J123");
		emp2.setFirstName("Jim");
		emp2.setPassword("password");
		req.setRequestId(1);
		req.setReimburseType("College");
		
		empList.add(emp);
		reqList.add(req);
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testValidateUserCorrectInput() {
		AuthenticateLoginService val = new ValidateUser();
		assertTrue(emp.equals(val.authenticate(emp.getEmployeeId(), emp.getPassword())));
	}

	@Test
	public void testValidateUserIncorrectInput() {
		AuthenticateLoginService val = new ValidateUser();
		emp2.setPassword("notPassword");
		assertFalse(emp.equals(val.authenticate(emp.getEmployeeId(), emp2.getPassword())));
	}

	@Test
	public void testValidateUserIncorrectInputNull() {
		AuthenticateLoginService val = new ValidateUser();
		emp2.setPassword("notPassword");
		assertNull(val.authenticate(emp.getEmployeeId(), emp2.getPassword()));
	}

}
