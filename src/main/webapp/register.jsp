<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
                <link rel="stylesheet" href="components/style.css"/>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        
        <div class="container-fluid">
             <div class="row mt-3">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    
                    <%@include file="components/message.jsp" %>
                    
                    <div class="card-body px-5">

                        <div class="container text-center">
                            <img src="img/signup.jpg" style="max-width: 110px" class="img-fluid"/>
                        </div>
                        
                        <h3 class="text-center my-1">Sign Up Here :)</h3>
                        <form action="RegisterServlet" method="post">
                     <div class="form-group">
                        <label for="name">User Name</label>
                        <input type="text" name="user_name" class="form-control" placeholder="Enter Name" id="name">
                        </div>
                    <div class="form-group">
                    <label for="email">User E-mail</label>
                    <input type="email" name="user_email" class="form-control" placeholder="Enter E-mail" id="email">
                    </div>
                    <div class="form-group">
                    <label for="password">User Password</label>
                    <input type="password" name="user_password" class="form-control" placeholder="Enter Password" id="password">
                    </div>
                    <div class="form-group">
                    <label for="phone">User Phone</label>
                    <input type="number" name="user_phone" class="form-control" placeholder="Enter Phone Number" id="phone">
                    </div>
                    <div class="form-group">
                    <label for="email">User Address</label>
                    <textarea style="height: 100px;" name="user_address" class="form-control" placeholder="Enter your Address"></textarea>
                   </div>
                    
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Register</button>
                        <button class="btn btn-outline-warning">Reset</button>
                    </div>
                </form>
                    </div>
                </div>
            </div>
        </div>
       
        </div>
    </body>
</html>
