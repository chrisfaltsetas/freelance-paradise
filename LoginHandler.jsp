<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.UserDAO"%>
<%@ page import="freelance_paradise.User"%>

<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	UserDAO userDAO = new UserDAO();

	try {		

		boolean isAuthenticated = userDAO.authenticate(username, password); 
		if (isAuthenticated == true) {
			User user = userDAO.findUser(username);
			
			request.getSession().setAttribute("user-object", user);
			response.sendRedirect("dashboard.jsp");
 
		} else {
			request.getSession().setAttribute("message", "Wrong username or password. Please try again.");
			response.sendRedirect("log-in.jsp");
		}

	} catch (Exception e) {
		e.getMessage();
	}
%>