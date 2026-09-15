package com.ecommerce.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/chat")
public class ChatServlet extends HttpServlet {

    private static final Map<String, String> FAQ = new HashMap<>();

    static {
        FAQ.put("hello", "Hello! Welcome to our e-commerce store. How can I help you?");
        FAQ.put("hi", "Hi there! Ask me about products, orders, or delivery.");
        FAQ.put("products", "You can browse all products from the Products page. We have Electronics, Clothing, Stationery and more.");
        FAQ.put("order", "You can view your order history from the Orders page after logging in.");
        FAQ.put("delivery", "We currently offer standard delivery within 3-5 business days.");
        FAQ.put("payment", "We support mock payment confirmation for demo purposes.");
        FAQ.put("return", "Returns are accepted within 7 days of delivery for unused products.");
        FAQ.put("admin", "Admin features are available only for the seeded admin account.");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");
        String reply = "Sorry, I didn't understand that. Try asking about products, orders, delivery, or payment.";

        if (message != null) {
            String lower = message.toLowerCase().trim();
            for (String key : FAQ.keySet()) {
                if (lower.contains(key)) {
                    reply = FAQ.get(key);
                    break;
                }
            }
        }

        request.setAttribute("userMessage", message);
        request.setAttribute("botReply", reply);
        request.getRequestDispatcher("chat.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("chat.jsp").forward(request, response);
    }
}
