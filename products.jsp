<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products - Ecommerce</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f3f3f3; color: #111; }
        .header { background: #131921; color: white; padding: 12px 20px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: white; text-decoration: none; margin-left: 18px; font-size: 14px; }
        .logo { font-size: 22px; font-weight: bold; color: #febd69; }
        .search-bar { margin: 20px auto; max-width: 600px; display: flex; }
        .search-bar input { flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 4px 0 0 4px; }
        .search-bar button { padding: 10px 18px; background: #febd69; border: none; border-radius: 0 4px 4px 0; cursor: pointer; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .products-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 20px; }
        .product-card { background: white; border-radius: 8px; padding: 15px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); transition: 0.2s; }
        .product-card:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.15); transform: translateY(-3px); }
        .product-card img { width: 100%; height: 160px; object-fit: contain; margin-bottom: 10px; }
        .product-title { font-size: 15px; margin-bottom: 6px; height: 40px; overflow: hidden; }
        .product-price { font-size: 18px; font-weight: bold; color: #b12704; margin: 8px 0; }
        .btn { display: inline-block; background: #ffd814; border: none; padding: 8px 14px; border-radius: 20px; cursor: pointer; font-size: 13px; text-decoration: none; color: #111; }
        .btn:hover { background: #f7ca00; }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Ecommerce-Prithi</div>
        <div>
            <a href="dashboard.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="cart.jsp">Cart</a>
