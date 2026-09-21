package com.ecommerce.dao;

import com.ecommerce.model.PriceAlert;
import com.ecommerce.util.DatabaseManager;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PriceAlertDAO {

    public boolean createAlert(long userId, long productId, BigDecimal targetPrice) {
        String sql = "INSERT INTO price_alerts(user_id, product_id, target_price, notified) VALUES (?, ?, ?, false)";

        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, userId);
            ps.setLong(2, productId);
            ps.setBigDecimal(3, targetPrice);
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<PriceAlert> findByUserId(long userId) {
        List<PriceAlert> list = new ArrayList<>();
        String sql = "SELECT * FROM price_alerts WHERE user_id = ? ORDER BY created_at DESC";

        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setLong(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PriceAlert alert = new PriceAlert();
                    alert.setId(rs.getLong("id"));
                    alert.setUserId(rs.getLong("user_id"));
                    alert.setProductId(rs.getLong("product_id"));
                    alert.setTargetPrice(rs.getBigDecimal("target_price"));
                    alert.setNotified(rs.getBoolean("notified"));
                    alert.setCreatedAt(rs.getTimestamp("created_at"));
                    list.add(alert);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
