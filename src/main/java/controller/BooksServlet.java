package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Book;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
public class BooksServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> books = new ArrayList<>();
        books.add(new Book(1, "Atomic Habits", "James Clear", "Publisher", "ISBN123", 2018, "Self-Help"));
        books.add(new Book(2, "The Alchemist", "Paulo Coelho", "Publisher", "ISBN456", 1988, "Fiction"));
        books.add(new Book(3, "1984", "George Orwell", "Publisher", "ISBN789", 1949, "Dystopian"));
        request.setAttribute("books", books);
        request.getRequestDispatcher("/WEB-INF/jsp/books.jsp").forward(request, response);
    }
}