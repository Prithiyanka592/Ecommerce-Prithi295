package com.ecommerce.controller;

import com.ecommerce.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {
    private final ProductService service = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("products",
                service.browse(request.getParameter("keyword"), request.getParameter("category")));
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}
