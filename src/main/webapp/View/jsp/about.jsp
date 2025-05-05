<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>About Us - Library Management System</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background-color: #F5F7FA;
      color: #2D3748;
      margin: 0;
      padding: 0;
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
    .sidebar ul {
      list-style: none;
      padding: 0;
      margin: 0;
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
      padding: 40px 30px;
      width: calc(100% - 250px);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: flex-start;
    }
    .about-card {
      background: #fff;
      border-radius: 14px;
      box-shadow: 0 4px 24px rgba(107,70,193,0.07);
      padding: 48px 56px;
      max-width: 700px;
      width: 100%;
      text-align: center;
      margin-top: 40px;
    }
    .about-title {
      font-size: 2.2em;
      color: #6B46C1;
      font-weight: 700;
      margin-bottom: 18px;
    }
    .about-desc {
      font-size: 1.15em;
      color: #444;
      margin-bottom: 30px;
      line-height: 1.7;
    }
    .about-icons {
      margin-top: 30px;
      display: flex;
      justify-content: center;
      gap: 30px;
    }
    .about-icons i {
      font-size: 2.2em;
      color: #6B46C1;
      transition: color 0.3s;
    }
    .about-icons i:hover {
      color: #A78BFA;
    }
    @media (max-width: 900px) {
      .about-card { padding: 32px 10px; }
      .content { padding: 30px 5px; }
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
        <li><a href="${pageContext.request.contextPath}/books"><i class="fas fa-book"></i> Books</a></li>
        <li><a href="${pageContext.request.contextPath}/members"><i class="fas fa-users"></i> Members</a></li>
      </c:if>
      <li><a href="${pageContext.request.contextPath}/recent_activities"><i class="fas fa-clock"></i> My Profile</a></li>
      <li><a href="${pageContext.request.contextPath}/about" class="active"><i class="fas fa-info-circle"></i> About Us</a></li>
    </ul>
  </aside>
  <main class="content">
    <div class="about-card">
      <div class="about-title"><i class="fas fa-info-circle"></i> About Library.io</div>
      <div class="about-desc">
        Welcome to <b>Library.io</b>!<br><br>
        Our mission is to make borrowing, returning, and discovering books easy and enjoyable for everyone.<br>
        This system allows users and admins to browse our collection, manage loans, and stay up-to-date with library activities.<br><br>
        <b>Features for Users:</b><br>
        &bull; Search and explore a wide range of books<br>
        &bull; Borrow and return books online<br>
        &bull; Track your reading history and activities<br>
        <br>
        <b>Features for Admins:</b><br>
        &bull; Manage books and members<br>
        &bull; Oversee all library loans and returns<br>
        &bull; View and analyze library statistics<br>
        <br>
        <span style="color:#6B46C1; font-weight:500;">Happy Reading & Managing!</span>
      </div>
      <div class="about-icons">
        <i class="fas fa-book"></i>
        <i class="fas fa-users"></i>
        <i class="fas fa-laptop-code"></i>
        <i class="fas fa-heart"></i>
      </div>
    </div>
  </main>
</div>
</body>
</html>