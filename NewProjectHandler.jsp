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

try {		
    StringBuffer projStatus = new StringBuffer();    
            
    boolean titleIsOkay = (title.length() >= 10) && (title.length() <= 70);
    boolean budgetIsOkay = (budget.length() >= 2) && (budget.length() <= 20);       
    boolean descriptionIsOkay = description.length() <= 1000;

    if (!(titleIsOkay && budgetIsOkay && descriptionIsOkay)) {
        projStatus.append("<div class='text-center '>" 
                            + "<h5><strong>Failed to create a new project.</strong></h5>" 
                            + "</div>"
                            + "<ol>");       
        if (!titleIsOkay) {
            projStatus.append("<li>Title must be between 10 and 70 characters long</li>");
        }
        if (!budgetIsOkay) {
            projStatus.append("<li>Budget must be between 2 and 20 characters long</li>");
        }        
        if (!descriptionIsOkay) {
            projStatus.append("<li>Description must be less than 1000 characters long</li>");
        }        
        projStatus.append("</ol>");

    } else {
        int projectId = new ProjectDAO().getProjects().size() + 1;
        String username = ((User)request.getSession().getAttribute("user-object")).getUsername();
        Project newProject = new Project(projectId, title, "Open", description, budget, category, username, null, "");
        new ProjectDAO().registerProject(newProject);
        
        projStatus.append("<h5><strong>Your project has been created successfully!</strong></h5>");
    }
    
    request.getSession().setAttribute("proj-status", projStatus.toString());
    response.sendRedirect("new-project.jsp");

} catch (Exception e) {
    e.getMessage();
}

%>