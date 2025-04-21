package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import model.Book;

public class HomeServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        System.out.println("HomeServlet initialized");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("HomeServlet: Handling GET request for /");
        List<Book> books = new ArrayList<>();
        books.add(new Book(1, "Atomic Habits", "James Clear", "Publisher", "ISBN123", 2018, "Self-Help"));
        books.add(new Book(2, "The Alchemist", "Paulo Coelho", "Publisher", "ISBN456", 1988, "Fiction"));
        request.setAttribute("books", books);
        request.getRequestDispatcher("/WEB-INF/jsp/home.jsp").forward(request, response);
    }
}