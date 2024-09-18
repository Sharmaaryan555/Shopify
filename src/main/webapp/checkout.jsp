<%-- 
    Document   : checkout
    Created on : 16 Sept 2024, 12:23:51 pm
    Author     : sharm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <%@include file="components/common_css_js.jsp" %>
        <%@include file="components/navbar.jsp" %>
    </head>
    <body>
        
        <div class="container">
            
            <div class="row mt-5">
                
                <div class="col-md-6">
                    <!--card-->
                    <div class="card">
                        <h3 class="text-center my-3 mb-3">Your Selected Items</h3>
                    <div class="cart-body">
                        
                    </div>
                    </div>
                    
                </div>
                <div class="col-md-6">
                    <!--form details-->
                    <div class="card">
                        <h3 class="text-center my-3 mb-3">Your Details for Order</h3>
                        <form action="#!" class="ml-2 mr-2">
                            <div class="form-group">
                                <label for="name" class="pl-2">Your Name</label>
                                <input type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1" class="pl-2">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted pl-2">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group ">
                                <label for="exampleFormControlTextarea1" class="pl-2">Your Shipping Address</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Enter Your Address" rows="3"></textarea>
  </div>
                            <div class="container text-center mb-3">
                                <button class="btn btn-outline-success">Order Now</button>
                                <button class="btn btn-outline-primary">Continue Shopping</button>
                            </div>
                        </form>
                    </div>
                </div>
                    
</div>
                
            </div>
            
        </div>
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
