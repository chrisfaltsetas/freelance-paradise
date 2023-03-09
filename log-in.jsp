<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<%
	if (session.getAttribute("user-object") != null) {
        response.sendRedirect("dashboard.jsp");
	}
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="icon" href="images/fp-images/logo3.png">

        <title>Log In</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/fp_style.css">
    </head>
    <body class="theme-color-dark">

        <div class="bottom-margin">
            <jsp:include page="navbar_logged-out.jsp"/>
            
            <div class="page-header">
                <h1 class="text-center">Log In</h1>
                <h4 class="text-center">Don't have an account? <a class="text-aqua" href="sign-up.jsp">Sign Up</a></h4>
            </div>

            <% if(request.getSession().getAttribute("message") != null) { %>
                <div class="container narrow-form-2">
				    <div class="alert alert-danger text-center" role="alert">
                        <%=(String)request.getSession().getAttribute("message") %>
                    </div>
                </div>
			<% } %>

            <form class="container narrow-form-2" method="post" action="LoginHandler.jsp">
                <div class="form-group full-size">
                    <label for="inputName">Username:</label>
                    <input type="text" class="form-control" id="inputUsername" name="username" placeholder="jdoe" required>
                </div>
                <div class="form-group full-size">
                    <label for="inputSurname">Password:</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" placeholder="********" required>
                </div>
                <div class="form-group">            
                    <button type="submit" class="btn btn-white btn-log-in">
                        <span class="glyphicon glyphicon-log-in"></span> Log In
                    </button>          
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