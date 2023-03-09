<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.ProjectDAO"%>
<%@ page import="freelance_paradise.Project"%>
<%@ page import="freelance_paradise.User"%>
<%@ page import="java.util.List"%>

<%
	if (session.getAttribute("user-object") == null) {
        response.sendRedirect("index.jsp");
	} else {
		User user = (User)request.getSession().getAttribute("user-object");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="icon" href="images/fp-images/logo3.png">

        <title>Freelance Paradise</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/fp_style.css">
    </head>
    <body class="theme-color-dark">

        <div class="bottom-margin">

        <%
            if (user.getType().equals("Customer")) {
                %><jsp:include page="navbar_customer.jsp"/><%
            } else {
                %><jsp:include page="navbar_freelancer.jsp"/><%
            }
        %>

            <div class="page-header">
                <h1 class="text-center">Dashboard</h1>
            </div>
            
            <div class="project-view">
            
                <%
                if (user.getType().equals("Customer")) {
                    List<Project> projects = new ProjectDAO().getProjects("username", user.getUsername());
                    if (projects.size() == 0) {
                        response.sendRedirect("new-project.jsp");
                    } else {
                        for (Project project : projects) {
                        %>  <div>
                            <a href="edit-project.jsp?projectId=<%=project.getProjectId()%>">
                                <div>
                                    <h4><b><%=project.getTitle()%></b></h4>
                                    <p><%=project.getCategoryTitle()%></p>
                                    <p><b><%=project.getBudget()%></b></p>
                                    <p><%=project.getState()%></p>
                                </div>
                            </a>
                        </div>
                    <%
                        }
                    }
                } else {
                    List<Project> projects = new ProjectDAO().getProjects("seller", user.getUsername());
                    if (projects.size() == 0) {
                        %><i>You currently don't have any on-going projects.</i><%
                    } else {
                        for (Project project : projects) {
                        %>  <div>
                            <a href="project.jsp?projectId=<%=project.getProjectId()%>">
                                <div>
                                    <h4><b><%=project.getTitle()%></b></h4>
                                    <p><%=project.getCategoryTitle()%></p>
                                    <p><b><%=project.getBudget()%></b></p>
                                    <p><%=project.getState()%></p>
                                </div>
                            </a>
                        </div>
                    <%
                        }
                    }
                }
                %>
            </div>            

            <jsp:include page="footer.jsp"/>
            
        </div>

        <!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="js/bootstrap.min.js"></script>
    </body>
</html>

<% } %>