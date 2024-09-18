package com.mycompany.shopify.servlets;

import com.mycompany.shopify.dao.CategoryDao;
import com.mycompany.shopify.dao.ProductDao;
import com.mycompany.shopify.entities.Category;
import com.mycompany.shopify.entities.Product;
import com.mycompany.shopify.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory")){
                
                String title = request.getParameter("catTitle");
            String description = request.getParameter("catDescription");
            
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(description);
                
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
//                out.println("Category Saved!");
                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Category Added Successfully and Category Id is: "+catId);
                
                response.sendRedirect("admin.jsp");
                return;
                
                
                
            }
            else if(op.trim().equals("addproduct")){
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                String catIdStr = request.getParameter("catId");
int catId = 0; // Default value

try {
    if (catIdStr != null && !catIdStr.isEmpty()) {
        catId = Integer.parseInt(catIdStr);
    } else {
        // Handle the case where catId is not provided or is empty
        throw new IllegalArgumentException("Category ID is missing or invalid.");
    }
} catch (NumberFormatException e) {
    // Handle the exception, log error, or set a default value
    System.err.println("Invalid category ID: " + catIdStr);
    // Optionally, set a default value or redirect to an error page
    catId = 0; // Example default value, may vary depending on your logic
}
                Part part = request.getPart("pPic");
                
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
//                get category by id
                CategoryDao  cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                
                p.setCategory(category);
                
                //product save 
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                out.println("Product Saved Successfully");
                 HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Product is Added Successfully... ");
                
                response.sendRedirect("admin.jsp");
                return;
                
            }
            
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
