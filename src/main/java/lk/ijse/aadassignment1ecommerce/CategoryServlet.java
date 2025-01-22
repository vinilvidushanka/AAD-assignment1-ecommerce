package lk.ijse.aadassignment1ecommerce;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment1ecommerce.DTO.CategoryDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.ArrayList;

@WebServlet(name = "CategoryServlet", value = "/Categories")
public class CategoryServlet extends HttpServlet {
//    String DB_URL = "jdbc:mysql://localhost:3306/ecommerce";
//    String DB_USER = "root";
//    String DB_PASSWORD = "ijse@123";
//
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        ArrayList<CategoryDTO> categories = new ArrayList<>();
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            java.sql.Connection connection = java.sql.DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//            java.sql.Statement statement = connection.createStatement();
//            java.sql.ResultSet resultSet = statement.executeQuery("select * from categories");
//
//            while (resultSet.next()) {
//                int id = resultSet.getInt(1);
//                String name = resultSet.getString(2);
//                String description = resultSet.getString(3);
//
//                CategoryDTO category = new CategoryDTO(id, name, description);
//                categories.add(category);
//            }
//
//            req.setAttribute("categories", categories);
//            req.getRequestDispatcher("adminCategories.jsp").forward(req, resp);
//        } catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String name = req.getParameter("name");
//        String description = req.getParameter("description");
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            java.sql.Connection connection = java.sql.DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//
//            String sql = "insert into categories(name, description) values(?, ?)";
//            PreparedStatement pst = connection.prepareStatement(sql);
//            pst.setString(1, name);
//            pst.setString(2, description);
//            pst.executeUpdate();
//
//            int i = pst.executeUpdate();
//            pst.close();
//            connection.close();
//
//            if (i > 0) {
//                resp.sendRedirect("adminCategories.jsp?message=Category Added Successfully");
//            } else {
//                resp.sendRedirect("adminCategories.jsp?message=Category Not Added");
//            }
//        }catch (Exception e) {
//            throw new RuntimeException(e);
//        }
//    }

    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("categoryName");
            String description = req.getParameter("categoryDesc");

            java.sql.Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into categories(name, description) values(?, ?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.executeUpdate();

            int rowsAffected = preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            if (rowsAffected > 0) {
                resp.sendRedirect("adminCategories.jsp?message=Category Added Successfully");
            } else {
                resp.sendRedirect("adminCategories.jsp?message=Category Not Added");
            }
        } catch (Exception e) {
            resp.sendRedirect("adminCategories.jsp?error=An error occurred: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            java.sql.Connection connection = dataSource.getConnection();
            java.sql.Statement statement = connection.createStatement();
            java.sql.ResultSet resultSet = statement.executeQuery("select * from categories");

            ArrayList<CategoryDTO> categories = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                String name = resultSet.getString(2);
                String description = resultSet.getString(3);

                CategoryDTO category = new CategoryDTO(id, name, description);
                categories.add(category);
            }

            req.setAttribute("categories", categories);
            req.getRequestDispatcher("adminCategories.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("adminCategories.jsp?error=An error occurred: " + e.getMessage());
        }
    }
}
