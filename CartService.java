package com.ecommerce.service;

import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CartService {

    public void add(List<CartItem> cart, Product product, int quantity) {
        for (CartItem item : cart) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        cart.add(new CartItem(product, quantity));
    }

    public void update(List<CartItem> cart, long productId, int quantity) {
        Iterator<CartItem> it = cart.iterator();
        while (it.hasNext()) {
            CartItem item = it.next();
            if (item.getProduct().getId() == productId) {
                if (quantity <= 0) it.remove();
                else item.setQuantity(quantity);
                return;
            }
        }
    }

    public void remove(List<CartItem> cart, long productId) {
        update(cart, productId, 0);
    }

    public BigDecimal total(List<CartItem> cart) {
        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : cart) total = total.add(item.getSubtotal());
        return total;
    }

    public List<CartItem> createEmptyCart() {
        return new ArrayList<>();
    }
}
