package lk.ijse.aadassignment1ecommerce;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.aadassignment1ecommerce.DTO.ItemDTO;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

@WebServlet(name = "ItemServlet", value = "/Item")
public class ItemServlet extends HttpServlet {
    @Resource(name = "java:comp/env/jdbc/pool")
    private DataSource dataSource;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("itemName");
            String description = req.getParameter("itemDesc");
            Double price = Double.valueOf(req.getParameter("price"));
            int stock = Integer.parseInt(req.getParameter("stock"));
            String category_id = req.getParameter("categoryId");
            String image = req.getParameter("itemImg");

            java.sql.Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into products(name, description, price, stock, category_id, image) values(?, ?, ?, ?, ?,?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, price);
            preparedStatement.setInt(4, stock);
            preparedStatement.setInt(5, Integer.parseInt(category_id));
            preparedStatement.setString(6, image);

            int rowsAffected = preparedStatement.executeUpdate();
            preparedStatement.close();
            connection.close();

            if (rowsAffected > 0) {
                resp.sendRedirect("adminItems.jsp?message=Item added successfully");
            } else {
                resp.sendRedirect("adminItems.jsp?message=Item not added");
            }
        } catch (Exception e) {
            resp.sendRedirect("adminItems.jsp?error=An error occurred: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            java.sql.Connection connection = dataSource.getConnection();
            ResultSet resultSet = connection.prepareStatement("select * from products").executeQuery();

            ArrayList<ItemDTO> items = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                Double price = resultSet.getDouble("price");
                int stock = resultSet.getInt("stock");
                int category_id = resultSet.getInt("category_id");
                String image = resultSet.getString("image");

                ItemDTO item = new ItemDTO(id, name, description, price, stock, category_id, image);
                items.add(item);
            }

            req.setAttribute("items", items);
            req.getRequestDispatcher("adminItems.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect("adminItems.jsp?error=An error occurred: " + e.getMessage());
        }
    }
}
