package com.ecommerce.controller;

import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;
import com.ecommerce.service.CartService;
import com.ecommerce.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private final ProductService productService = new ProductService();
    private final CartService cartService = new CartService();

    @SuppressWarnings("unchecked")
    private List<CartItem> cart(HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        if (cart == null) {
            cart = cartService.createEmptyCart();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession(true);
        long productId = Long.parseLong(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Product product = productService.getProduct(productId);

        if (product != null && quantity > 0 && quantity <= product.getStockQty()) {
            cartService.add(cart(session), product, quantity);
        }
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}
