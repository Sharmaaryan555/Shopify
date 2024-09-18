<%@page import="com.mycompany.shopify.helper.Helper"%>
<%@page import="com.mycompany.shopify.entities.Category"%>
<%@page import="com.mycompany.shopify.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.shopify.entities.Product"%>
<%@page import="com.mycompany.shopify.dao.ProductDao"%>
<%@page import="com.mycompany.shopify.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Home Page</title>
        <script src="js/script.js"></script>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-2 mx-1">

                <%                    String cat = request.getParameter("category");

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat);
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();

                %>



                <!--show categories-->
                <div class="col-md-2">
                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
                            All Products
                        </a>

                        <% for (Category c : clist) {


                        %>


                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>                           
                        
                        <%
                            }

                        %>
                    </div>
                </div>
                <!--show products-->
                <div class="col-md-10">
                    <!--row-->
                    <div class="row mt-4">

                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--Traversing Products-->

                                <%                                    for (Product p : list) {


                                %>
                                <!--Product-card-->
                                <div class="card product">
                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 200px;max-width: 100%;width: auto;"class="card-img-top m-2" alt="..."/>

                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDesc())%>
                                        </p>

                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white " onclick='add_to_cart(<%= p.getpID()%>,"<%=p.getpName()%>",<%= p.getPriceAfterDiscount()%>)'>Add to Cart </button>
                                        <button class="btn btn-outline-success"> &#8377;<%= p.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label"> &#8377;<%= p.getpPrice()%> ,  <%= p.getpDiscount()%>% off</span> </button>
                                    </div>

                                </div>

                                <% }

                                    if (list.size() == 0) {
                                        out.print("<h3>No Item in this category</h3>");
                                    }


                                %>


                            </div>
                        </div>


                    </div>

                </div>
            </div>
        </div>
                                <%@include file="components/common_modals.jsp" %>
                                
    </body>
</html>

