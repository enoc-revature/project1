package com.revature.project1.service;

import com.revature.project1.pojo.Employee;

public interface AuthenticateLoginService {
	public Employee authenticate(String username, String password);
}
