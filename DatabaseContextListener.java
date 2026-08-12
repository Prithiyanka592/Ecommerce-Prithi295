package com.ecommerce.listener;

import com.ecommerce.util.DatabaseManager;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.SQLException;

@WebListener
public class DatabaseContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        try {
            DatabaseManager.initialize();
        } catch (SQLException e) {
            throw new RuntimeException("Database initialization failed", e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        DatabaseManager.close();
    }
}
