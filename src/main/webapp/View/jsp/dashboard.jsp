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
            --success-green: #48BB78;
            --warning-yellow: #ECC94B;
            --danger-red: #EF4444;
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
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        .stat-card {
            background: var(--card-bg);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .stat-card h3 {
            color: var(--text-gray);
            font-size: 0.9em;
            margin-bottom: 10px;
        }
        .stat-card .value {
            font-size: 2em;
            font-weight: bold;
            color: var(--accent-blue);
        }
        .dashboard-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
        }
        .card {
            background: var(--card-bg);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        .card h2 {
            font-size: 1.2em;
            margin-bottom: 20px;
            color: var(--text-gray);
        }
        .status-badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 0.8em;
            font-weight: 500;
        }
        .status-overdue {
            background-color: var(--danger-red);
            color: white;
        }
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 10px;
        }
        .action-button {
            background: var(--accent-blue);
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .action-button:hover {
            background: #A78BFA;
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
            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
                <li><a href="${pageContext.request.contextPath}/dashboard" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/library_loans"><i class="fas fa-book-open"></i> Library Loans</a></li>
                <li><a href="${pageContext.request.contextPath}/books"><i class="fas fa-book"></i> Books</a></li>
                <li><a href="${pageContext.request.contextPath}/members"><i class="fas fa-users"></i> Members</a></li>
            </c:if>
            <li><a href="${pageContext.request.contextPath}/recent_activities"><i class="fas fa-clock"></i> My Profile</a></li>
            <li><a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle"></i> About Us</a></li>
        </ul>
    </aside>
    <main class="content">
        <h1 style="margin-bottom: 30px;">Dashboard</h1>
        
        <!-- Show add book/member messages -->
        <c:if test="${not empty sessionScope.addBookMessage}">
          <div id="addBookMsg" style="background:#48BB78;color:#fff;padding:15px 25px;border-radius:6px;margin-bottom:20px;font-size:1.1em;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
            ${sessionScope.addBookMessage}
          </div>
          <c:remove var="addBookMessage" scope="session"/>
        </c:if>
        <c:if test="${not empty sessionScope.addMemberMessage}">
          <div id="addMemberMsg" style="background:#3182CE;color:#fff;padding:15px 25px;border-radius:6px;margin-bottom:20px;font-size:1.1em;box-shadow:0 2px 8px rgba(0,0,0,0.08);">
            ${sessionScope.addMemberMessage}
          </div>
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
                        <a href="${pageContext.request.contextPath}/recent_activities" class="action-button">
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
                                        <i class="fas fa-circle" style="font-size: 0.5em; color: var(--accent-blue);"></i>
                                        ${activity.description}
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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

<!-- Modals for Add Book and Add Member -->
<div id="addBookModal" class="modal" style="display:none; position:fixed; z-index:1000; left:0; top:0; width:100vw; height:100vh; background:rgba(0,0,0,0.4); align-items:center; justify-content:center;">
  <div style="background:#fff; padding:30px; border-radius:10px; min-width:350px; max-width:90vw; position:relative;">
    <h2 style="margin-bottom:20px;">Add New Book</h2>
    <form method="post" action="${pageContext.request.contextPath}/add_book">
      <div style="margin-bottom:15px;"><label>Title:<br><input type="text" name="title" required style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Author:<br><input type="text" name="author" required style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Publisher:<br><input type="text" name="publisher" style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>ISBN:<br><input type="text" name="isbn" style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Publication Year:<br><input type="number" name="publicationYear" style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Genre:<br><input type="text" name="genre" style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Pages:<br><input type="number" name="pages" style="width:100%;padding:8px;"></label></div>
      <div style="text-align:right;">
        <button type="button" onclick="closeModal('addBookModal')" style="margin-right:10px;">Cancel</button>
        <button type="submit" style="background:var(--accent-blue);color:#fff;padding:8px 18px;border:none;border-radius:5px;">Add Book</button>
      </div>
    </form>
    <button onclick="closeModal('addBookModal')" style="position:absolute;top:10px;right:10px;background:none;border:none;font-size:1.5em;">&times;</button>
  </div>
</div>

<div id="addMemberModal" class="modal" style="display:none; position:fixed; z-index:1000; left:0; top:0; width:100vw; height:100vh; background:rgba(0,0,0,0.4); align-items:center; justify-content:center;">
  <div style="background:#fff; padding:30px; border-radius:10px; min-width:350px; max-width:90vw; position:relative;">
    <h2 style="margin-bottom:20px;">Add New Member</h2>
    <form method="post" action="${pageContext.request.contextPath}/add_member">
      <div style="margin-bottom:15px;"><label>Name:<br><input type="text" name="name" required style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Email:<br><input type="email" name="email" required style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Password:<br><input type="password" name="password" required style="width:100%;padding:8px;"></label></div>
      <div style="margin-bottom:15px;"><label>Role:<br><select name="role" style="width:100%;padding:8px;"><option value="user">User</option><option value="admin">Admin</option></select></label></div>
      <div style="text-align:right;">
        <button type="button" onclick="closeModal('addMemberModal')" style="margin-right:10px;">Cancel</button>
        <button type="submit" style="background:var(--accent-blue);color:#fff;padding:8px 18px;border:none;border-radius:5px;">Add Member</button>
      </div>
    </form>
    <button onclick="closeModal('addMemberModal')" style="position:absolute;top:10px;right:10px;background:none;border:none;font-size:1.5em;">&times;</button>
  </div>
</div>

<script>
    // Popular Books Chart
    const ctx = document.getElementById('popularBooksChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [
                <c:forEach var="book" items="${popularBooks}">
                    '${book.title}',
                </c:forEach>
            ],
            datasets: [{
                label: 'Times Borrowed',
                data: [
                    <c:forEach var="book" items="${popularBooks}">
                        ${book.borrowCount},
                    </c:forEach>
                ],
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