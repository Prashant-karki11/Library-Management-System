package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserDAO;
import java.io.IOException;

@WebServlet("/add_member")
public class AddMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message;
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            UserDAO.addUser(name, email, password, role);
            message = "Member added successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            message = "Failed to add member.";
        }
        request.getSession().setAttribute("addMemberMessage", message);
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
} 