<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${book.title} - Library Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-bg: #F5F7FA;
            --sidebar-bg: #6B46C1;
            --accent-blue: #6B46C1;
            --text-white: #FFFFFF;
            --text-gray: #666666;
            --card-bg: #FFFFFF;
            --returned-green: #48BB78;
            --overdue-red: #EF4444;
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        html, body {
            height: 100%; /* Ensure full height for sticky footer */
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #232946 0%, #6d83f2 100%);
            color: #232946;
            margin: 0;
            overflow-x: hidden; /* Prevent horizontal overflow */
        }
        .container {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensure container takes full viewport height */
            width: 100vw;
        }
        .content {
            flex: 1; /* Grow to push footer to bottom */
            padding: 40px 0 0 0;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            background: none;
        }
        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            margin-top: 0;
            background: none;
        }
        .main-card {
            background: #fff;
            border-radius: 1.7rem;
            box-shadow: 0 8px 32px 0 rgba(35, 41, 70, 0.13);
            padding: 38px;
            width: 100%;
            max-width: 100%; /* Ensure it fits within viewport */
            margin-bottom: 36px;
            margin-top: 18px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center; /* Center the book-details card */
        }
        .book-details {
            background: var(--card-bg);
            border-radius: 1.3rem;
            padding: 30px;
            box-shadow: 0 6px 32px 0 rgba(35, 41, 70, 0.13);
            display: flex;
            flex-direction: column; /* Stack book cover and info vertically */
            align-items: center; /* Center content inside */
            width: 500px; /* Fixed width for square-like appearance */
            min-height: 600px; /* Fixed height for square-like appearance */
            max-width: 90%; /* Responsive for smaller screens */
            box-sizing: border-box;
        }
        .book-cover {
            width: 200px; /* Smaller width for the image */
            margin-bottom: 20px; /* Space between image and info */
        }
        .book-cover img {
            width: 100%;
            height: 300px; /* Adjusted height to fit the square card */
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .book-info {
            flex: 1;
            max-width: 100%; /* Prevent overflow */
            text-align: center; /* Center text for better appearance */
        }
        .book-title {
            font-size: 2em; /* Slightly smaller font to fit the compact card */
            margin-bottom: 12px;
            color: #232946;
            font-weight: 800;
            letter-spacing: 1px;
        }
        .book-author {
            font-size: 1.08em; /* Slightly smaller font */
            color: var(--accent-blue);
            margin-bottom: 16px;
            font-weight: 700;
        }
        .book-meta {
            margin-bottom: 20px;
            line-height: 1.6;
        }
        .meta-item {
            margin-bottom: 10px;
            display: flex;
            justify-content: center; /* Center meta items */
            gap: 10px;
        }
        .meta-label {
            font-weight: 500;
            color: var(--text-gray);
            min-width: 100px;
        }
        .meta-value {
            color: #232946;
            font-size: 0.98em; /* Slightly smaller font */
        }
        .book-description {
            margin-bottom: 20px;
            line-height: 1.6;
            color: #444;
            font-size: 0.98em;
        }
        .action-buttons {
            display: flex;
            gap: 12px;
            justify-content: center; /* Center buttons */
        }
        .btn {
            padding: 10px 20px; /* Slightly smaller buttons */
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 700;
            font-size: 0.98em; /* Slightly smaller font */
            transition: background 0.2s, box-shadow 0.2s;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .btn-primary {
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
        }
        .btn-primary:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
            box-shadow: 0 4px 12px #6B46C166;
        }
        .btn-primary:disabled {
            background: #A0AEC0;
            cursor: not-allowed;
        }
        .btn-secondary {
            background: #E2E8F0;
            color: #2D3748;
        }
        .btn-secondary:hover {
            background: #CBD5E0;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .availability {
            display: inline-block;
            padding: 6px 12px; /* Slightly smaller padding */
            border-radius: 20px;
            font-weight: 500;
            margin-bottom: 12px;
            font-size: 0.98em; /* Slightly smaller font */
        }
        .available {
            background-color: #C6F6D5;
            color: #2F855A;
        }
        .unavailable {
            background-color: #FED7D7;
            color: #C53030;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0,0,0,0.4);
            align-items: center;
            justify-content: center;
        }
        .modal-content {
            background: #fff;
            padding: 30px;
            border-radius: 1.3rem;
            width: fit-content;
            max-width: 90vw; /* Prevent overflow on smaller screens */
            box-shadow: 0 8px 32px 0 rgba(35, 41, 70, 0.13);
            text-align: center;
            position: relative;
        }
        .modal-content i {
            font-size: 2em;
            color: #276749;
        }
        .modal-content div {
            margin-top: 10px;
            font-size: 1.18em;
            font-weight: 500;
            color: #276749;
        }
        .modal-content .close {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 1.5em;
            cursor: pointer;
            color: #276749;
        }
        .error-message {
            margin-top: 20px;
            color: #E53E3E;
            padding: 12px 20px;
            background-color: #FED7D7;
            border-radius: 6px;
            font-size: 0.98em; /* Slightly smaller font */
            max-width: 400px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .error-message i {
            margin-right: 8px;
        }
        footer {
            background: #232946;
            padding: 32px 0 18px 0;
            text-align: center;
            width: 100%;
            border-radius: 0 0 1.5rem 1.5rem;
            box-shadow: 0 -2px 12px 0 rgba(109, 131, 242, 0.07);
            color: #fff;
        }
        footer p {
            margin-bottom: 12px;
            color: #fff;
            font-size: 1.08em;
        }
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 18px;
            margin-top: 8px;
        }
        .social-icons a {
            color: #fff;
            font-size: 1.6em;
            transition: color 0.3s;
        }
        .social-icons a:hover {
            color: #A78BFA;
        }
        .navbar {
            width: 100vw;
            background: rgba(36, 32, 77, 0.98);
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 48px;
            height: 70px;
            box-shadow: 0 2px 16px 0 rgba(35, 41, 70, 0.10);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        .navbar-left {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        .navbar-logo {
            height: 48px;
            width: auto;
            border-radius: 10px;
            background: #fff;
            padding: 4px 8px;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .navbar-appname {
            font-size: 1.5rem;
            font-weight: 800;
            color: #fff;
            letter-spacing: 1px;
        }
        .navbar-links {
            display: flex;
            align-items: center;
            gap: 28px;
            margin-left: 32px;
        }
        .navbar-links a {
            color: #e0e7ff;
            font-size: 1.08em;
            font-weight: 500;
            text-decoration: none;
            padding: 8px 0;
            border-bottom: 2.5px solid transparent;
            transition: color 0.2s, border-bottom 0.2s;
        }
        .navbar-links a.active, .navbar-links a:hover {
            color: #fff;
            border-bottom: 2.5px solid #6B46C1;
        }
        .navbar-user {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .navbar-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #fff;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .navbar-userinfo {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .navbar-username {
            font-size: 1.08em;
            font-weight: 600;
            color: #fff;
        }
        .navbar-useremail {
            font-size: 0.98em;
            color: #e0e7ff;
        }
        .navbar-authbtns a {
            margin-left: 12px;
            padding: 8px 22px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 1.08em;
            text-decoration: none;
            border: none;
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
            transition: background 0.2s, color 0.2s;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .navbar-authbtns a:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
            color: #fff;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div class="navbar-left">
        <img src="${pageContext.request.contextPath}/assets/logo.jpg" alt="Library Logo" class="navbar-logo" />
        <span class="navbar-appname">Library.io</span>
        <nav class="navbar-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/library_loans">Library Loans</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/recent_activities">My Profile</a>
            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                <a href="${pageContext.request.contextPath}/books">Books</a>
                <a href="${pageContext.request.contextPath}/members">Members</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
            <a href="${pageContext.request.contextPath}/View/jsp/contact.jsp">Contact Us</a>
        </nav>
    </div>
    <div class="navbar-user">
        <c:choose>
            <c:when test="${sessionScope.user != null && not empty sessionScope.user.imageData}">
                <img src="${pageContext.request.contextPath}/user-image/${sessionScope.user.userID}" alt="Profile" class="navbar-avatar" />
            </c:when>
            <c:otherwise>
                <img src="${pageContext.request.contextPath}/assets/default-avatar.jpg" alt="Default" class="navbar-avatar" />
            </c:otherwise>
        </c:choose>
        <c:if test="${sessionScope.user != null}">
            <div class="navbar-userinfo">
                <span class="navbar-username">${sessionScope.user.name}</span>
                <span class="navbar-useremail">${sessionScope.user.email}</span>
            </div>
        </c:if>
        <c:if test="${sessionScope.user == null}">
            <div class="navbar-authbtns">
                <a href="${pageContext.request.contextPath}/View/jsp/login.jsp">Sign In</a>
                <a href="${pageContext.request.contextPath}/View/jsp/register.jsp" style="background:#EF4444;">Register</a>
            </div>
        </c:if>
    </div>
</div>

<div class="container">
    <main class="content">
        <div class="main-content">
            <div class="main-card">
                <div class="book-details">
                    <div class="book-cover">
                        <c:if test="${not empty book.imageData}">
                            <img src="${pageContext.request.contextPath}/book-image/${book.id}" alt="${book.title}">
                        </c:if>
                    </div>
                    <div class="book-info">
                        <h1 class="book-title">${book.title}</h1>
                        <div class="book-author">by ${book.author}</div>

                        <!-- Success Modal -->
                        <c:if test="${not empty sessionScope.successMessage}">
                            <div id="successModal" class="modal" style="display:block;">
                                <div class="modal-content">
                                    <span onclick="document.getElementById('successModal').style.display='none'" class="close">×</span>
                                    <i class="fas fa-check-circle"></i>
                                    <div>${sessionScope.successMessage}</div>
                                </div>
                            </div>
                            <% session.removeAttribute("successMessage"); %>
                        </c:if>

                        <div class="availability ${bookAvailable ? 'available' : 'unavailable'}">
                            <i class="fas ${bookAvailable ? 'fa-check-circle' : 'fa-times-circle'}"></i>
                            ${bookAvailable ? 'Available for Borrowing' : 'Currently Unavailable'}
                        </div>

                        <div class="book-meta">
                            <div class="meta-item">
                                <span class="meta-label">Publisher:</span>
                                <span class="meta-value">${book.publisher}</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-label">ISBN:</span>
                                <span class="meta-value">${book.isbn}</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-label">Publication Year:</span>
                                <span class="meta-value">${book.publicationYear}</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-label">Genre:</span>
                                <span class="meta-value">${book.genre}</span>
                            </div>
                            <div class="meta-item">
                                <span class="meta-label">Pages:</span>
                                <span class="meta-value">${book.pages}</span>
                            </div>
                        </div>

                        <div class="action-buttons">
                            <c:choose>
                                <c:when test="${bookAvailable}">
                                    <form action="${pageContext.request.contextPath}/borrow" method="POST" style="display: inline;">
                                        <input type="hidden" name="bookId" value="${book.id}">
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fas fa-book-reader"></i> Borrow This Book
                                        </button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-primary" disabled>
                                        <i class="fas fa-book-reader"></i> Currently Unavailable
                                    </button>
                                </c:otherwise>
                            </c:choose>
                            <button class="btn btn-secondary">
                                <i class="fas fa-bookmark"></i> Add to Wishlist
                            </button>
                        </div>

                        <c:if test="${not empty error}">
                            <div class="error-message">
                                <i class="fas fa-exclamation-circle"></i> Sorry, something went wrong. Please try again or contact support if the problem persists.
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>© 2025 Library IO. All rights reserved.</p>
        <div class="social-icons">
            <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin-in"></i></a>
            <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
        </div>
    </footer>
</div>
</body>
</html>