<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.CategoryDAO"%>
<%@ page import="freelance_paradise.Category"%>
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

        <title>Edit Project</title>

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
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            Project project = new ProjectDAO().findProject(projectId);
        %>
            <div class="page-header">
                <h1 class="text-center"><%=project%></h1>
                <h4 class="text-center">Freelancer:
                <%  if (project.getSeller() == null) {
                        %><i>none</i><%
                    } else {
                        %><a href="profile.jsp?username=<%=project.getSeller()%>"><%=project.getSeller()%></a><%
                    } %>
                </h4>
            </div>

            <%  
                String projStatus = (String)request.getSession().getAttribute("edit-proj-status");
                if (projStatus != null && !projStatus.isEmpty()) {
                    if (projStatus.contains("success")) {
            %>
                        <div class="container narrow-form-1">
                            <div class="alert alert-success" role="alert">
                                <%= projStatus %>
                            </div>
                        </div>
            <%
                    } else {
            %>
                        <div class="container narrow-form-1">
                            <div class="alert alert-danger" role="alert">
                                <%= projStatus %>
                            </div>
                        </div>
			<%
                    }
                    request.getSession().setAttribute("edit-proj-status", null);
                }
            %>

            <div class="project-edit">
                <form method="post" action="ApplyHandler.jsp?projectId=<%=projectId%>">
                    <div>
                        <div class="form-group">
                            <label for="inputTitle">Project Title (max 70 characters):</label>
                            <input type="text" class="form-control" id="inputTitle" name="title" value="<%=project.getTitle()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="inputCategory">Category:</label>
                            <select class="form-control" id="inputCategory" name="category" disabled>
                            <%
                                List<Category> categories = new CategoryDAO().getCategories();
                                for (Category categ : categories) {
                                    if (categ.getTitle().equals(project.getCategoryTitle())) {
                                        %> <option selected="selected"> <%=categ.getTitle()%> </option> <%
                                    } else {
                                        %> <option> <%=categ.getTitle()%> </option> <%
                                    }
                                }
                            %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputState">State:</label>
                            <select class="form-control" id="inputState" name="state" disabled>
                            <%
                                String state = project.getState();
                                if (state.equals("Open")) {
                                    %> <option selected="selected">Open</option> <%
                                } else {
                                    %> <option>Open</option> <%
                                }
                                if (state.equals("On-going")) {
                                    %> <option selected="selected">On-going</option> <%
                                } else {
                                    %> <option>On-going</option> <%
                                }
                                if (state.equals("Completed")) {
                                    %> <option selected="selected">Completed</option> <%
                                } else {
                                    %> <option>Completed</option> <%
                                }
                            %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputBudget">Budget:</label>
                            <input type="text" class="form-control" id="inputBudget" name="budget" value="<%=project.getBudget()%>" readonly>
                        </div>
                        <div class="form-group">
                            <label for="inputDescription">Description (max 1000 characters):</label>
                            <textarea rows=10 type="text" class="form-control" id="inputDescription" name="description" readonly><%=project.getDescr()%></textarea>
                        </div>
                        
                    </div>
                    <%  if(project.getSeller() == null) { %>
                            <div>
                                <div class="form-group">            
                                    <button type="submit" class="btn btn-white btn-save">
                                        <span class="glyphicon glyphicon-ok"></span> Get the job!
                                    </button>
                                </div>
                            </div>
                    <%  } %>
                </form>

                <form method="post" action="ChatHandler.jsp?projectId=<%=projectId%>">
                    <div class="chat">
                        <label for="inputChat">Chat:</label>
                        <textarea rows=24 type="text" class="form-control" id="inputChat" name="chat" readonly><%=project.getChat()%></textarea>
                    </div>
                    <div class="message">
                        <textarea rows=2 type="text" class="form-control" id="inputMessage" name="message"></textarea>
                    </div>
                    <div class="send">            
                        <button type="submit" class="btn btn-white btn-send">Send 
                            <span class="glyphicon glyphicon-send"></span> 
                        </button>
                    </div>
                </form>
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