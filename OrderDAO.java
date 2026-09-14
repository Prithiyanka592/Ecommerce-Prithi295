package com.ecommerce.dao;

import com.ecommerce.model.Order;
import com.ecommerce.util.DatabaseManager;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {

    public long createOrder(long userId, BigDecimal totalAmount) {
        String sql = "INSERT INTO orders(user_id, total_amount, status) VALUES (?, ?, 'PENDING')";

        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setLong(1, userId);
            ps.setBigDecimal(2, totalAmount);
            ps.executeUpdate();

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getLong(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public List<Order> findByUserId(long userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT id, user_id, total_amount, status, created_at FROM orders WHERE user_id = ? ORDER BY created_at DESC";

        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, userId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getLong("id"));
                    order.setUserId(rs.getLong("user_id"));
                    order.setTotalAmount(rs.getBigDecimal("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setCreatedAt(rs.getTimestamp("created_at"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
