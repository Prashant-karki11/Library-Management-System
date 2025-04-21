<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Library Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-bg: #F5F7FA;
            --sidebar-bg: #6B46C1;
            --accent-blue: #6B46C1;
            --text-white: #FFFFFF;
            --text-gray: #666666;
            --overdue-red: #EF4444;
            --returned-green: #48BB78;
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
        }
        .sidebar {
            width: 250px;
            background: linear-gradient(to bottom, #6B46C1, #A78BFA);
            padding: 20px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
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
        .logo span {
            line-height: 1;
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
            transition: background-color 0.3s, color 0.3s;
        }
        .sidebar a i {
            color: #FFFFFF;
        }
        .sidebar a:hover, .sidebar a.active {
            background-color: #A78BFA;
            color: #FFFFFF;
        }
        .content {
            flex-grow: 1;
            padding: 30px;
            margin-left: 250px;
            color: #2D3748;
        }
        h2 {
            font-size: 2em;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .filter {
            font-size: 0.7em;
            background-color: #FFFFFF;
            padding: 5px 10px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            gap: 5px;
            color: #2D3748;
        }
        .stats {
            display: flex;
            gap: 20px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }
        .stat-card {
            background-color: #E6FFFA;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            flex: 1;
            min-width: 150px;
            color: #2D3748;
        }
        .stat-icon {
            font-size: 2em;
            color: var(--accent-blue);
            margin-bottom: 10px;
        }
        .stat-card h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
            color: #2D3748;
        }
        .stat-card p {
            font-size: 1.8em;
            font-weight: bold;
            color: #2D3748;
        }
        .main-content {
            display: flex;
            gap: 30px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }
        .chart-section {
            flex: 2;
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
        }
        .chart-placeholder {
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #F0F0F0;
            border-radius: 5px;
            color: #666666;
        }
        .borrowed-books {
            flex: 1;
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
        }
        .borrowed-books h3 {
            margin-bottom: 20px;
            color: #2D3748;
        }
        .count {
            background-color: var(--accent-blue);
            padding: 2px 8px;
            border-radius: 10px;
            font-size: 0.9em;
            color: #FFFFFF;
        }
        .book-card {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #FFFFFF;
            border-radius: 5px;
        }
        .book-card img {
            width: 80px;
            height: 120px;
            border-radius: 5px;
        }
        .book-info h4 {
            font-size: 1.1em;
            margin-bottom: 5px;
            color: #2D3748;
        }
        .book-info p {
            font-size: 0.9em;
            color: #666666;
            margin-bottom: 5px;
        }
        .status-overdue {
            background-color: var(--overdue-red);
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            display: inline-block;
        }
        .overdue-section {
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
        }
        .overdue-section h3 {
            margin-bottom: 20px;
            color: #2D3748;
        }
        .see-all {
            font-size: 0.9em;
            color: var(--accent-blue);
            transition: color 0.3s;
        }
        .see-all:hover {
            color: #A78BFA;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #FFFFFF;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #E5E7EB;
        }
        th {
            background-color: #F0F0F0;
            color: #2D3748;
            font-weight: 500;
        }
        td {
            color: #2D3748;
        }
        tr:hover {
            background-color: #F9FAFB;
        }
        footer {
            background-color: #FFFFFF;
            padding: 20px;
            text-align: center;
            border-top: 1px solid #E5E7EB;
        }
        footer p {
            margin-bottom: 10px;
            color: #666666;
        }
        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }
        .social-icons a {
            color: var(--accent-blue);
            font-size: 1.5em;
            transition: color 0.3s;
        }
        .social-icons a:hover {
            color: #A78BFA;
        }
    </style>
</head>
<body>

<div class="container">
    <aside class="sidebar">
        <div class="sidebar-header">
            <div class="logo"><span>📚 </span> Library.io</div>
        </div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="${pageContext.request.contextPath}/dashboard" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/library_loans"><i class="fas fa-book-open"></i> Library Loans</a></li>
            <li><a href="${pageContext.request.contextPath}/books"><i class="fas fa-book"></i> Books</a></li>
            <li><a href="${pageContext.request.contextPath}/members"><i class="fas fa-users"></i> Members</a></li>
        </ul>
    </aside>
    <main class="content">
        <h2>Dashboard <span class="filter">Weekly <i class="fas fa-chevron-down"></i></span></h2>
        <div class="stats">
            <div class="stat-card">
                <i class="fas fa-book stat-icon"></i>
                <h3>Borrowed</h3>
                <p>${borrowedCount}</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-exclamation-circle stat-icon"></i>
                <h3>Overdue</h3>
                <p>${overdueCount}</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-users stat-icon"></i>
                <h3>Visitors</h3>
                <p>${visitorCount}</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-user-plus stat-icon"></i>
                <h3>New Members</h3>
                <p>${newMemberCount}</p>
            </div>
        </div>
        <div class="main-content">
            <div class="chart-section">
                <h3>Visitor & Borrower</h3>
                <div class="chart-placeholder">
                    <p>[Chart Placeholder: Visitor & Borrower Data]</p>
                </div>
            </div>
            <div class="borrowed-books">
                <h3>Borrowed Book <span class="count">${borrowedCount}</span></h3>
                <div class="book-card">
                    <img src="https://via.placeholder.com/80x120" alt="Book Cover">
                    <div class="book-info">
                        <h4>Sea of Tranquility: A Novel</h4>
                        <p>Emily St. John Mandel</p>
                        <p>ID: BI-87932134</p>
                        <p class="status-overdue">2 days overdue</p>
                        <p>Borrowed: May 29, 2022</p>
                        <p>Return: Jun 10, 2022</p>
                    </div>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/80x120" alt="Book Cover">
                    <div class="book-info">
                        <h4>Ender's Game</h4>
                        <p>Orson Scott Card</p>
                        <p>ID: BI-8744332</p>
                        <p class="status-overdue">2 days overdue</p>
                        <p>Borrowed: May 29, 2022</p>
                        <p>Return: Jun 10, 2022</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="overdue-section">
            <h3>Overdue Book Loans <a href="recent_activities.jsp" class="see-all">See all</a></h3>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Member</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Overdue</th>
                    <th>Return Date</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="loan" items="${overdueLoans}">
                    <tr>
                        <td>${loan.id}</td>
                        <td>${loan.member}</td>
                        <td>${loan.title}</td>
                        <td>${loan.author}</td>
                        <td class="status-overdue">${loan.overdueDays} days</td>
                        <td>${loan.returnDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
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

</body>
</html>