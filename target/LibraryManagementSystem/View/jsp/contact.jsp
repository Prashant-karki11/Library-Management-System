<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - LibraryIo</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
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
            background: linear-gradient(135deg, #2A2F5B 0%, #5A67D8 100%); /* Adjusted to a homepage-like gradient */
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
            flex-direction: column; /* Stack content vertically */
            align-items: center; /* Center content inside */
            width: 800px; /* Increased width for better appearance */
            max-width: 95%; /* Responsive for smaller screens */
            box-sizing: border-box;
        }
        .contact-container {
            display: flex;
            flex-direction: column; /* Stack sections vertically to fit square card */
            gap: 24px;
            width: 100%;
        }
        .contact-info {
            width: 100%;
        }
        .contact-info h1 {
            font-size: 2rem;
            color: #232946;
            margin-bottom: 8px;
            text-align: center;
        }
        .contact-info p {
            color: #444;
            margin-bottom: 24px;
            text-align: center;
        }
        .contact-info h2 {
            color: var(--accent-blue);
            font-size: 1.5rem;
            margin-bottom: 18px;
            text-align: center;
        }
        .contact-info .info-item {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            margin-bottom: 18px;
        }
        .contact-info .info-item i {
            color: var(--accent-blue);
            font-size: 1.2rem;
            margin-top: 3px;
        }
        .contact-info .info-label {
            font-weight: 600;
            color: #232946;
        }
        .contact-info .info-value {
            color: #444;
        }
        .contact-info .mission-statement {
            margin-top: 24px;
            background: #f8fafc;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 1px 6px rgba(0,0,0,0.04);
        }
        .contact-info .mission-statement h3 {
            color: var(--accent-blue);
            font-size: 1.3rem;
            margin-bottom: 12px;
        }
        .contact-info .mission-statement p {
            color: #444;
            font-size: 1rem;
        }
        .contact-info .hours {
            margin-top: 24px;
        }
        .contact-info .hours-title {
            font-weight: 600;
            color: var(--accent-blue);
            margin-bottom: 8px;
            text-align: center;
        }
        .contact-info .hours-list {
            color: #444;
            font-size: 0.98rem;
            text-align: center;
        }
        .contact-form-section {
            width: 100%;
        }
        .contact-form-box {
            background: #f8fafc;
            border-radius: 10px;
            padding: 32px 28px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.04);
        }
        .contact-form-box h3 {
            font-size: 1.3rem;
            margin-bottom: 10px;
            color: #232946;
            text-align: center;
        }
        .contact-form-box p {
            color: #666;
            font-size: 1rem;
            margin-bottom: 18px;
            text-align: center;
        }
        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }
        .contact-form-row {
            display: flex;
            gap: 16px;
        }
        .contact-form input, .contact-form textarea {
            font-size: 1rem;
            padding: 12px 14px;
            border-radius: 5px;
            border: 1px solid #cfd8dc;
            background: #fff;
            transition: border 0.2s;
            width: 100%;
        }
        .contact-form input:focus, .contact-form textarea:focus {
            border: 1.5px solid var(--accent-blue);
            outline: none;
        }
        .contact-form textarea {
            min-height: 90px;
            resize: vertical;
        }
        .contact-form button {
            background: linear-gradient(90deg, #6d83f2 0%, #232946 100%);
            color: #fff;
            border: none;
            padding: 12px 28px;
            border-radius: 5px;
            font-size: 1.08rem;
            font-weight: 600;
            cursor: pointer;
            align-self: center;
            transition: background 0.2s;
            display: flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 8px #6B46C133;
        }
        .contact-form button:hover {
            background: linear-gradient(90deg, #232946 0%, #6d83f2 100%);
            box-shadow: 0 4px 12px #6B46C166;
        }
        .faq-section {
            width: 100%;
            margin-top: 24px;
        }
        .faq-section h3 {
            font-size: 1.5rem;
            color: var(--accent-blue);
            margin-bottom: 18px;
            text-align: center;
        }
        .faq-item {
            background: #f8fafc;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 16px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.04);
        }
        .faq-item h4 {
            font-size: 1.1rem;
            color: #232946;
            margin-bottom: 8px;
        }
        .faq-item p {
            color: #444;
            font-size: 1rem;
        }
        .map-placeholder {
            width: 100%;
            height: 300px;
            background: #e2e8f0;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-top: 24px;
            box-shadow: 0 1px 6px rgba(0,0,0,0.04);
        }
        .map-placeholder p {
            color: #666;
            font-size: 1.1rem;
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
        .footer-links {
            margin-bottom: 16px;
        }
        .footer-links a {
            color: #e0e7ff;
            font-size: 1em;
            text-decoration: none;
            margin: 0 12px;
            transition: color 0.3s;
        }
        .footer-links a:hover {
            color: #A78BFA;
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
            padding: 0 80px; /* Further increased padding for more space */
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
            gap: 40px; /* Further increased gap for less congestion */
            margin-left: 40px; /* Increased margin for better spacing */
        }
        .navbar-links a {
            color: #e0e7ff;
            font-size: 1em; /* Reduced font size for better spacing */
            font-weight: 500;
            text-decoration: none;
            padding: 8px 0;
            border-bottom: 2.5px solid transparent;
            transition: color 0.2s, border-bottom 0.2s;
            white-space: nowrap; /* Prevent wrapping */
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
                <a href="${pageContext.request.contextPath}/dashboard" style="margin-right: 16px;">Dashboard</a>
                <a href="${pageContext.request.contextPath}/library_loans" style="margin-right: 16px;">Library Loans</a>
                <a href="${pageContext.request.contextPath}/books" style="margin-right: 16px;">Books</a>
                <a href="${pageContext.request.contextPath}/members">Members</a>
            </c:if>
            <a href="${pageContext.request.contextPath}/recent_activities">My Profile</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
            <a href="${pageContext.request.contextPath}/View/jsp/contact.jsp" class="active">Contact Us</a>
        </nav>
    </div>
    <div class="navbar-user">
        <c:choose>
            <c:when test="${sessionScope.user != null && not empty sessionScope.user.imageData}">
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
    </div>
</div>

<div class="container">
    <main class="content">
        <div class="main-content">
            <div class="main-card">
                <div class="book-details">
                    <div class="contact-container">
                        <div class="contact-info">
                            <h1>Contact Us</h1>
                            <p>Have questions or feedback? We would love to hear from you!</p>
                            <h2>Get in Touch</h2>
                            <p>We're an online library service based in Itahari, Nepal. We're here to help and answer any questions you might have.</p>
                            <div class="info-item">
                                <i class="fa fa-map-marker-alt"></i>
                                <div>
                                    <span class="info-label">Address</span><br>
                                    <span class="info-value">Itahari, Sunsari, Nepal</span>
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="fa fa-phone"></i>
                                <div>
                                    <span class="info-label">Phone</span><br>
                                    <span class="info-value">+977 9804001754</span>
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="fa fa-envelope"></i>
                                <div>
                                    <span class="info-label">Email</span><br>
                                    <span class="info-value">libraryIOcontact@gmail.com</span>
                                </div>
                            </div>
                            <div class="mission-statement">
                                <h3>Our Mission</h3>
                                <p>At LibraryIo, we aim to make knowledge accessible to everyone. Our online platform offers a vast collection of books, resources, and services to support learning and growth for all ages. Whether you're a student, educator, or lifelong learner, we're here to assist you on your journey.</p>
                            </div>
                        </div>
                        <div class="contact-form-section">
                            <div class="contact-form-box">
                                <h3>Send us a Message</h3>
                                <p>Fill out the form below and we'll get back to you as soon as possible</p>
                                <form class="contact-form">
                                    <div class="contact-form-row">
                                        <input type="text" placeholder="Name *" required>
                                        <input type="email" placeholder="Email *" required>
                                    </div>
                                    <input type="text" placeholder="Subject">
                                    <textarea placeholder="Message *" required></textarea>
                                    <button type="submit"><i class="fa fa-paper-plane"></i> Send Message</button>
                                </form>
                            </div>
                        </div>
                        <div class="faq-section">
                            <h3>Frequently Asked Questions</h3>
                            <div class="faq-item">
                                <h4>How do I borrow a book?</h4>
                                <p>You can borrow a book by signing into your LibraryIo account, browsing our collection, and selecting the "Borrow" option. Books are available for a 14-day loan period.</p>
                            </div>
                            <div class="faq-item">
                                <h4>What if I need to extend my loan?</h4>
                                <p>If you need more time with a book, you can request an extension through your account under "My Profile". Extensions are granted based on availability.</p>
                            </div>
                            <div class="faq-item">
                                <h4>Can I suggest a book for the library?</h4>
                                <p>Absolutely! Use the form above to send us a message with your book suggestion, and we'll consider adding it to our collection.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p>© 2025 Library IO. All rights reserved.</p>
        <div class="footer-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/about">About Us</a>
            <a href="${pageContext.request.contextPath}/View/jsp/contact.jsp">Contact Us</a>
            <a href="${pageContext.request.contextPath}/privacy">Privacy Policy</a>
            <a href="${pageContext.request.contextPath}/terms">Terms of Service</a>
        </div>
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