<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.ProjectDAO"%>
<%@ page import="freelance_paradise.Project"%>
<%@ page import="freelance_paradise.User"%>

<%

String title = request.getParameter("title");
String budget = request.getParameter("budget");
String description = request.getParameter("description");
String category = request.getParameter("category");
String state = request.getParameter("state");

try {
    int projectId = Integer.parseInt(request.getParameter("projectId"));
		
    StringBuffer editProjStatus = new StringBuffer();    
            
    boolean titleIsOkay = (title.length() >= 10) && (title.length() <= 70);
    boolean budgetIsOkay = (budget.length() >= 2) && (budget.length() <= 20);       
    boolean descriptionIsOkay = description.length() <= 1000;

    if (!(titleIsOkay && budgetIsOkay && descriptionIsOkay)) {
        editProjStatus.append("<div class='text-center '>" 
                            + "<h5><strong>Failed to upadte your project.</strong></h5>" 
                            + "</div>"
                            + "<ol>");       
        if (!titleIsOkay) {
            editProjStatus.append("<li>Title must be between 10 and 70 characters long</li>");
        }
        if (!budgetIsOkay) {
            editProjStatus.append("<li>Budget must be between 2 and 20 characters long</li>");
        }        
        if (!descriptionIsOkay) {
            editProjStatus.append("<li>Description must be less than 1000 characters long</li>");
        }        
        editProjStatus.append("</ol>");

    } else {
        new ProjectDAO().updateProject(projectId, title, state, description, budget, category);
        
        editProjStatus.append("<h5><strong>Your project has been updated successfully!</strong></h5>");
    }
    
    request.getSession().setAttribute("edit-proj-status", editProjStatus.toString());
    response.sendRedirect("edit-project.jsp?projectId=" + projectId);

} catch (Exception e) {
    e.getMessage();
}

%>