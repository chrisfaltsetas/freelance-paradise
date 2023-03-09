<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="freelance_paradise.User"%>

<%
    User user = (User)request.getSession().getAttribute("user-object");
%>

<!-- Navbar -->
<nav class="navbar navbar-default navbar-static-top theme-color my-navbar">
    <div class="container">
        <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="dashboard.jsp"><b>Freelance Paradise</b></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-right">
            <li><a href="browse.jsp">Browse Projects</a></li>
            <li><a href="dashboard.jsp">My Projects</a></li>
            <li><a href="profile.jsp?username=<%=user.getUsername()%>"><span class="glyphicon glyphicon-user"></span> <%=user.getUsername()%></a></li>
            <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
        </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
<!-- End Navbar -->