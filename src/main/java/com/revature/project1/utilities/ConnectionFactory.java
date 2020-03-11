package com.revature.project1.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.log4j.Logger;

public class ConnectionFactory {
	public static Logger log = Logger.getRootLogger();
	private final String USERNAME = System.getenv("2002_POSTGRES_USERNAME");
	private final String PASSWORD = System.getenv("2002_POSTGRES_PASSWORD");
	//private final String DATABASE = "test_project1_trms";
	private final String DATABASE = "demo_project1_trms";
	private String URL = System.getenv("LOCALHOST_POSTGRES_FULL") + DATABASE + "?";
	//private final String SCHEMA = "test_project1_trms";
	private static ConnectionFactory connectionFactory;

	public static Connection getConnection() {
		if(connectionFactory == null)
			connectionFactory = new ConnectionFactory();
		return connectionFactory.createConnection();
	}
	
	private Connection createConnection() {
		log.trace("Connection created.");
		log.debug("URL="+URL);
		log.debug("USERNAME="+USERNAME);
		log.debug("PASSWORD="+PASSWORD);
		//log.debug("SCHEMA="+SCHEMA);
		Connection conn = null;
		
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
			
		try {
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			//conn.setSchema(SCHEMA);
		} catch(SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}
}
