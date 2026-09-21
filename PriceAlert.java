package com.ecommerce.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class PriceAlert {
    private long id;
    private long userId;
    private long productId;
    private BigDecimal targetPrice;
    private boolean notified;
    private Timestamp createdAt;

    public long getId() { return id; }
    public void setId(long id) { this.id = id; }

    public long getUserId() { return userId; }
    public void setUserId(long userId) { this.userId = userId; }

    public long getProductId() { return productId; }
    public void setProductId(long productId) { this.productId = productId; }

    public BigDecimal getTargetPrice() { return targetPrice; }
    public void setTargetPrice(BigDecimal targetPrice) { this.targetPrice = targetPrice; }

    public boolean isNotified() { return notified; }
    public void setNotified(boolean notified) { this.notified = notified; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
}
