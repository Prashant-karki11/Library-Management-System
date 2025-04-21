package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class MembersServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> members = new ArrayList<>();
        members.add(new User(1, "John Doe", "john@example.com", "1234567890", "123 Main St", new Date(), "Member"));
        members.add(new User(2, "Jane Smith", "jane@example.com", "0987654321", "456 Oak St", new Date(), "Member"));
        members.add(new User(3, "Alice Johnson", "alice@example.com", "1122334455", "789 Pine St", new Date(), "Admin"));
        request.setAttribute("members", members);
        request.getRequestDispatcher("/WEB-INF/jsp/members.jsp").forward(request, response);
    }
}