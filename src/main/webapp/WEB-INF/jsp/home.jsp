<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            background-color: var(--primary-bg);
            color: #2D3748;
            margin: 0; /* Remove default browser margins */
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .container {
            display: flex;
            min-height: 100vh;
            width: 100vw; /* Ensure container takes full viewport width */
        }
        .sidebar {
            width: 250px;
            background: linear-gradient(to bottom, #6B46C1, #A78BFA);
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
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
            margin-left: 250px;
            padding: 30px 15px;
            min-height: 100vh;
            width: calc(100% - 250px); /* Take remaining width after sidebar */
        }
        .hero {
            text-align: center;
            padding: 60px 20px;
            background-color: #FFFFFF;
            border-radius: 10px;
            margin: 20px 0;
            width: 100%;
        }
        .hero h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #2D3748;
        }
        .hero p {
            font-size: 1.2em;
            color: #666666;
            margin-bottom: 30px;
        }
        .search-bar {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            max-width: 500px;
            margin: 0 auto;
        }
        .search-bar input {
            padding: 10px 15px;
            width: 100%;
            border: 1px solid #E5E7EB;
            border-radius: 8px;
            font-size: 1em;
            color: #2D3748;
            outline: none;
        }
        .search-bar input::placeholder {
            color: #666666;
        }
        .search-bar button {
            padding: 10px 20px;
            background-color: var(--accent-blue);
            color: #FFFFFF;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .search-bar button:hover {
            background-color: #A78BFA;
        }
        .books-section {
            margin: 40px 0;
            width: 100%;
        }
        .books-section h2 {
            font-size: 2em;
            margin-bottom: 20px;
            color: #2D3748;
        }
        .book-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            width: 100%;
        }
        .book-card {
            background-color: #FFFFFF;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            width: 100%;
        }
        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .book-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .book-card h3 {
            font-size: 1.2em;
            margin-bottom: 10px;
            color: #2D3748;
        }
        .book-card p {
            font-size: 0.9em;
            color: #666666;
            margin-bottom: 8px;
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
            background-color: #FFFFFF;
            padding: 20px;
            text-align: center;
            border-top: 1px solid #E5E7EB;
            width: 100%;
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
            <div class="logo"><span>📚</span> Library.io</div>
        </div>
        <ul>
            <li><a href="${pageContext.request.contextPath}/home" class="active"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/recent_activities"><i class="fas fa-clock"></i> Recent Activities</a></li>
            <li><a href="${pageContext.request.contextPath}/library_loans"><i class="fas fa-book-open"></i> Library Loans</a></li>
            <li><a href="${pageContext.request.contextPath}/books"><i class="fas fa-book"></i> Books</a></li>
            <li><a href="${pageContext.request.contextPath}/members"><i class="fas fa-users"></i> Members</a></li>
        </ul>
    </aside>

    <main class="content">
        <section class="hero">
            <h1>Welcome to Library.io</h1>
            <p>Your one-stop digital library for managing books, members, and lending history.</p>
            <div class="search-bar">
                <input type="text" placeholder="Search for books...">
                <button><i class="fas fa-search"></i> Search</button>
            </div>
        </section>

        <section class="books-section">
            <h2>Explore Our Collection</h2>
            <div class="book-grid">
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>The Great Gatsby</h3>
                    <p><strong>Author:</strong> F. Scott Fitzgerald</p>
                    <p><strong>Price:</strong> $12.99</p>
                    <p><strong>Pages:</strong> 180</p>
                    <div class="status-available">Available</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>1984</h3>
                    <p><strong>Author:</strong> George Orwell</p>
                    <p><strong>Price:</strong> $9.99</p>
                    <p><strong>Pages:</strong> 328</p>
                    <div class="status-loaned">Loaned</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>Pride and Prejudice</h3>
                    <p><strong>Author:</strong> Jane Austen</p>
                    <p><strong>Price:</strong> $10.50</p>
                    <p><strong>Pages:</strong> 432</p>
                    <div class="status-available">Available</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>To Kill a Mockingbird</h3>
                    <p><strong>Author:</strong> Harper Lee</p>
                    <p><strong>Price:</strong> $14.99</p>
                    <p><strong>Pages:</strong> 281</p>
                    <div class="status-loaned">Loaned</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>The Catcher in the Rye</h3>
                    <p><strong>Author:</strong> J.D. Salinger</p>
                    <p><strong>Price:</strong> $11.99</p>
                    <p><strong>Pages:</strong> 277</p>
                    <div class="status-available">Available</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>Brave New World</h3>
                    <p><strong>Author:</strong> Aldous Huxley</p>
                    <p><strong>Price:</strong> $13.49</p>
                    <p><strong>Pages:</strong> 311</p>
                    <div class="status-loaned">Loaned</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>Jane Eyre</h3>
                    <p><strong>Author:</strong> Charlotte Brontë</p>
                    <p><strong>Price:</strong> $12.49</p>
                    <p><strong>Pages:</strong> 532</p>
                    <div class="status-available">Available</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>The Hobbit</h3>
                    <p><strong>Author:</strong> J.R.R. Tolkien</p>
                    <p><strong>Price:</strong> $15.99</p>
                    <p><strong>Pages:</strong> 310</p>
                    <div class="status-loaned">Loaned</div>
                    <a href="#" class="see-more">See More</a>
                </div>
                <div class="book-card">
                    <img src="https://via.placeholder.com/150x200" alt="Book Cover">
                    <h3>Frankenstein</h3>
                    <p><strong>Author:</strong> Mary Shelley</p>
                    <p><strong>Price:</strong> $8.99</p>
                    <p><strong>Pages:</strong> 280</p>
                    <div class="status-available">Available</div>
                    <a href="#" class="see-more">See More</a>
                </div>
            </div>
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
    </main>
</div>

</body>
</html>