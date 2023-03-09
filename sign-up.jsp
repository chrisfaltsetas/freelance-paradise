<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="icon" href="images/fp-images/logo3.png">

        <title>Sign Up</title>

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/fp_style.css">
    </head>
    <body class="theme-color-dark">

        <div class="bottom-margin">
            <jsp:include page="navbar_logged-out.jsp"/>
            
            <div class="page-header">
                <h1 class="text-center">Sign Up</h1>
                <h4 class="text-center">Already have an account? <a class="text-aqua" href="log-in.jsp">Log In</a></h4>
            </div>

            <%  
                String regStatus = (String)request.getSession().getAttribute("reg-status");
                if (regStatus != null && !regStatus.isEmpty()) {
                    if (regStatus.contains("Success")) {
            %>
                        <div class="container narrow-form-1">
                            <div class="alert alert-success" role="alert">
                                <%= regStatus %>
                            </div>
                        </div>
            <%
                    } else {
            %>
                    <div class="container narrow-form-1">
                        <div class="alert alert-danger" role="alert">
                            <%= regStatus %>
                        </div>
                    </div>
			<% 
                    }
                    request.getSession().setAttribute("reg-status", null);
                }
            %>

            <form class="container" method="post" action="RegisterHandler.jsp">
                <div class="narrow-form-1">
                    <div class="form-group col-sm-6">
                        <label for="inputName">Name:</label>
                        <input type="text" class="form-control" id="inputName" name="name" placeholder="John" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="inputSurname">Surname:</label>
                        <input type="text" class="form-control" id="inputSurname" name="surname" placeholder="Doe" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="inputUsername">Username:</label>
                        <input type="text" class="form-control" id="inputUsername" name="username" placeholder="jdoe" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="inputEmail">Email:</label>
                        <input type="email" class="form-control" id="inputEmail" name="email" placeholder="john.doe@example.com" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="inputPassword">Password:</label>
                        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="********" required>
                    </div>
                    <div class="form-group col-sm-6">
                        <label for="inputConfirm">Confirm Password:</label>
                        <input type="password" class="form-control" id="inputConfirm" name="confirm" placeholder="********" required>
                    </div>
                </div>
                <div class="narrow-form-1">
                    <label class="user-type-label" for="inputUserType">User type:</label>
                    <select class="form-control user-type" id="inputUserType" name="type">
                        <option>Please select the type of user you are...</option>
                        <%
                            String type = request.getParameter("type");
                            if (type != null && type.equals("Costumer")) {
                                %> <option selected="selected">Customer</option> <%
                            } else {
                                %> <option>Customer</option> <%
                            }
                            if (type != null && type.equals("Freelancer")) {
                                %> <option selected="selected">Freelancer</option> <%
                            } else {
                                %> <option>Freelancer</option> <%
                            }
                        %>                        
                    </select>
                    <div class="form-group">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" id="inputCheckbox" name="checkbox"> I agree with the <i>Terms & Conditions</i> and the <i>Privacy Policy</i> of Freelance Paradise.
                            </label>
                        </div>
                    </div>
                    <div class="form-group">            
                        <button type="submit" class="btn btn-white btn-sign-up">
                            <span class="glyphicon glyphicon-ok"></span> Sign Up
                        </button>
                        <button type="reset" class="btn btn-white btn-clear">
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