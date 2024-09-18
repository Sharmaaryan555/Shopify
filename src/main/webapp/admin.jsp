<%@page import="java.util.List"%>
<%@page import="com.mycompany.shopify.entities.Category"%>
<%@page import="com.mycompany.shopify.helper.FactoryProvider"%>
<%@page import="com.mycompany.shopify.dao.CategoryDao"%>
<%@page import="com.mycompany.shopify.entities.User"%>
<%

    User user = (User) session.getAttribute("current_user");

    if (user == null) {
        session.setAttribute("message", "You are not Logged In,Please Log In First!");
        response.sendRedirect("login.jsp");
        return;
    } else {

        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not Admin ! Do not Access this Page");
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
        <title>Admin Panel</title>

        <link rel="stylesheet" href="components/style.css"/>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid mt-5">
                <%@include file="components/message.jsp" %>
            </div>

            <!--first col-->
            <div class="row mt-3">

                <div class="col-md-4">
                    <!--first box-->
                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid "src="img/social.png" alt=""/>
                            </div>

                            <h1>2345</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>

                    </div>
                </div>
                <!--second col-->
                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid"src="img/list.png" alt=""/>
                            </div>
                            <h1>2345</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>

                    </div>
                </div>
                <!--third-col-->
                <div class="col-md-4">

                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid "src="img/product.png" alt=""/>
                            </div>
                            <h1>2345</h1>

                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>

                    </div>
                </div>
            </div>
            <!--second-row-->
            <div class="row mt-3">
                <!--second-row:first col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid "src="img/addmorecategory.png" alt=""/>
                            </div>
                            <p class="mt-2 text-muted">Click Here to Add New Categories</p>
                            <h1 class="text-uppercase text-muted">Add categories</h1>

                        </div>

                    </div>
                </div>
                <!--second-row second-col-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px" class="img-fluid "src="img/plus.png" alt=""/>
                            </div>
                            <p class="mt-2 text-muted" >Click Here to Add New Product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>

                        </div>

                    </div>
                </div>

            </div>



        </div>

        <!--add-catgory-modal-->
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Enter Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>      
                            </div>
                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" placeholder="Enter Category Description" name="catDescription" required></textarea>
                            </div> 

                            <div class="container">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--End-Modal-->

        <!--Product-modal-->
        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Enter Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <!--Product-title-->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of Product" name="pName" required/>
                            </div>
                            <!--Product-description-->
                            <div class="form-group">
                                <textarea style="height: 150px;"name="pDesc" class="form-control" placeholder="Enter the Product Description "></textarea>
                            </div>
                            <!--Product-Price-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter the Price of Product" name="pPrice" required/>
                            </div>
                            <!--Product-discount-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required/>
                            </div>
                            <!--Product-Quantity-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required/>
                            </div>

                            <!--Product-Category-->
                            <%
                                CategoryDao cdao =new CategoryDao(FactoryProvider.getFactory());
                                List <Category> list = cdao.getCategories();
                                %>
                            
                            <div class="form-group">
                                <select name="catId" class="form-control">
                                    
                                    <%
                                        for(Category c:list){
                                        %>
                                    
                                        <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    
                                    <% } %>
                                    
                                </select>
                            </div>
                            <!--Product-pic-->
                            <div class="form-group">
                                <label for="pPic">Select Picture of Product</label>
                                <br>
                                <input type="file" name="pPic" required/>
                            </div>
                            <!--submit-button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success"> Add Product</button> 
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>
                        </form>
                        <!--End of form-->
                    </div>
                </div>
            </div>
        </div>





        <!--End Product-Modal-->
    </body>
</html>
