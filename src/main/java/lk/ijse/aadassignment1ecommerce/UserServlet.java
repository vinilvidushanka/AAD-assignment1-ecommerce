package lk.ijse.aadassignment1ecommerce;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.PreparedStatement;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
    String DB_USER = "root";
    String DB_PASSWORD = "ijse@123";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            java.sql.Connection connection = java.sql.DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            PreparedStatement preparedStatement = connection.prepareStatement("insert into users(username, email, role, password_hash) values(?, ?, ?, ?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, role);
            preparedStatement.setString(4, password);
            preparedStatement.executeUpdate();

            int i=preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

            if (i > 0) {
                resp.sendRedirect("index.jsp?message=User Added Successfully");
            }else {
                resp.sendRedirect("index.jsp?message=User Not Added");
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

}
