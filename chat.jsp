<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>AI Chat Support</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: Arial, sans-serif; background: #f3f3f3; }
        .header { background: #131921; color: white; padding: 12px 20px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: white; text-decoration: none; margin-left: 18px; }
        .logo { font-size: 22px; font-weight: bold; color: #febd69; }
        .chat-container { max-width: 600px; margin: 30px auto; background: white; border-radius: 10px; box-shadow: 0 4px 15px rgba(0,0,0,0.1); overflow: hidden; }
        .chat-header { background: #232f3e; color: white; padding: 15px 20px; font-weight: bold; }
        .chat-body { padding: 20px; min-height: 300px; }
        .message { margin-bottom: 15px; padding: 12px 16px; border-radius: 12px; max-width: 80%; }
        .user { background: #e3f2fd; margin-left: auto; text-align: right; }
        .bot { background: #f1f1f1; }
        .chat-input { display: flex; border-top: 1px solid #eee; }
        .chat-input input { flex: 1; padding: 15px; border: none; outline: none; }
        .chat-input button { padding: 15px 25px; background: #febd69; border: none; cursor: pointer; font-weight: bold; }
        .chat-input button:hover { background: #f3a847; }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Ecommerce-Prithi</div>
        <div>
            <a href="dashboard.jsp">Home</a>
            <a href="products.jsp">Products</a>
            <a href="logout">Logout</a>
        </div>
    </div>

    <div class="chat-container">
        <div class="chat-header">AI Chat Support</div>
        <div class="chat-body">
            <% if (request.getAttribute("userMessage") != null) { %>
                <div class="message user">
                    <strong>You:</strong> <%= request.getAttribute("userMessage") %>
                </div>
                <div class="message bot">
                    <strong>Bot:</strong> <%= request.getAttribute("botReply") %>
                </div>
            <% } else { %>
                <div class="message bot">
                    <strong>Bot:</strong> Hello! Ask me about products, orders, delivery, payment or returns.
                </div>
            <% } %>
        </div>
        <form class="chat-input" action="chat" method="post">
            <input type="text" name="message" placeholder="Type your question..." required>
            <button type="submit">Send</button>
        </form>
    </div>
</body>
</html>
