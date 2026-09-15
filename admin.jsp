<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.Product" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Panel</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f3f3f3; }
        .header { background: #131921; color: white; padding: 12px 20px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: white; text-decoration: none; margin-left: 18px; }
        .logo { font-size: 22px; font-weight: bold; color: #febd69; }
        .container { max-width: 1100px; margin: 30px auto; background: white; padding: 25px; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
        h1 { margin-bottom: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f8f8; }
        .logout { margin-top: 25px; }
        .logout a { color: #0066c0; text-decoration: none; }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Ecommerce-Prithi | Admin</div>
        <div>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h1>Admin Panel</h1>
        <p style="color:#565959;">View and moderate all products</p>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Category</th>
            </tr>
            <%
                List<Product> products = (List<Product>) request.getAttribute("products");
                if (products != null) {
                    for (Product p : products) {
            %>
            <tr>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %></td>
                <td>₹<%= p.getPrice() %></td>
                <td><%= p.getStockQty() %></td>
                <td><%= p.getCategory() %></td>
            </tr>
            <%
                    }
                }
            %>
        </table>

        <div class="logout">
            <a href="logout">Logout from Admin</a>
        </div>
    </div>
</body>
</html>
