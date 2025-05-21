package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.UserDAO;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

@WebServlet("/add_member")
@MultipartConfig // Add this annotation to enable multipart request processing
public class AddMemberServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message;
        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            Part imagePart = request.getPart("image");
            byte[] imageData = null;
            String imageType = null;

            // Validate required fields
            if (name == null || name.trim().isEmpty() ||
                    email == null || email.trim().isEmpty() ||
                    password == null || password.trim().isEmpty() ||
                    role == null || role.trim().isEmpty()) {
                message = "All fields (name, email, password, role) are required.";
                request.getSession().setAttribute("addMemberMessage", message);
                response.sendRedirect(request.getContextPath() + "/dashboard");
                return;
            }

            // Handle image upload
            if (imagePart != null && imagePart.getSize() > 0) {
                imageType = imagePart.getContentType();
                try (InputStream inputStream = imagePart.getInputStream()) {
                    imageData = inputStream.readAllBytes();
                }
            }

            // Check if email already exists
            if (UserDAO.emailExists(email)) {
                message = "Email '" + email + "' already exists. Please use a different email.";
                request.getSession().setAttribute("addMemberMessage", message);
                response.sendRedirect(request.getContextPath() + "/dashboard");
                return;
            }

            // Add the user
            UserDAO.addUser(name, email, password, role, imageData, imageType);
            message = "Member added successfully!";
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Database error: " + e.getMessage();
        } catch (Exception e) {
            e.printStackTrace();
            message = "Failed to add member: " + e.getMessage();
        }

        request.getSession().setAttribute("addMemberMessage", message);
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}