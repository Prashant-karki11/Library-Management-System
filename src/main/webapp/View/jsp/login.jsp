<!DOCTYPE html>
<%@ page contentType="text/html" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Inter', 'Roboto', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #232946 0%, #6d83f2 100%);
            color: #232946;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            width: 100%;
            max-width: 480px;
            margin: 0 auto;
            background: #fff;
            padding: 56px 48px 40px 48px;
            border-radius: 2rem;
            box-shadow: 0 12px 48px 0 rgba(35, 41, 70, 0.18);
            transition: box-shadow 0.3s, transform 0.2s;
            position: relative;
            border: none;
        }
        .login-container:hover {
            box-shadow: 0 24px 64px 0 rgba(35, 41, 70, 0.22);
            transform: translateY(-6px) scale(1.03);
        }
        .auth-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 24px;
            font-size: 3.2rem;
            color: #6d83f2;
            font-weight: bold;
            letter-spacing: 2px;
            user-select: none;
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 28px;
            font-size: 2.4rem;
            font-weight: 800;
            letter-spacing: 1px;
            color: #232946;
        }
        .login-container input, .login-container select, .login-container button {
            width: 100%;
            margin-bottom: 18px;
            padding: 16px 14px;
            border-radius: 1rem;
            border: 1.5px solid #d1d5db;
            font-size: 1.15rem;
            transition: border-color 0.2s, box-shadow 0.2s;
            background: #f4f6fb;
            color: #232946;
        }
        .login-container input:focus, .login-container select:focus {
            outline: none;
            border: 2px solid #6d83f2;
            box-shadow: 0 0 0 2px #b8c1ec;
            background-color: #fff;
        }
        .login-container button {
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
            font-weight: 700;
            letter-spacing: 0.04em;
            box-shadow: 0 2px 12px 0 rgba(109, 131, 242, 0.13);
            border-radius: 1rem;
            border: none;
            transition: background 0.2s, box-shadow 0.2s, transform 0.15s;
        }
        .login-container button:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
            box-shadow: 0 6px 20px 0 rgba(35, 41, 70, 0.18);
            transform: scale(1.05);
        }
        a {
            color: #6d83f2;
            text-decoration: none;
            transition: color 0.2s;
        }
        a:hover {
            color: #232946;
            text-decoration: underline;
        }
        .login-container p {
            text-align: center;
            margin-top: 16px;
            color: #6d83f2;
            font-size: 1.08rem;
        }
        @media (max-width: 600px) {
            .login-container {
                padding: 32px 10px 24px 10px;
                max-width: 98vw;
            }
            .auth-logo {
                font-size: 2.2rem;
            }
            .login-container h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="auth-logo" style="flex-direction:column;align-items:center;">
        <img src="${pageContext.request.contextPath}/assets/logo.jpg" alt="Library Logo" style="height:80px; width:auto; display:block; margin:0 auto 8px auto;" />
        <div style="font-size:1.5rem;font-weight:700;color:#6d83f2;letter-spacing:1px;">Library.io</div>
    </div>
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