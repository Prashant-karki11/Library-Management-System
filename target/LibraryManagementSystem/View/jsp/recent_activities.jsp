<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <title>My Profile - Library Management System</title>
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
      font-family: 'Roboto', sans-serif;
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
    .overdue-section {
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
    .status-overdue {
      background-color: var(--overdue-red);
      color: white;
      padding: 5px 10px;
      border-radius: 5px;
      display: inline-block;
    }
    .status-returned {
      background-color: var(--returned-green);
      color: white;
      padding: 5px 10px;
      border-radius: 5px;
      display: inline-block;
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
        <li><a href="${pageContext.request.contextPath}/members"><i class="fas fa-users"></i> Members</a></li>
      </c:if>
      <li><a href="${pageContext.request.contextPath}/recent_activities" class="active"><i class="fas fa-clock"></i> My Profile</a></li>
      <li><a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle"></i> About Us</a></li>
    </ul>
  </aside>
  <main class="content">
    <div style="display:flex; align-items:center; gap:24px; margin-bottom:28px;">
      <div style="background:#fff; border-radius:10px; box-shadow:0 2px 8px rgba(107,70,193,0.07); padding:22px 32px; display:flex; align-items:center; gap:18px; min-width:320px;">
        <div style="background:#6B46C1; color:#fff; border-radius:50%; width:60px; height:60px; display:flex; align-items:center; justify-content:center; font-size:2em; font-weight:700;">
          <i class="fas fa-user"></i>
        </div>
        <div>
          <div style="font-size:1.2em; font-weight:600; color:#2D3748;">${sessionScope.user.name}</div>
          <div style="color:#6B46C1; font-size:1em;">${sessionScope.user.email}</div>
          <div style="color:#888; font-size:0.98em; margin-top:2px;">Role: <span style="color:#805AD5; font-weight:500;">${sessionScope.user.role}</span></div>
          <form action="${pageContext.request.contextPath}/logout" method="post" style="margin-top:14px;">
            <button type="submit" style="background:#EF4444; color:#fff; border:none; border-radius:5px; padding:8px 22px; font-size:1em; font-weight:500; cursor:pointer;">
              <i class="fas fa-sign-out-alt"></i> Logout
            </button>
          </form>
        </div>
      </div>
    </div>
    <c:if test="${not empty sessionScope.successMessage}">
      <div style="background:#C6F6D5; color:#276749; padding:14px 20px; border-radius:7px; margin-bottom:18px; font-size:1.08em; display:flex; align-items:center; gap:10px;">
        <i class="fas fa-check-circle"></i> ${sessionScope.successMessage}
      </div>
      <% session.removeAttribute("successMessage"); %>
    </c:if>
    <c:if test="${not empty sessionScope.error}">
      <div style="background:#FED7D7; color:#C53030; padding:14px 20px; border-radius:7px; margin-bottom:18px; font-size:1.08em; display:flex; align-items:center; gap:10px;">
        <i class="fas fa-exclamation-circle"></i> ${sessionScope.error}
      </div>
      <% session.removeAttribute("error"); %>
    </c:if>
    <h2>My Profile</h2>
    <div class="overdue-section">
      <c:choose>
        <c:when test="${empty myBooks}">
          <div style="padding: 20px; color: #888;">You have not borrowed any books yet.</div>
        </c:when>
        <c:otherwise>
          <table>
            <thead>
              <tr>
                <th>Cover</th>
                <th>Title</th>
                <th>Author</th>
                <th>Loan Date</th>
                <th>Due Date</th>
                <th>Status</th>
                <th>Return</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="book" items="${myBooks}">
                <tr>
                  <td>
                    <img src="${book.bookImage}" alt="${book.bookTitle}" style="width: 50px; height: 70px; object-fit: cover; border-radius: 4px;">
                  </td>
                  <td>${book.bookTitle}</td>
                  <td>${book.bookAuthor}</td>
                  <td><fmt:formatDate value="${book.borrowDate}" pattern="MMM dd, yyyy" /></td>
                  <td><fmt:formatDate value="${book.dueDate}" pattern="MMM dd, yyyy" /></td>
                  <td>
                    <c:choose>
                      <c:when test="${book.status == 'OVERDUE'}">
                        <span class="status-overdue">Overdue</span>
                      </c:when>
                      <c:when test="${book.status == 'RETURNED'}">
                        <span class="status-returned">Returned</span>
                      </c:when>
                      <c:otherwise>
                        <span style="background:#FBBF24; color:#fff; padding:5px 10px; border-radius:5px;">On Loan</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <c:if test="${book.status == 'BORROWED' || book.status == 'OVERDUE'}">
                      <form action="${pageContext.request.contextPath}/return" method="post" style="margin:0;" onsubmit="return confirmReturn(this);">
                        <input type="hidden" name="borrowId" value="${book.borrowId}" />
                        <button type="submit" style="background:#6B46C1; color:#fff; border:none; border-radius:4px; padding:6px 12px; cursor:pointer;">Return</button>
                      </form>
                    </c:if>
                    <c:if test="${book.status == 'RETURNED'}">
                      <span style="color:#888;">—</span>
                    </c:if>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:otherwise>
      </c:choose>
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

<script>
  function confirmReturn(form) {
    if (confirm('Are you sure you want to return this book?')) {
      form.submit();
    }
    return false;
  }
</script>

</body>
</html>