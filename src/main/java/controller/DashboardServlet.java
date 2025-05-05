package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;
import java.io.IOException;
import java.util.*;
import dao.ActivityDAO;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get total books count
            int totalBooks = BookDAO.getTotalBooks();
            request.setAttribute("totalBooks", totalBooks);

            // Get active loans count
            int activeLoans = BorrowDAO.getActiveLoansCount();
            request.setAttribute("activeLoans", activeLoans);

            // Get overdue books count
            int overdueBooks = BorrowDAO.getOverdueBooksCount();
            request.setAttribute("overdueBooks", overdueBooks);

            // Get total members count
            int totalMembers = UserDAO.getTotalMembers();
            request.setAttribute("totalMembers", totalMembers);

            // Get recent activities
            List<Activity> recentActivities = ActivityDAO.getRecentActivities(5);
            request.setAttribute("recentActivities", recentActivities);

            // Get overdue books list
            List<Map<String, Object>> overdueBooksList = BorrowDAO.getOverdueBooksList();
            request.setAttribute("overdueBooksList", overdueBooksList);

            // Get popular books
            List<Map<String, Object>> popularBooks = BookDAO.getPopularBooks(5);
            request.setAttribute("popularBooks", popularBooks);

        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/View/jsp/dashboard.jsp").forward(request, response);
    }
}