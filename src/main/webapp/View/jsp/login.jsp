<!DOCTYPE html>
<%@ page contentType="text/html" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #2a2e37;
            color: #fff;
        }
        .login-container {
            max-width: 400px;
            margin: 60px auto;
            background: #232733;
            padding: 30px 30px 20px 30px;
            border-radius: 10px;
            box-shadow: 0 2px 16px rgba(0,0,0,0.2);
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-container input, .login-container select, .login-container button {
            width: 100%;
            margin-bottom: 12px;
            padding: 8px;
            border-radius: 4px;
            border: none;
        }
        .login-container button {
            background: #3b82f6;
            color: #fff;
            font-weight: bold;
        }
        a {
            color: #3b82f6;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
        <input type="email" name="email" placeholder="Email" required><br>
        <input type="password" name="password" placeholder="Password" required><br>
        <button type="submit">Login</button>
        <p>Don't have an account? <a href="${pageContext.request.contextPath}/View/jsp/register.jsp">Register here</a></p>
    </form>
</div>
</body>
</html> 