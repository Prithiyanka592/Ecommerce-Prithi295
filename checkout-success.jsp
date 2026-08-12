<!DOCTYPE html>
<html>
<head><title>Checkout Complete</title></head>
<body>
<h2>Order Confirmed</h2>
<p>Mock payment successful.</p>
<p>Your Order ID: <strong><%= request.getAttribute("orderId") %></strong></p>
<a href="products">Continue Shopping</a> |
<a href="logout">Exit / Logout</a>
</body>
</html>
