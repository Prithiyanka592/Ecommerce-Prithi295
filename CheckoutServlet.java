package com.ecommerce.controller;

import com.ecommerce.model.CartItem;
import com.ecommerce.service.CheckoutService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private final CheckoutService checkoutService = new CheckoutService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        @SuppressWarnings("unchecked")
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        long orderId = checkoutService.checkout(
                (Long) session.getAttribute("userId"), cart);

        session.removeAttribute("cart");
        request.setAttribute("orderId", orderId);
        request.getRequestDispatcher("/checkout-success.jsp").forward(request, response);
    }
}
