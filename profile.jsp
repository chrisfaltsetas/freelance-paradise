<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.UserDAO"%>
<%@ page import="freelance_paradise.User"%>

<%
    if (session.getAttribute("user-object") == null) {
        response.sendRedirect("index.jsp");
    } else {
        User user = (User)request.getSession().getAttribute("user-object");
        String urlUsername = request.getParameter("username");
        User urlUser = new UserDAO().findUser(urlUsername);
        boolean isSameUser = (user.getUsername()).equals(urlUser.getUsername());
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="icon" href="images/fp-images/logo3.png">

        <title>My profile</title>

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
            <%  if (isSameUser) { %>
                    <h1 class="text-center">My Profile</h1>
                    <h3 class="text-center"> <%= user.getUsername() %> </h3>
            <%  } else { %>
                    <h1 class="text-center"> <%= urlUser.getUsername() %> </h1>
            <%  } %>
            </div>

            <%  
                String editStatus = (String)request.getSession().getAttribute("edit-status");
                if (editStatus != null && !editStatus.isEmpty()) {
                    if (editStatus.contains("save")) {
            %>
                        <div class="container narrow-form-1">
                            <div class="alert alert-success" role="alert">
                                <%= editStatus %>
                            </div>
                        </div>
            <%                        
                        request.getSession().setAttribute("edit-status", null);
                    } else {
            %>
                        <div class="container narrow-form-1">
                            <div class="alert alert-danger" role="alert">
                                <%= editStatus %>
                            </div>
                        </div>
			<% 
                        request.getSession().setAttribute("edit-status", null);
                    }
                }
            %>

            <form class="container" method="post" action="EditProfileHandler.jsp?username=<%=urlUsername%>">
                <div class="narrow-form-1">
                    <div class="form-group">
                        <label for="inputAbout">About (max 1000 characters):</label>
                        <%  if (isSameUser) { %>
                                <textarea rows=10 type="text" class="form-control" id="inputAbout" name="about"><%=user.getAbout()%></textarea>
                        <%  } else { %>
                                <textarea rows=10 type="text" class="form-control" id="inputAbout" name="about" readonly><%=urlUser.getAbout()%></textarea>
                        <%  } %>
                        
                    </div>
                </div>
                <%  if (isSameUser) { %>
                    <div class="narrow-form-2">
                        <div class="form-group">            
                            <button type="submit" class="btn btn-white">
                                <span class="glyphicon glyphicon-ok"></span> Save
                            </button>
                            <button type="reset" class="btn btn-white btn-new-clear">
                                <span class="glyphicon glyphicon-remove"></span> Undo changes
                            </button>
                        </div>
                    </div>                    
                <%  } %>                
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