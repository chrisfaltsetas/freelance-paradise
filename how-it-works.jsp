<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

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
                <h1>How it works</h1>
            </div>

            <div class="container">
                <h4 class="narrow-form-2"><b>If you are a Freelancer:</b></h4>

                <ul class="narrow-form-2 bullets">
                    <li>Make sure you Sign Up and Log In using your username and password.</li>
                    <li>Use the browse projects button, located at the top-right corner of your screen, to look for projects that suit your skills.</li>
                    <li>When you find a project that suits you, communicate with the customer via the chat box to discuss any further details about the project.</li>
                    <li>After agreeing with the customer on details like delivery time, price, ect., click the "Get the job!" button and you are ready to go!</li>
                    <li>You can view the projects you are currently working by clicking the "My Projects" button located at the top-right corner of your screen.</li>
                </ul>
            </div>
            <div class="container extra-bottom-margin">
                <h4 class="narrow-form-2"><b>If you are a Customer:</b></h4>
                
                <ul class="narrow-form-2 bullets">
                    <li>Make sure you Sign Up and Log In using your username and password.</li>
                    <li>After you Log In, you will be redirected to a page where you can create your first project.</li>
                    <li>Then you will have to wait in order for some freelancers to take interest in your project.</li>
                    <li>If freelancers take interest in your project, communicate with them via the chat box  in order to agree on details like the payment method.</li>
                    <li>When you reach an agreement the freelancer will take the job and you will have to wait until it is completed.</li>
                    <li>You can make more projects by clicking the new project button located at the top-right corner of your screen.</li>
                </ul>
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