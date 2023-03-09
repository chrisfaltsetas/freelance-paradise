<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.ProjectDAO"%>
<%@ page import="freelance_paradise.Project"%>
<%@ page import="freelance_paradise.User"%>

<%

String chat = request.getParameter("chat");
String message = request.getParameter("message");

try {		
    int projectId = Integer.parseInt(request.getParameter("projectId"));
    User user = (User)request.getSession().getAttribute("user-object");
    message = user.getUsername() + ": " + message + "\n";
    chat += message;

    new ProjectDAO().updateChat(projectId, chat);
    
    response.sendRedirect("edit-project.jsp?projectId=" + projectId);

} catch (Exception e) {
    e.getMessage();
}

%>