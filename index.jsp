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

        <title>Freelance Paradise</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/fp_style.css">
    </head>
    <body>

        <div class="bottom-margin">
            <jsp:include page="navbar_logged-out.jsp"/>
                
            <!-- Welcome -->
            <div id="welcome" class="container pretty-border">
                <h1 class="big-line-height"><b> Welcome to Paradise! </b></h1>
                <h3> Do you want to hire or work? </h3>			
                <div>
                    <a href="sign-up.jsp?type=Costumer" class="btn btn-warning">I want to Hire</a>
                    <a href="sign-up.jsp?type=Freelancer" class="btn btn-info btn-together">I want to Work</a>
                </div>
            </div>
            
            <!-- How it works -->
            <div id="how-it-works" class="container pretty-border">
                <h1 class="big-line-height"><b> How it works? </b></h1>
                <h3> Learn more on how our website works and get the most out of it. </h3>
                <a href="how-it-works.jsp" class="btn btn-fp">Learn more</a>
            </div>

            <!-- F.A.Q. -->
            <div id="faq" class="container pretty-border theme-color">
                <h1 class="big-line-height"><b>Frequently Asked Questions</b></h1>
                <h3>If you have any questions or problems using our site, please visit our F.A.Q. page.</h3>
                <a href="#" class="btn btn-warning">Check our F.A.Q.</a>
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