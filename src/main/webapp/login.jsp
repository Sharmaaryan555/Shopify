<%-- 
    Document   : login
    Created on : 26 Jul 2024, 12:55:25 pm
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Shopify</title>
        <link rel="stylesheet" href="components/style.css">
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    
                    <div class="card mt-3">
                        
                            <div class="container text-center mt-8">
                                
                                <div class="container mt-3">
                                    <%@include file="components/message.jsp" %>
                                </div>
                                
                                <img src="img/login.jpg" style="max-width: 50%" class="img-fluid"/>
                        
                        <h3 class="text-center my-1">Log In Here :)</h3>
                            
                        </div>
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="email">Email address:</label>
                                  <input type="email" class="form-control" id="email" name="email">
                                </div>
                                <div class="form-group">
                                  <label for="pwd">Password:</label>
                                  <input type="password" class="form-control" id="pwd" name="password">
                                </div>
                                <div class="container text-center">
                                <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
                                </div> 
                                <a href="register.jsp" class="text-center d-block mt-2">if not registered ? click here</a>
                            </form>
                        </div> 
                        
                    </div>
                    
                    
                    
                    
                    
                </div>
            </div>
        </div>
        
        
        
        
    </body>
</html>
