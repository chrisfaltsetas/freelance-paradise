<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

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
            <jsp:include page="navbar_logged-out.jsp"/>
                
            <div class="page-header text-center">
                <h1>Freelance Paradise</h1>
            </div>

            <div class="container">
                <%  if(exception != null) { %>
                        <h2 class="text-center">Error 404</h2>

                        <div class="container narrow-form-2" role="alert">
                            <h4>There has been an error loading your page.</h4>
                            <a href="dashboard.jsp" class="btn btn-white"> 
                                <span class="glyphicon glyphicon-arrow-left"></span> Go back
                            </a>
                            <p><%= exception %></p>
                        </div>

                <%  } %>
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