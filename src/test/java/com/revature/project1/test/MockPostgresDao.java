package com.revature.project1.test;

import static org.junit.Assert.*;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import com.revature.project1.dao.PostgresDaoImpl;
import com.revature.project1.pojo.Employee;
import com.revature.project1.pojo.Request;

//@FixMethodOrder(MethodSorters.JVM)
@RunWith(MockitoJUnitRunner.class)
public class MockPostgresDao {
	private static Logger log = Logger.getRootLogger();
	public List<Request> reqList;
	public Employee emp;

	@Mock
	PostgresDaoImpl dao = new PostgresDaoImpl();

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		reqList.clear();
		emp = new Employee();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		fail("Not yet implemented");
	}

}
