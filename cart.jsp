<%@ page import="java.util.List" %>
<%@ page import="com.ecommerce.model.CartItem" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="com.ecommerce.service.CartService" %>
<!DOCTYPE html>
<html>
<head><title>Cart</title></head>
<body>
<h2>Shopping Cart</h2>
<%
List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
if (cart == null) cart = new CartService().createEmptyCart();
BigDecimal total = new CartService().total(cart);
%>
<table border="1" cellpadding="8">
<tr><th>Product</th><th>Quantity</th><th>Subtotal</th></tr>
<% for (CartItem item : cart) { %>
<tr>
<td><%= item.getProduct().getName() %></td>
<td><%= item.getQuantity() %></td>
<td>₹<%= item.getSubtotal() %></td>
</tr>
<% } %>
</table>
<h3>Total: ₹<%= total %></h3>
<form method="post" action="checkout">
<button type="submit">Checkout - Mock Payment</button>
</form>
<a href="products">Continue Shopping</a> |
<a href="logout">Exit / Logout</a>
</body>
</html>
