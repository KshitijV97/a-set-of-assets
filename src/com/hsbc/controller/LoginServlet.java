package com.hsbc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hsbc.dao.AuthenticationDao;

public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int userid = Integer.parseInt(request.getParameter("username"));
		String password = request.getParameter("password");
		AuthenticationDao authDao = new AuthenticationDao();
		/*
		The function verifyCredentials(username, password) is written assuming that USERNAME and PASSWORD are stored in USERS table, If not then move the verifyCredentials(username, password) function from UserBeanDao to 
		 */
		if(authDao.verifyCredentials(userid, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			response.sendRedirect("welcome.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	}
}
