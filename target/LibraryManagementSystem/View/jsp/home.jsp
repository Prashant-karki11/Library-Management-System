<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Library Management System</title>
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
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #232946 0%, #6d83f2 100%);
            color: #232946;
            margin: 0;
            overflow-x: hidden; /* Prevent horizontal overflow */
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .container {
            display: flex;
            min-height: 100vh;
            width: 100vw; /* Full viewport width */
            flex-direction: column; /* Sidebar removed, so column layout */
        }
        .content {
            padding: 40px 0 0 0;
            min-height: 100vh;
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
        }
        .hero {
            text-align: center;
            padding: 64px 24px 48px 24px;
            background: rgba(255,255,255,0.97);
            border-radius: 1.5rem;
            margin: 36px 0 32px 0;
            width: 100%;
            max-width: 1100px;
            box-shadow: 0 8px 32px 0 rgba(35, 41, 70, 0.10);
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .hero h1 {
            font-size: 2.8em;
            margin-bottom: 18px;
            color: #232946;
            font-weight: 800;
            letter-spacing: 1px;
        }
        .hero p {
            font-size: 1.25em;
            color: #6d83f2;
            margin-bottom: 32px;
            font-weight: 500;
        }
        .search-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0;
            max-width: 420px;
            width: 100%;
            background: #f4f6fb;
            border-radius: 1.2rem;
            box-shadow: 0 2px 12px 0 rgba(109, 131, 242, 0.10);
            padding: 6px 8px;
        }
        .search-bar input {
            padding: 14px 16px;
            width: 100%;
            border: none;
            border-radius: 1rem 0 0 1rem;
            font-size: 1.1em;
            color: #232946;
            background: transparent;
            outline: none;
            flex: 1; /* Ensure input takes available space */
        }
        .search-bar input::placeholder {
            color: #6d83f2;
            opacity: 0.8;
        }
        .search-bar button {
            padding: 0 28px;
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
            border: none;
            border-radius: 0 1rem 1rem 0;
            font-size: 1.1em;
            font-weight: 700;
            cursor: pointer;
            transition: background 0.2s, box-shadow 0.2s;
            box-shadow: 0 2px 8px 0 rgba(109, 131, 242, 0.10);
            height: 48px;
        }
        .search-bar button:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
        }
        .books-section {
            background: none;
            margin: 0;
            width: 100%;
            max-width: 100%; /* Ensure it fits within viewport */
            margin-top: 18px;
        }
        .books-section h2 {
            font-size: 2em;
            margin-bottom: 24px;
            color: #e0e7ff;
            font-weight: 800;
            text-align: left;
            width: 100%;
        }
        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 32px;
            width: 100%;
            padding: 0 20px; /* Add padding to handle edge cases */
            box-sizing: border-box;
        }
        .book-card {
            background: #fff;
            border-radius: 1.3rem;
            box-shadow: 0 6px 32px 0 rgba(35, 41, 70, 0.13);
            transition: transform 0.22s, box-shadow 0.22s;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 340px;
            position: relative;
            overflow: hidden;
            padding: 0 0 18px 0;
        }
        .book-card:hover {
            transform: translateY(-8px) scale(1.035);
            box-shadow: 0 16px 40px 0 rgba(35, 41, 70, 0.18);
        }
        .book-card .book-genre-badge {
            position: absolute;
            top: 0;
            left: 0;
            background: linear-gradient(90deg, #6B46C1 0%, #A78BFA 100%);
            color: #fff;
            font-size: 0.98em;
            font-weight: 600;
            padding: 7px 22px 7px 18px;
            border-radius: 0 0 1.2rem 0;
            letter-spacing: 0.5px;
            box-shadow: 0 2px 8px #6B46C133;
            z-index: 2;
        }
        .book-card img {
            width: 100%;
            max-width: 170px;
            height: 180px;
            object-fit: cover;
            border-radius: 0.9rem;
            margin: 32px 0 18px 0;
            box-shadow: 0 2px 12px #6B46C133;
            border: 3px solid #f4f6fb;
            background: #f4f6fb;
        }
        .book-card h3 {
            font-size: 1.18em;
            margin-bottom: 8px;
            color: #232946;
            font-weight: 700;
            text-align: center;
            margin-top: 0;
        }
        .book-card p {
            font-size: 1em;
            color: #444;
            margin-bottom: 6px;
            text-align: center;
            margin-top: 0;
        }
        .status-available {
            background-color: var(--returned-green);
            color: #FFFFFF;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .status-loaned {
            background-color: var(--overdue-red);
            color: #FFFFFF;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .see-more {
            display: block;
            text-align: center;
            padding: 8px 0;
            background-color: var(--accent-blue);
            color: #FFFFFF;
            border-radius: 5px;
            font-size: 0.9em;
            margin-top: 10px;
            transition: background-color 0.3s;
        }
        .see-more:hover {
            background-color: #A78BFA;
        }
        footer {
            background: #232946;
            padding: 32px 0 18px 0;
            text-align: center;
            border-top: none;
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
            <a href="${pageContext.request.contextPath}/home" class="active">Home</a>
            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                <a href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/library_loans">Library Loans</a>
                <a href="${pageContext.request.contextPath}/books">Books</a>
                <a href="${pageContext.request.contextPath}/members">Members</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/recent_activities">My Profile</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
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

<div class="main-content">
    <section class="hero">
        <h1>Welcome to Library.io</h1>
        <p>Your one-stop digital library for managing books, members, and lending history.</p>
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/search" method="GET" style="display: flex; width: 100%; gap: 10px;">
                <input type="text" name="query" placeholder="Search for books..." value="${searchQuery}" style="flex: 1;">
                <button type="submit"><i class="fas fa-search"></i> Search</button>
            </form>
        </div>
    </section>
    <section class="books-section">
        <h2>
            <c:choose>
                <c:when test="${not empty searchQuery}">
                    Search Results for "${searchQuery}"
                </c:when>
                <c:otherwise>
                    Explore Our Collection
                </c:otherwise>
            </c:choose>
        </h2>
        <c:choose>
            <c:when test="${empty books}">
                <div style="text-align: center; padding: 40px;">
                    <i class="fas fa-search" style="font-size: 48px; color: #CBD5E0; margin-bottom: 20px;"></i>
                    <h3 style="color: #4A5568;">No books found</h3>
                    <p style="color: #718096;">Try different search terms or browse our collection</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="book-grid">
                    <c:forEach var="book" items="${books}">
                        <div class="book-card">
                            <div class="book-genre-badge">${book.genre}</div>
                            <a href="${pageContext.request.contextPath}/book-details?id=${book.id}" style="text-decoration: none; color: inherit;">
                                <c:if test="${not empty book.imageData}">
                                    <img src="${pageContext.request.contextPath}/book-image/${book.id}" alt="Book Cover" />
                                </c:if>
                                <h3>${book.title}</h3>
                                <p><strong>Author:</strong> ${book.author}</p>
                                <p><strong>Year:</strong> ${book.publicationYear}</p>
                                <p><strong>Pages:</strong> ${book.pages}</p>
                            </a>
                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </section>
    <footer>
        <p>© 2025 Library Management System. All rights reserved.</p>
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