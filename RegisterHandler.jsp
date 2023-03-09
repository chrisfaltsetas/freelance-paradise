<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="freelance_paradise.UserDAO"%>
<%@ page import="freelance_paradise.User"%>

<%

String name = request.getParameter("name");
String surname = request.getParameter("surname");
String email = request.getParameter("email");
String username = request.getParameter("username");
String password = request.getParameter("password");
String confirm = request.getParameter("confirm");
String type = request.getParameter("type");
String checkbox = request.getParameter("checkbox");

try {		
    StringBuffer regStatus = new StringBuffer();
    
    if (checkbox == null) {
        regStatus.append("<strong>Registration Failed.</strong> You must agree to the Terms and Conditions in order to register.");
        request.setAttribute("message", regStatus);
        response.sendRedirect("sign-up.jsp");
    } else {
        boolean usernameIsUnique = false;					
        if (new UserDAO().findUser(username) == null) {
            usernameIsUnique = true;
        }
        boolean usernameIsOkay = (username.length() >= 4) && (username.length() <= 20);
        boolean nameIsOkay = (name.length() >= 3) && (name.length() <= 30);
        boolean surnameIsOkay = (surname.length() >= 3) && (surname.length() <= 20);
        boolean emailIsUnique = false;					
        if (new UserDAO().findUserEmail(email) == null) {
            emailIsUnique = true;
        }
        boolean emailIsOkay = (email.length() > 0) && (email.length() <= 50);
        boolean passwordIsOkay = (password.length() >= 5) && (password.length() <= 30);
        boolean passwordsMatch = password.equals(confirm);
        boolean typeIsValid = type.equals("Freelancer") || type.equals("Customer");

        if (!(usernameIsUnique && usernameIsOkay && nameIsOkay && surnameIsOkay && emailIsUnique && emailIsOkay && passwordIsOkay && passwordsMatch && typeIsValid)) {
            regStatus.append("<div class='text-center '>" 
                                + "<h5><strong>Registration Failed.</strong></h5>" 
                                + "</div>"
                                + "<ol>");
            if (!usernameIsUnique) {
                regStatus.append("<li>Username " + username + " already exists</li>");
            }
            if (!usernameIsOkay) {
                regStatus.append("<li>Username must be between 4 and 20 characters long</li>");
            }
            if (!nameIsOkay) {
                regStatus.append("<li>Name must be between 3 and 30 characters long</li>");
            }
            if (!surnameIsOkay) {
                regStatus.append("<li>Surname must be between 3 and 20 characters long</li>");
            }
            if (!emailIsUnique) {
                regStatus.append("<li>Email " + email + " already exists</li>");
            }
            if (!emailIsOkay) {
                regStatus.append("<li>Email must be less than 50 characters long</li>");
            }
            if (!passwordIsOkay) {
                regStatus.append("<li>Password must be between 5 and 30 characters long</li>");
            }
            if (!passwordsMatch) {
                regStatus.append("<li>Passwords do not match</li>");
            }
            if (!typeIsValid) {
                regStatus.append("<li>Please select a user type</li>");
            }
            regStatus.append("</ol>");
        } else {
            User newUser = new User(name, surname, email, username, password, type, "");
            new UserDAO().registerUser(newUser);
            
            regStatus.append("<h5><strong>Registration Successful!</strong></h5>");
        }
    }

    request.getSession().setAttribute("reg-status", regStatus.toString());
    response.sendRedirect("sign-up.jsp");

} catch (Exception e) {
    e.getMessage();
}

%>