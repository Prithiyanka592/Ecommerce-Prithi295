package com.ecommerce.controller;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        User user = new User();
        user.setName(request.getParameter("name"));
        user.setEmail(request.getParameter("email"));
        user.setPassword(request.getParameter("password"));
        user.setRole(request.getParameter("role"));

        if (!"BUYER".equals(user.getRole()) && !"SELLER".equals(user.getRole())) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Only Buyer or Seller registration is allowed");
            return;
        }

        if (userDAO.register(user)) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_CONFLICT, "Email already registered");
        }
    }
}
