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
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "CategoryServlet", value = "/Categories")
public class CategoryServlet extends HttpServlet {

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
            ResultSet resultSet = connection.prepareStatement("select * from categories").executeQuery();

            ArrayList<CategoryDTO> categories = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("category_id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");

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
