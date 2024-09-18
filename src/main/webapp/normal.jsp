<%@page import="com.mycompany.shopify.entities.User"%>
<%
    
   User user = (User) session.getAttribute("current_user");
    
if (user == null) {
        session.setAttribute("message", "You are not Logged In,Please Log In First!");
        response.sendRedirect("login.jsp");
        return;
    }
    else{
    
    if (user.getUserType().equals("admin")) {
            session.setAttribute("message", "You are Admin ! Do not Access Normal User's Page");
        response.sendRedirect("login.jsp");
        return;
        }
    }




    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Normal User</h1>
    </body>
</html>
