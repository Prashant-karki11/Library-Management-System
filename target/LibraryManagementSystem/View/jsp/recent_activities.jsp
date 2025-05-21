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
      height: 100%;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(135deg, #232946 0%, #6d83f2 100%);
      color: #232946;
      margin: 0;
      overflow-x: hidden;
    }
    .container {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      width: 100vw;
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
    .content {
      flex: 1;
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
    .profile-section {
      background: #fff;
      border-radius: 14px;
      box-shadow: 0 6px 32px 0 rgba(35, 41, 70, 0.13);
      padding: 48px 56px;
      max-width: 600px;
      width: 90%;
      margin: 20px 0;
    }
    .overdue-section {
      background: #fff;
      border-radius: 14px;
      box-shadow: 0 6px 32px 0 rgba(35, 41, 70, 0.13);
      padding: 48px 56px;
      width: 100%;
      margin: 20px 0;
    }
    h2 {
      font-size: 2.2em;
      color: #6B46C1;
      font-weight: 700;
      margin-bottom: 18px;
      text-align: center;
    }
    .profile-card {
      display: flex;
      align-items: center;
      gap: 18px;
      padding: 22px 32px;
      background: #fff;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(107, 70, 193, 0.07);
    }
    .profile-avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      object-fit: cover;
    }
    .profile-info {
      display: flex;
      flex-direction: column;
    }
    .profile-name {
      font-size: 1.2em;
      font-weight: 600;
      color: #2D3748;
    }
    .profile-email {
      color: #6B46C1;
      font-size: 1em;
    }
    .profile-role {
      color: #888;
      font-size: 0.98em;
      margin-top: 2px;
    }
    .profile-role span {
      color: #805AD5;
      font-weight: 500;
    }
    .logout-button {
      background: #EF4444;
      color: #fff;
      border: none;
      border-radius: 8px;
      padding: 8px 22px;
      font-weight: 700;
      font-size: 1em;
      transition: background 0.2s;
      box-shadow: 0 2px 8px #6B46C133;
    }
    .logout-button:hover {
      background: #C53030;
    }
    .success-message, .error-message {
      padding: 14px 20px;
      border-radius: 7px;
      font-size: 1.08em;
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 18px;
      width: 90%;
      max-width: 600px;
    }
    .success-message {
      background: #C6F6D5;
      color: #276749;
    }
    .error-message {
      background: #FED7D7;
      color: #C53030;
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
    .status-on-loan {
      background: #FBBF24;
      color: #fff;
      padding: 5px 10px;
      border-radius: 5px;
      display: inline-block;
    }
    .return-button {
      background: #6B46C1;
      color: #fff;
      border: none;
      border-radius: 8px;
      padding: 8px 16px;
      font-weight: 700;
      font-size: 1em;
      transition: background 0.2s;
      box-shadow: 0 2px 8px #6B46C133;
    }
    .return-button:hover {
      background: #805AD5;
    }
    .profile-image-section {
      text-align: center;
    }
    .profile-image {
      width: 90px;
      height: 90px;
      border-radius: 50%;
      object-fit: cover;
      border: 2px solid #6B46C1;
      box-shadow: 0 2px 8px #6B46C133;
      margin-bottom: 10px;
    }
    .update-image-button, .remove-image-button {
      border: none;
      border-radius: 8px;
      padding: 8px 18px;
      font-weight: 700;
      font-size: 1em;
      transition: background 0.2s;
      box-shadow: 0 2px 8px #6B46C133;
      margin: 5px;
    }
    .update-image-button {
      background: #6B46C1;
      color: #fff;
    }
    .update-image-button:hover {
      background: #805AD5;
    }
    .remove-image-button {
      background: #EF4444;
      color: #fff;
    }
    .remove-image-button:hover {
      background: #C53030;
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
    @media (max-width: 900px) {
      .profile-section { padding: 32px 10px; max-width: 90%; }
      .overdue-section { padding: 32px 10px; }
      .content { padding: 30px 5px; }
      .navbar { padding: 0 20px; }
      .navbar-links { gap: 15px; }
      .navbar-authbtns a { padding: 6px 15px; }
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
        <a href="${pageContext.request.contextPath}/books">Books</a>
        <a href="${pageContext.request.contextPath}/members">Members</a>
      </c:if>
      <a href="${pageContext.request.contextPath}/recent_activities" class="active">My Profile</a>
      <a href="${pageContext.request.contextPath}/about">About Us</a>
      <a href="${pageContext.request.contextPath}/View/jsp/contact.jsp" >Contact Us</a>
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
      <div class="profile-section">
        <h2><i class="fas fa-user"></i> My Profile</h2>
        <div class="profile-card">
          <c:choose>
            <c:when test="${not empty sessionScope.user.imageData}">
              <img src="${pageContext.request.contextPath}/user-image/${sessionScope.user.userID}" alt="Profile" class="profile-avatar" />
            </c:when>
            <c:otherwise>
              <img src="${pageContext.request.contextPath}/assets/default-avatar.jpg" alt="Default" class="profile-avatar" />
            </c:otherwise>
          </c:choose>
          <div class="profile-info">
            <div class="profile-name">${sessionScope.user.name}</div>
            <div class="profile-email">${sessionScope.user.email}</div>
            <div class="profile-role">Role: <span>${sessionScope.user.role}</span></div>
            <form action="${pageContext.request.contextPath}/logout" method="post" style="margin-top:14px;">
              <button type="submit" class="logout-button"><i class="fas fa-sign-out-alt"></i> Logout</button>
            </form>
          </div>
        </div>
        <c:if test="${not empty sessionScope.successMessage}">
          <div class="success-message">
            <i class="fas fa-check-circle"></i> ${sessionScope.successMessage}
          </div>
          <% session.removeAttribute("successMessage"); %>
        </c:if>
        <c:if test="${not empty sessionScope.error}">
          <div class="error-message">
            <i class="fas fa-exclamation-circle"></i> ${sessionScope.error}
          </div>
          <% session.removeAttribute("error"); %>
        </c:if>
        <div class="profile-image-section" style="margin-top: 20px;">
          <c:choose>
            <c:when test="${not empty sessionScope.user.imageData}">
              <img id="currentProfileImage" src="${pageContext.request.contextPath}/user-image/${sessionScope.user.userID}" alt="Profile" class="profile-image" />
            </c:when>
            <c:otherwise>
              <img id="currentProfileImage" src="${pageContext.request.contextPath}/assets/default-avatar.jpg" alt="Default" class="profile-image" />
            </c:otherwise>
          </c:choose>
          <form method="post" action="${pageContext.request.contextPath}/edit_profile" enctype="multipart/form-data" style="margin-bottom:10px;">
            <input type="file" name="image" accept="image/*" onchange="previewProfileImage(event)" style="margin-bottom:10px;">
            <div id="profileImagePreview" style="margin-bottom:10px;"></div>
            <button type="submit" class="update-image-button">Update Profile Image</button>
          </form>
          <form method="post" action="${pageContext.request.contextPath}/remove_profile_image">
            <button type="submit" class="remove-image-button">Remove Profile Image</button>
          </form>
        </div>
      </div>
      <div class="overdue-section">
        <h2>My Books</h2>
        <c:choose>
          <c:when test="${empty myBooks}">
            <div style="padding: 20px; color: #444; font-size: 1.15em;">You have not borrowed any books yet.</div>
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
                    <c:if test="${not empty book.bookImageURL}">
                      <img src="${book.bookImageURL}" alt="${book.bookTitle}" style="width: 50px; height: 70px; object-fit: cover; border-radius: 4px;">
                    </c:if>
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
                        <span class="status-on-loan">On Loan</span>
                      </c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <c:if test="${book.status == 'BORROWED' || book.status == 'OVERDUE'}">
                      <form action="${pageContext.request.contextPath}/return" method="post" style="margin:0;" onsubmit="return confirmReturn(this);">
                        <input type="hidden" name="borrowId" value="${book.borrowId}" />
                        <button type="submit" class="return-button">Return</button>
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

<script>
  function confirmReturn(form) {
    if (confirm('Are you sure you want to return this book?')) {
      form.submit();
    }
    return false;
  }

  function previewProfileImage(event) {
    const preview = document.getElementById('profileImagePreview');
    preview.innerHTML = '';
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();
      reader.onload = function(e) {
        preview.innerHTML = '<img src="' + e.target.result + '" style="width:90px;height:90px;border-radius:50%;object-fit:cover;border:2px solid #6B46C1;box-shadow:0 2px 8px #6B46C133;" />';
      };
      reader.readAsDataURL(event.target.files[0]);
    }
  }
</script>
</body>
</html>