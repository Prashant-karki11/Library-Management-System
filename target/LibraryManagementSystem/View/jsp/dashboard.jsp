<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Library Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        button {
            cursor: pointer;
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
            width: 100%; /* Full width since sidebar is removed */
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
        h1 {
            font-size: 2.8em;
            margin-bottom: 18px;
            color: #232946;
            font-weight: 800;
            letter-spacing: 1px;
            text-align: center;
        }
        h2 {
            font-size: 2em;
            margin-bottom: 24px;
            color: #e0e7ff;
            font-weight: 800;
            text-align: left;
            width: 100%;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 32px;
            width: 100%;
            padding: 0 20px; /* Add padding to handle edge cases */
            box-sizing: border-box;
            margin-bottom: 32px;
        }
        .stat-card {
            background: #fff;
            border-radius: 1.3rem;
            box-shadow: 0 6px 32px 0 rgba(35, 41, 70, 0.13);
            padding: 20px;
            text-align: center;
            transition: transform 0.22s, box-shadow 0.22s;
            width: 100%;
            max-width: 100%; /* Ensure cards fit within container */
        }
        .stat-card:hover {
            transform: translateY(-8px) scale(1.035);
            box-shadow: 0 16px 40px 0 rgba(35, 41, 70, 0.18);
        }
        .stat-card h3 {
            font-size: 1.18em;
            margin-bottom: 10px;
            color: #232946;
            font-weight: 700;
        }
        .stat-card .value {
            font-size: 2em;
            font-weight: bold;
            color: #6B46C1;
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 32px;
            width: 100%;
            padding: 0 20px; /* Add padding to handle edge cases */
            box-sizing: border-box;
            margin-bottom: 32px;
        }
        .card {
            background: #fff;
            border-radius: 1.3rem;
            box-shadow: 0 6px 32px 0 rgba(35, 41, 70, 0.13);
            padding: 20px;
            transition: transform 0.22s, box-shadow 0.22s;
            width: 100%;
            max-width: 100%; /* Ensure cards fit within container */
        }
        .card:hover {
            transform: translateY(-8px) scale(1.035);
            box-shadow: 0 16px 40px 0 rgba(35, 41, 70, 0.18);
        }
        .card h2 {
            font-size: 1.18em;
            margin-bottom: 20px;
            color: #232946;
            font-weight: 700;
            text-align: center;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9em;
            font-weight: 500;
            display: inline-block;
        }
        .status-overdue {
            background-color: #EF4444;
            color: #FFFFFF;
        }
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
            width: 100%;
        }
        .action-button {
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
            padding: 10px;
            border-radius: 8px;
            text-align: center;
            font-size: 1.08em;
            font-weight: 700;
            transition: background 0.2s, box-shadow 0.2s;
            box-shadow: 0 2px 8px #6B46C133;
            width: 100%; /* Ensure buttons fit within container */
        }
        .action-button:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
            box-shadow: 0 4px 12px #6B46C166;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 1.3rem;
            overflow: hidden;
            box-shadow: 0 6px 32px 0 rgba(35, 41, 70, 0.13);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #E5E7EB;
        }
        th {
            background: #f4f6fb;
            color: #232946;
            font-weight: 500;
        }
        td {
            color: #232946;
        }
        tr:hover {
            background: #f4f6fb;
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
            min-width: 350px;
            max-width: 90vw;
            position: relative;
            box-shadow: 0 8px 32px 0 rgba(35, 41, 70, 0.13);
            width: 100%; /* Ensure modal fits within viewport */
        }
        .modal-content h2 {
            font-size: 1.18em;
            margin-bottom: 20px;
            color: #232946;
            font-weight: 700;
            text-align: center;
        }
        .modal-content form input, .modal-content form select {
            width: 100%;
            padding: 8px;
            border: 1px solid #E5E7EB;
            border-radius: 8px;
            font-size: 1.08em;
            color: #232946;
            margin-bottom: 15px;
        }
        .modal-content form label {
            font-size: 1.08em;
            color: #232946;
            font-weight: 500;
        }
        .modal-content button {
            padding: 8px 18px;
            border-radius: 8px;
            font-size: 1.08em;
            font-weight: 700;
            border: none;
            transition: background 0.2s, box-shadow 0.2s;
        }
        .modal-content button[type="submit"] {
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .modal-content button[type="submit"]:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
            box-shadow: 0 4px 12px #6B46C166;
        }
        .modal-content button[type="button"] {
            background: none;
            color: #232946;
        }
        .modal-content .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 1.5em;
            color: #232946;
        }
        .message {
            background: #48BB78;
            color: #fff;
            padding: 15px 25px;
            border-radius: 6px;
            margin-bottom: 20px;
            font-size: 1.1em;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            width: 100%;
            max-width: 100%; /* Ensure message fits within viewport */
            text-align: center;
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
                <a href="${pageContext.request.contextPath}/dashboard" class="active">Dashboard</a>
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

<div class="container">
    <div class="main-content">
        <div class="main-card">
            <h1>Dashboard</h1>
            <!-- Show add book/member messages -->
            <c:if test="${not empty sessionScope.addBookMessage}">
                <div id="addBookMsg" class="message">${sessionScope.addBookMessage}</div>
                <c:remove var="addBookMessage" scope="session"/>
            </c:if>
            <c:if test="${not empty sessionScope.addMemberMessage}">
                <div id="addMemberMsg" class="message" style="background:#6B46C1;">${sessionScope.addMemberMessage}</div>
                <c:remove var="addMemberMessage" scope="session"/>
            </c:if>

            <!-- Statistics Cards -->
            <div class="stats-grid">
                <div class="stat-card">
                    <h3>Total Books</h3>
                    <div class="value">${totalBooks}</div>
                </div>
                <div class="stat-card">
                    <h3>Active Loans</h3>
                    <div class="value">${activeLoans}</div>
                </div>
                <div class="stat-card">
                    <h3>Overdue Books</h3>
                    <div class="value">${overdueBooks}</div>
                </div>
                <div class="stat-card">
                    <h3>Total Members</h3>
                    <div class="value">${totalMembers}</div>
                </div>
            </div>

            <!-- Dashboard Grid -->
            <div class="dashboard-grid">
                <!-- Left Column -->
                <div>
                    <!-- Overdue Books -->
                    <div class="card">
                        <h2>Overdue Books</h2>
                        <table>
                            <thead>
                            <tr>
                                <th>Book Title</th>
                                <th>Borrower</th>
                                <th>Due Date</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="book" items="${overdueBooksList}">
                                <tr>
                                    <td>${book.title}</td>
                                    <td>${book.borrowerName}</td>
                                    <td>
                                        <span class="status-badge status-overdue">
                                            <fmt:formatDate value="${book.dueDate}" pattern="MMM dd, yyyy" />
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Popular Books -->
                    <div class="card">
                        <h2>Popular Books</h2>
                        <canvas id="popularBooksChart"></canvas>
                    </div>
                </div>

                <!-- Right Column -->
                <div>
                    <!-- Quick Actions -->
                    <div class="card">
                        <h2>Quick Actions</h2>
                        <div class="quick-actions">
                            <a href="${pageContext.request.contextPath}/books" class="action-button">
                                <i class="fas fa-plus"></i> Add New Book
                            </a>
                            <a href="${pageContext.request.contextPath}/members" class="action-button">
                                <i class="fas fa-user-plus"></i> Add New Member
                            </a>
                            <a href="${pageContext.request.contextPath}/library_loans" class="action-button">
                                <i class="fas fa-book-reader"></i> View All Loans
                            </a>
                            <a name="recent_activities" href="${pageContext.request.contextPath}/recent_activities" class="action-button">
                                <i class="fas fa-history"></i> View Activities
                            </a>
                        </div>
                    </div>

                    <!-- Recent Activities -->
                    <div class="card">
                        <h2>Recent Activities</h2>
                        <table>
                            <tbody>
                            <c:forEach var="activity" items="${recentActivities}">
                                <tr>
                                    <td>
                                        <i class="fas fa-circle" style="font-size: 0.5em; color: #6B46C1;"></i>
                                            ${activity.description}
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
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
</div>

<!-- Modals for Add Book and Add Member -->
<div id="addBookModal" class="modal">
    <div class="modal-content">
        <h2>Add New Book</h2>
        <form method="post" action="${pageContext.request.contextPath}/add_book" enctype="multipart/form-data">
            <div><label>Title:<br><input type="text" name="title" required></label></div>
            <div><label>Author:<br><input type="text" name="author" required></label></div>
            <div><label>Publisher:<br><input type="text" name="publisher"></label></div>
            <div><label>ISBN:<br><input type="text" name="isbn"></label></div>
            <div><label>Publication Year:<br><input type="number" name="publicationYear"></label></div>
            <div><label>Genre:<br><input type="text" name="genre"></label></div>
            <div><label>Pages:<br><input type="number" name="pages"></label></div>
            <div><label>Book Cover Image:<br><input type="file" name="image" accept="image/*"></label></div>
            <div style="text-align:right;">
                <button type="button" onclick="closeModal('addBookModal')">Cancel</button>
                <button type="submit">Add Book</button>
            </div>
        </form>
        <button onclick="closeModal('addBookModal')" class="close-btn">×</button>
    </div>
</div>

<div id="addMemberModal" class="modal">
    <div class="modal-content">
        <h2>Add New Member</h2>
        <form method="post" action="${pageContext.request.contextPath}/add_member" enctype="multipart/form-data">
            <div><label>Name:<br><input type="text" name="name" required></label></div>
            <div><label>Email:<br><input type="email" name="email" required></label></div>
            <div><label>Password:<br><input type="password" name="password" required></label></div>
            <div><label>Role:<br><select name="role"><option value="user">User</option><option value="admin">Admin</option></select></label></div>
            <div><label>Profile Image:<br><input type="file" name="image" accept="image/*"></label></div>
            <div style="text-align:right;">
                <button type="button" onclick="closeModal('addMemberModal')">Cancel</button>
                <button type="submit">Add Member</button>
            </div>
        </form>
        <button onclick="closeModal('addMemberModal')" class="close-btn">×</button>
    </div>
</div>

<script>
    // Popular Books Chart
    const ctx = document.getElementById('popularBooksChart').getContext('2d');
    const labels = [
        <c:forEach var="book" items="${popularBooks}">
        '${book.title}',
        </c:forEach>
    ];
    const data = [
        <c:forEach var="book" items="${popularBooks}">
        ${book.borrowCount},
        </c:forEach>
    ];
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels.length ? labels : ['No Data'],
            datasets: [{
                label: 'Times Borrowed',
                data: data.length ? data : [0],
                backgroundColor: '#6B46C1',
                borderRadius: 5
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 1
                    }
                }
            }
        }
    });

    // Modal logic
    function openModal(id) {
        document.getElementById(id).style.display = 'flex';
    }
    function closeModal(id) {
        document.getElementById(id).style.display = 'none';
    }
    // Attach to action buttons
    window.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.action-button').forEach(function(btn) {
            btn.addEventListener('click', function(e) {
                if (btn.textContent.includes('Add New Book')) {
                    e.preventDefault(); openModal('addBookModal');
                }
                if (btn.textContent.includes('Add New Member')) {
                    e.preventDefault(); openModal('addMemberModal');
                }
            });
        });
    });

    // Auto-hide messages
    setTimeout(function() {
        var msg1 = document.getElementById('addBookMsg');
        if(msg1) msg1.style.display = 'none';
        var msg2 = document.getElementById('addMemberMsg');
        if(msg2) msg2.style.display = 'none';
    }, 4000);
</script>

</body>
</html>