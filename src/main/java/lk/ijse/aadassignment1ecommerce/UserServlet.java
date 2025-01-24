package lk.ijse.aadassignment1ecommerce;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment1ecommerce.DTO.UserDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {

        @Resource(name = "java:comp/env/jdbc/pool")
        private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String action = req.getParameter("action");

            if ("delete".equals(action)) {
                doDelete(req, resp);
            } else {
                // Handle other actions if needed
            }

            String name = req.getParameter("userName");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String role = req.getParameter("role");

            java.sql.Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into users(username, email, role, password_hash) values(?, ?, ?, ?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, role);
            preparedStatement.setString(4, password);
            preparedStatement.executeUpdate();


            int rowsAffected = preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            // Set success message
            if (rowsAffected > 0) {
                req.getSession().setAttribute("message", "User added successfully!");
                req.getSession().setAttribute("alertType", "success");
            } else {
                req.getSession().setAttribute("message", "Failed to add user!");
                req.getSession().setAttribute("alertType", "error");
            }

            // Redirect to the target page
            resp.sendRedirect("adminUsers.jsp");
        }   catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("message", "An error occurred: " + e.getMessage());
            req.getSession().setAttribute("alertType", "error");
            resp.sendRedirect("adminUsers.jsp");
        }


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            java.sql.Connection connection = dataSource.getConnection();
            ResultSet resultSet = connection.prepareStatement("select * from users").executeQuery();

            ArrayList<UserDTO> users = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("user_id");
                String name = resultSet.getString("username");
                String email = resultSet.getString("email");
                String role = resultSet.getString("role");
                String password = resultSet.getString("password_hash");

                UserDTO user = new UserDTO(id, name, email, password, role);
                users.add(user);
            }
            req.setAttribute("users", users);
            req.getRequestDispatcher("adminUsers.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("adminUsers.jsp?error=An error occurred: " + e.getMessage());
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");

            try (Connection connection = dataSource.getConnection()) {
                String sql = "DELETE FROM users WHERE user_id = ?";
                try (PreparedStatement ps = connection.prepareStatement(sql)) {
                    ps.setInt(1, Integer.parseInt(userId));
                    int rowsAffected = ps.executeUpdate();

                    if (rowsAffected > 0) {
                        req.setAttribute("message", "User deleted successfully.");
                        req.getSession().setAttribute("alertType", "success");
                    } else {
                        req.setAttribute("error", "Failed to delete the user.");
                        req.getSession().setAttribute("alertType", "error");
                    }
                    resp.sendRedirect("adminUsers.jsp");
                }
            } catch (NumberFormatException e) {
                req.setAttribute("error", "Invalid user ID format.");
            } catch (SQLException e) {
                req.setAttribute("error", "Database error: " + e.getMessage());
            }

    }

}


