package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.BookDAO;
import java.io.IOException;

@WebServlet("/add_book")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message;
        try {
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            String isbn = request.getParameter("isbn");
            String genre = request.getParameter("genre");
            int publicationYear = 0;
            int pages = 0;
            try {
                publicationYear = Integer.parseInt(request.getParameter("publicationYear"));
            } catch (Exception ignored) {}
            try {
                pages = Integer.parseInt(request.getParameter("pages"));
            } catch (Exception ignored) {}
            BookDAO.addBook(title, author, publisher, isbn, publicationYear, genre, pages);
            message = "Book added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            message = "Failed to add book.";
        }
        request.getSession().setAttribute("addBookMessage", message);
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
} 