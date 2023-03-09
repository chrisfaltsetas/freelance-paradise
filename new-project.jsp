<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.CategoryDAO"%>
<%@ page import="freelance_paradise.Category"%>
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

        <title>Create Project</title>

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
                <h1 class="text-center">Create a new project</h1>
            </div>

            <%  
                String projStatus = (String)request.getSession().getAttribute("proj-status");
                if (projStatus != null && !projStatus.isEmpty()) {
                    if (projStatus.contains("success")) {
            %>
                        <div class="container narrow-form-1">
                            <div class="alert alert-success" role="alert">
                                <%= projStatus %>
                            </div>
                        </div>
            <%                        
                        request.getSession().setAttribute("proj-status", null);
                    } else {
            %>
                        <div class="container narrow-form-1">
                            <div class="alert alert-danger" role="alert">
                                <%= projStatus %>
                            </div>
                        </div>
			<% 
                        request.getSession().setAttribute("proj-status", null);
                    }
                }
            %>

            <form class="container" method="post" action="NewProjectHandler.jsp">
                <div class="narrow-form-1">
                    <div class="form-group">
                        <label for="inputTitle">Project Title (max 70 characters):</label>
                        <input type="text" class="form-control" id="inputTitle" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="inputCategory">Category:</label>
                        <select class="form-control" id="inputCategory" name="category">
                        <%
                            List<Category> categories = new CategoryDAO().getCategories();
                            for (Category categ : categories) {
                        %>
                                <option> <%=categ.getTitle()%> </option>
                        <%
                            }
                        %>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="inputBudget">Budget:</label>
                        <input type="text" class="form-control" id="inputBudget" name="budget">
                    </div>
                    <div class="form-group">
                        <label for="inputDescription">Description (max 1000 characters):</label>
                        <textarea rows=10 type="text" class="form-control" id="inputDescription" name="description"></textarea>
                    </div>
                </div>
                <div class="narrow-form-2">
                    <div class="form-group">            
                        <button type="submit" class="btn btn-white">
                            <span class="glyphicon glyphicon-ok"></span> Publish
                        </button>
                        <button type="reset" class="btn btn-white btn-new-clear">
                            <span class="glyphicon glyphicon-remove"></span> Clear
                        </button>
                    </div>
                </div>
            </form>        

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