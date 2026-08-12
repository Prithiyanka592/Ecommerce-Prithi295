package com.ecommerce.service;

import com.ecommerce.model.CartItem;
import com.ecommerce.util.DatabaseManager;

import java.math.BigDecimal;
import java.sql.*;
import java.util.List;

public class CheckoutService {

    public long checkout(long userId, List<CartItem> cart) {
        if (cart == null || cart.isEmpty()) {
            throw new IllegalArgumentException("Cart is empty");
        }

        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : cart) total = total.add(item.getSubtotal());

        try (Connection con = DatabaseManager.getConnection()) {
            con.setAutoCommit(false);

            long orderId;
            try (PreparedStatement order = con.prepareStatement(
                    "INSERT INTO orders(user_id,total,status) VALUES(?,?,?)",
                    Statement.RETURN_GENERATED_KEYS)) {

                order.setLong(1, userId);
                order.setBigDecimal(2, total);
                order.setString(3, "CONFIRMED - MOCK PAYMENT");
                order.executeUpdate();

                try (ResultSet keys = order.getGeneratedKeys()) {
                    keys.next();
                    orderId = keys.getLong(1);
                }
            }

            try (PreparedStatement item = con.prepareStatement(
                    "INSERT INTO order_items(order_id,product_id,quantity,unit_price) VALUES(?,?,?,?)")) {

                for (CartItem cartItem : cart) {
                    item.setLong(1, orderId);
                    item.setLong(2, cartItem.getProduct().getId());
                    item.setInt(3, cartItem.getQuantity());
                    item.setBigDecimal(4, cartItem.getProduct().getPrice());
                    item.addBatch();
                }
                item.executeBatch();
            }

            con.commit();
            return orderId;

        } catch (SQLException e) {
            throw new RuntimeException("Checkout failed", e);
        }
    }
}
