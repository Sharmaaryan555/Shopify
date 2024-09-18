<%@page import="com.mycompany.shopify.entities.User"%>
<%
    
    User user1 = (User) session.getAttribute("current_user");


    %>







<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Shopify</a>
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="index.jsp">Home</a>
    </li>
     <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Categories
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Link 1</a>
        <a class="dropdown-item" href="#">Link 2</a>
        <a class="dropdown-item" href="#">Link 3</a>
      </div>
    </li>
  </ul>
  <ul class="navbar-nav ml-auto">
      
         <li class="nav-item active">
             <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"> <i class="fa fa-cart-plus" style="font-size: 20px;">  </i><span class="ml-0 cart-items"> ( 0 )</span> </a></li> 
      
      <%
      
      if (user1 == null) {
      
      %>
         <li class="nav-item active">
             <a class="nav-link" href="login.jsp">Login</a></li>
         <li class="nav-item active">
             <a class="nav-link" href="register.jsp">Register</a></li>
  </ul>
     <%
          }
          else{
          %>
          
         <li class="nav-item active">
             <a class="nav-link" href="#!"><%= user1.getUserName() %></a>
         <li class="nav-item active">
      <a class="nav-link" href="LogoutServlet">Logout</a>
  </ul>   
          
          
          <%
          } 
      %>
      
      
         
    </div>

</nav>