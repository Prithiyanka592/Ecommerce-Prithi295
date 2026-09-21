package com.ecommerce.servlet;

import com.ecommerce.dao.PriceAlertDAO;
import com.ecommerce.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/price-alert")
public class PriceAlertServlet extends HttpServlet {

    private final PriceAlertDAO alertDAO = new PriceAlertDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        try {
            long productId = Long.parseLong(request.getParameter("productId"));
            BigDecimal targetPrice = new BigDecimal(request.getParameter("targetPrice"));

            alertDAO.createAlert(user.getId(), productId, targetPrice);
            response.sendRedirect("price-alerts.jsp?msg=Alert+created+successfully");
        } catch (Exception e) {
            response.sendRedirect("products.jsp?error=Invalid+input");
        }
    }
}
