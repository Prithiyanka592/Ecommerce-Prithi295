package com.ecommerce.servlet;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.User;
import com.ecommerce.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {

    private final UserDAO userDAO = new UserDAO();
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User currentUser = (User) session.getAttribute("user");
        if (!"ADMIN".equals(currentUser.getRole())) {
            response.sendRedirect("dashboard.jsp");
            return;
        }

        // Basic admin data
        List<Product> products = productDAO.findAll("", "");
        request.setAttribute("products", products);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
