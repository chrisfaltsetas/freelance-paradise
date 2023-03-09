<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.UserDAO"%>
<%@ page import="freelance_paradise.User"%>

<%

String about = request.getParameter("about");
String urlUsername = request.getParameter("username");

try {		
    StringBuffer editStatus = new StringBuffer();
        
    boolean aboutIsOkay = about.length() <= 1000;
    
    if (!aboutIsOkay) {
        editStatus.append("<h5><strong>About section needs to be less than 1000 characters</strong> (exceeding by " + (about.length() - 1000) + " characters).</h5>");
    } else {
        User user = (User)request.getSession().getAttribute("user-object");
        new UserDAO().updateAbout(user.getUsername(), about);
        user.setAbout(about);
        editStatus.append("<h5><strong>About section has been saved.</strong></h5>");
    }

    request.getSession().setAttribute("edit-status", editStatus.toString());
    response.sendRedirect("profile.jsp?username=" + urlUsername);

} catch (Exception e) {
    e.getMessage();
}

%>