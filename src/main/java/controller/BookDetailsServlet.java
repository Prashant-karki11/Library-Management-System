package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import model.BookDAO;
import model.BorrowDAO;

import java.io.IOException;

@WebServlet("/book-details")
public class BookDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get the book ID from the request parameter
            int bookId = Integer.parseInt(request.getParameter("id"));
            
            // Get the book details from the database
            Book book = BookDAO.getBookById(bookId);
            
            if (book != null) {
                // Check if the book is available for borrowing
                boolean isAvailable = BorrowDAO.isBookAvailable(bookId);
                request.setAttribute("bookAvailable", isAvailable);
                
                // Set the book as an attribute and forward to the details page
                request.setAttribute("book", book);
                request.getRequestDispatcher("/View/jsp/book_details.jsp").forward(request, response);
            } else {
                // If book not found, redirect to home page
                response.sendRedirect(request.getContextPath() + "/home");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
} 