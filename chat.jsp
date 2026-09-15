<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>AI Chatbot Support</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background: #f4f4f4; }
        .chat-box { background: white; padding: 20px; border-radius: 8px; max-width: 600px; }
        .bot { background: #e8f5e9; padding: 10px; margin: 10px 0; border-radius: 5px; }
        .user { background: #e3f2fd; padding: 10px; margin: 10px 0; border-radius: 5px; }
        input[type=text] { width: 70%; padding: 10px; }
        button { padding: 10px 20px; background: #333; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <h1>AI Chatbot Support</h1>
    <p>Ask about products, orders, delivery, payment, or returns.</p>

    <div class="chat-box">
        <% if (request.getAttribute("userMessage") != null) { %>
            <div class="user"><strong>You:</strong> <%= request.getAttribute("userMessage") %></div>
            <div class="bot"><strong>Bot:</strong> <%= request.getAttribute("botReply") %></div>
        <% } %>

        <form action="chat" method="post">
            <input type="text" name="message" placeholder="Type your question..." required>
            <button type="submit">Send</button>
        </form>
    </div>

    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
