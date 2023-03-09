<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.ProjectDAO"%>
<%@ page import="freelance_paradise.Project"%>
<%@ page import="freelance_paradise.User"%>

<%

try {		
    int projectId = Integer.parseInt(request.getParameter("projectId"));
    User user = (User)request.getSession().getAttribute("user-object");

    new ProjectDAO().updateSeller(projectId, user.getUsername());
    new ProjectDAO().updateState(projectId, "On-going");
    
    response.sendRedirect("project.jsp?projectId=" + projectId);

} catch (Exception e) {
    e.getMessage();
}

%>