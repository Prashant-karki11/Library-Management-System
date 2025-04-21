package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Borrow;
import model.Book;
import model.User;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class LibraryLoansServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Borrow> loans = new ArrayList<>();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
            Book book1 = new Book(1, "Atomic Habits", "James Clear", "Publisher", "ISBN123", 2018, "Self-Help");
            User user1 = new User(1, "John Doe", "john@example.com", "1234567890", "123 Main St", new Date(), "Member");
            Borrow loan1 = new Borrow(1, 1, 1, sdf.parse("Jul 01, 2023"), sdf.parse("Jul 29, 2023"), null, 0.0);

            Book book2 = new Book(2, "The Alchemist", "Paulo Coelho", "Publisher", "ISBN456", 1988, "Fiction");
            User user2 = new User(2, "Jane Smith", "jane@example.com", "0987654321", "456 Oak St", new Date(), "Member");
            Borrow loan2 = new Borrow(2, 2, 2, sdf.parse("Jun 25, 2023"), sdf.parse("Jul 23, 2023"), sdf.parse("Jul 20, 2023"), 0.0);

            loans.add(loan1);
            loans.add(loan2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("loans", loans);
        request.getRequestDispatcher("/WEB-INF/jsp/library_loans.jsp").forward(request, response);
    }
}