package com.ecommerce.dao;

import com.ecommerce.model.Product;
import com.ecommerce.util.DatabaseManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {

    public List<Product> findAll(String keyword, String category) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT id,name,description,price,stock_qty,category,image_url " +
                "FROM products WHERE (? = '' OR LOWER(name) LIKE LOWER(?)) " +
                "AND (? = '' OR category = ?) ORDER BY id";

        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String k = keyword == null ? "" : keyword.trim();
            String c = category == null ? "" : category.trim();

            ps.setString(1, k);
            ps.setString(2, "%" + k + "%");
            ps.setString(3, c);
            ps.setString(4, c);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getLong("id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setStockQty(rs.getInt("stock_qty"));
                    p.setCategory(rs.getString("category"));
                    p.setImageUrl(rs.getString("image_url"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Could not load products", e);
        }
        return products;
    }

    public Product findById(long id) {
        String sql = "SELECT id,name,description,price,stock_qty,category,image_url FROM products WHERE id=?";
        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getLong("id"));
                    p.setName(rs.getString("name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setStockQty(rs.getInt("stock_qty"));
                    p.setCategory(rs.getString("category"));
                    p.setImageUrl(rs.getString("image_url"));
                    return p;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
