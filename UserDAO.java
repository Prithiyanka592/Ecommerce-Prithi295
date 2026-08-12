package com.ecommerce.dao;

import com.ecommerce.model.User;
import com.ecommerce.util.DatabaseManager;
import com.ecommerce.util.PasswordUtil;

import java.sql.*;

public class UserDAO {

    public boolean register(User user) {
        String sql = "INSERT INTO users(name,email,password_hash,role) VALUES(?,?,?,?)";

        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, PasswordUtil.hash(user.getPassword()));
            ps.setString(4, user.getRole());
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            return false;
        }
    }

    public User authenticate(String email, String password) {
        String sql = "SELECT id,name,email,password_hash,role FROM users WHERE email=?";

        try (Connection con = DatabaseManager.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next() && PasswordUtil.verify(password, rs.getString("password_hash"))) {
                    User user = new User();
                    user.setId(rs.getLong("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
