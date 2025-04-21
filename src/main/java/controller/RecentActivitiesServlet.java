package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class RecentActivitiesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Map<String, Object>> activities = new ArrayList<>();
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy");
            Map<Integer, String> bookTitles = new HashMap<>();
            bookTitles.put(1, "Atomic Habits");
            bookTitles.put(2, "The Alchemist");
            Map<Integer, String> userNames = new HashMap<>();
            userNames.put(1, "John Doe");
            userNames.put(2, "Jane Smith");

            Map<String, Object> activity1 = new HashMap<>();
            activity1.put("bookTitle", bookTitles.get(1));
            activity1.put("borrower", userNames.get(1));
            activity1.put("borrowDate", sdf.parse("Jul 01, 2023"));
            activity1.put("dueDate", sdf.parse("Jul 29, 2023"));
            activity1.put("status", "Borrowed");

            Map<String, Object> activity2 = new HashMap<>();
            activity2.put("bookTitle", bookTitles.get(2));
            activity2.put("borrower", userNames.get(2));
            activity2.put("borrowDate", sdf.parse("Jun 25, 2023"));
            activity2.put("dueDate", sdf.parse("Jul 23, 2023"));
            activity2.put("status", "Returned");

            activities.add(activity1);
            activities.add(activity2);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("activities", activities);
        request.getRequestDispatcher("/WEB-INF/jsp/recent_activities.jsp").forward(request, response);
    }
}