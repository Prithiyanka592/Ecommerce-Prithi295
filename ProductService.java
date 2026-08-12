package com.ecommerce.service;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.Product;

import java.util.List;

public class ProductService {
    private final ProductDAO productDAO = new ProductDAO();

    public List<Product> browse(String keyword, String category) {
        return productDAO.findAll(keyword, category);
    }

    public Product getProduct(long id) {
        return productDAO.findById(id);
    }
}
