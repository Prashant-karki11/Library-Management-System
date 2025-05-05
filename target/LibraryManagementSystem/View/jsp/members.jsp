<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>Members - Library Management System</title>
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
      color: #2D3748;
    }
    .members-section {
      background-color: #FFFFFF;
      padding: 20px;
      border-radius: 10px;
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
      <div class="logo">📚 Library.io</div>
    </div>
    <ul>
      <li><a href="${pageContext.request.contextPath}/home"><i class="fas fa-home"></i> Home</a></li>
      <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
        <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/library_loans"><i class="fas fa-book-open"></i> Library Loans</a></li>
        <li><a href="${pageContext.request.contextPath}/books"><i class="fas fa-book"></i> Books</a></li>
        <li><a href="${pageContext.request.contextPath}/members" class="active"><i class="fas fa-users"></i> Members</a></li>
      </c:if>
      <li><a href="${pageContext.request.contextPath}/recent_activities"><i class="fas fa-clock"></i> My Profile</a></li>
      <li><a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle"></i> About Us</a></li>
    </ul>
  </aside>
  <main class="content">
    <h2>Members</h2>
    <div class="members-section">
      <table>
        <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Email</th>
          <th>Role</th>
          <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin'}">
            <th>Action</th>
          </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="member" items="${members}">
          <tr>
            <td>${member.userID}</td>
            <td>${member.name}</td>
            <td>${member.email}</td>
            <td>${member.role}</td>
            <c:if test="${sessionScope.user != null && sessionScope.user.role == 'admin' && sessionScope.user.userID != member.userID}">
              <td>
                <form action="${pageContext.request.contextPath}/members" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this user?');">
                  <input type="hidden" name="deleteUserId" value="${member.userID}" />
                  <button type="submit" style="background:#EF4444;color:#fff;border:none;border-radius:4px;padding:6px 12px;cursor:pointer;">Delete</button>
                </form>
              </td>
            </c:if>
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