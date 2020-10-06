package com.hsbc.controller;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hsbc.dao.UserBeanDao;

public class ForgotPassword extends HttpServlet {
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		String username = request.getParameter("username");
		UserBeanDao userBeanDao = new UserBeanDao();
		String question = userBeanDao.getQuestion(username);
		
		HttpSession session = request.getSession();
		session.setAttribute("question",question);
		session.setAttribute("username",username);
		response.sendRedirect("forgotPassword.jsp");
	}
}