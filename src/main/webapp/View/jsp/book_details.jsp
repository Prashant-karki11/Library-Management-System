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
        }
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', sans-serif;
            background-color: var(--primary-bg);
            color: #2D3748;
        }
        .container {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 250px;
            background: linear-gradient(to bottom, #6B46C1, #A78BFA);
            height: 100vh;
            position: fixed;
            padding: 20px;
        }
        .sidebar-header {
            margin-bottom: 30px;
        }
        .logo {
            font-size: 1.5em;
            font-weight: bold;
            color: #FFFFFF;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .sidebar ul {
            list-style: none;
        }
        .sidebar a {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px;
            margin: 8px 0;
            color: #FFFFFF;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #A78BFA;
        }
        .content {
            margin-left: 250px;
            padding: 30px;
            width: calc(100% - 250px);
        }
        .book-details {
            background: var(--card-bg);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            display: flex;
            gap: 30px;
        }
        .book-cover {
            flex: 0 0 300px;
        }
        .book-cover img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .book-info {
            flex: 1;
        }
        .book-title {
            font-size: 2em;
            margin-bottom: 10px;
            color: #2D3748;
        }
        .book-author {
            font-size: 1.2em;
            color: var(--accent-blue);
            margin-bottom: 20px;
        }
        .book-meta {
            margin-bottom: 30px;
        }
        .meta-item {
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .meta-label {
            font-weight: 500;
            color: var(--text-gray);
            min-width: 120px;
        }
        .meta-value {
            color: #2D3748;
        }
        .book-description {
            margin-bottom: 30px;
            line-height: 1.6;
        }
        .action-buttons {
            display: flex;
            gap: 15px;
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .btn-primary {
            background-color: var(--accent-blue);
            color: white;
        }
        .btn-primary:hover {
            background-color: #805AD5;
        }
        .btn-secondary {
            background-color: #E2E8F0;
            color: #2D3748;
        }
        .btn-secondary:hover {
            background-color: #CBD5E0;
        }
        .availability {
            display: inline-block;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 500;
            margin-bottom: 20px;
        }
        .available {
            background-color: #C6F6D5;
            color: #2F855A;
        }
        .unavailable {
            background-color: #FED7D7;
            color: #C53030;
        }
    </style>
</head>
<body>
    <div class="container">
        <aside class="sidebar">
            <div class="sidebar-header">
                <div class="logo"><span>📚</span> Library.io</div>
            </div>
            <ul>
                <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
                <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                    <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/library_loans"><i class="fas fa-book-open"></i> Library Loans</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/recent_activities"><i class="fas fa-clock"></i> My Profile</a></li>
                <li><a href="${pageContext.request.contextPath}/books"><i class="fas fa-book"></i> Books</a></li>
                <li><a href="${pageContext.request.contextPath}/members"><i class="fas fa-users"></i> Members</a></li>
                <li><a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle"></i> About Us</a></li>
            </ul>
        </aside>

        <main class="content">
            <div class="book-details">
                <div class="book-cover">
                    <img src="${book.image}" alt="${book.title}">
                </div>
                <div class="book-info">
                    <h1 class="book-title">${book.title}</h1>
                    <div class="book-author">by ${book.author}</div>
                    
                    <!-- Success Modal -->
                    <c:if test="${not empty sessionScope.successMessage}">
                        <div id="successModal" class="modal" style="display:block; position:fixed; z-index:9999; left:0; top:0; width:100vw; height:100vh; background:rgba(0,0,0,0.2);">
                            <div class="modal-content" style="background:#f6ffed; color:#276749; margin:10% auto; padding:30px 40px; border-radius:10px; width:fit-content; box-shadow:0 4px 24px rgba(0,0,0,0.15); text-align:center; position:relative;">
                                <span onclick="document.getElementById('successModal').style.display='none'" style="position:absolute; top:10px; right:20px; font-size:1.5em; cursor:pointer; color:#276749;">&times;</span>
                                <i class="fas fa-check-circle" style="font-size:2em;"></i>
                                <div style="margin-top:10px; font-size:1.2em; font-weight:500;">${sessionScope.successMessage}</div>
                            </div>
                        </div>
                        <% session.removeAttribute("successMessage"); %>
                        <script>
                            setTimeout(function(){
                                var modal = document.getElementById('successModal');
                                if(modal) modal.style.display = 'none';
                            }, 3500);
                        </script>
                    </c:if>

                    <div class="availability ${bookAvailable ? 'available' : 'unavailable'}" style="font-size:0.95em; padding:6px 14px; margin-bottom:14px;">
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
                        <div class="error-message" style="margin-top: 20px; color: #E53E3E; padding: 10px 18px; background-color: #FED7D7; border-radius: 5px; font-size:0.98em; max-width:400px;">
                            <i class="fas fa-exclamation-circle"></i> Sorry, something went wrong. Please try again or contact support if the problem persists.
                        </div>
                    </c:if>
                </div>
            </div>
        </main>
    </div>
</body>
</html> 