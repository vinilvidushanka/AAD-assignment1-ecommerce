package lk.ijse.aadassignment1ecommerce;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.aadassignment1ecommerce.DTO.UserDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "LoginServlet", value = "/Login-save")
public class LoginServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDTO userDTO = new UserDTO();
        userDTO.setEmail(email);
        userDTO.setPassword(password);

        try (Connection connection = dataSource.getConnection()) {
            String sql = "SELECT * FROM users WHERE email = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, userDTO.getEmail());

                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        String storedPassword = resultSet.getString("password");
                        String role = resultSet.getString("role");
                        String name = resultSet.getString("username");

                        // Verify password
                        if (storedPassword.equals(userDTO.getPassword())) {  // Use hashed password comparison
                            userDTO.setName(name);
                            userDTO.setRole(role != null ? role : "Admin");

                            // Store user in session
                            HttpSession session = req.getSession();
                            session.setAttribute("user", userDTO);

                            // Redirect based on role
                            if ("Admin".equalsIgnoreCase(role)) {
                                req.setAttribute("message", "Login Success! Welcome, Admin.");
                                req.getRequestDispatcher("adminHome.jsp").forward(req, resp);
                            } else {
                                req.setAttribute("message", "Login Success! Welcome, Customer.");
                                req.getRequestDispatcher("home.jsp").forward(req, resp);
                            }
                        } else {
                            req.setAttribute("message", "Login Failed! Incorrect password.");
                            req.getRequestDispatcher("index.jsp").forward(req, resp);
                        }
                    } else {
                        req.setAttribute("message", "Login Failed! Email not found.");
                        req.getRequestDispatcher("index.jsp").forward(req, resp);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("message", "An error occurred: " + e.getMessage());
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

}
