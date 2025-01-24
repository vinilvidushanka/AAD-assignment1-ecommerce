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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ItemServlet", value = "/Item")
public class ItemServlet extends HttpServlet {
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

            String name = req.getParameter("itemName");
            String description = req.getParameter("itemDesc");
            double price = Double.parseDouble(req.getParameter("price"));
            int stock = Integer.parseInt(req.getParameter("stock"));
            int category_id = Integer.parseInt(req.getParameter("categoryId"));
            String url = req.getParameter("url");

            java.sql.Connection connection = dataSource.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into products(name, description, price, stock, category_id, url) values(?, ?, ?, ?, ?,?)");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, description);
            preparedStatement.setDouble(3, price);
            preparedStatement.setInt(4, stock);
            preparedStatement.setInt(5, category_id);
            preparedStatement.setString(6, url);

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

//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//            java.sql.Connection connection = dataSource.getConnection();
//            ResultSet resultSet = connection.prepareStatement("select * from products").executeQuery();
//
//            ArrayList<ItemDTO> items = new ArrayList<>();
//
//            while (resultSet.next()) {
//                int id = resultSet.getInt("product_id");
//                String name = resultSet.getString("name");
//                String description = resultSet.getString("description");
//                double price = resultSet.getDouble("price");
//                int stock = resultSet.getInt("stock");
//                int category_id = resultSet.getInt("category_id");
//                String url = resultSet.getString("image");
//
//                ItemDTO item = new ItemDTO(id, name, description, price, stock, category_id, url);
//                items.add(item);
//            }
//
//            req.setAttribute("items", items);
//            req.getRequestDispatcher("adminItems.jsp").forward(req, resp);
//        } catch (Exception e) {
//            resp.sendRedirect("adminItems.jsp?error=An error occurred: " + e.getMessage());
//        }
//    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Initialize resources and response message
        String errorMessage = null;
        ArrayList<ItemDTO> items = new ArrayList<>();

        try (Connection connection = dataSource.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM products");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Process the ResultSet
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                double price = resultSet.getDouble("price");
                int stock = resultSet.getInt("stock");
                int categoryId = resultSet.getInt("category_id");
                String url = resultSet.getString("url");

                // Create an ItemDTO and add it to the list
                ItemDTO item = new ItemDTO(id, name, description, price, stock, categoryId, url);
                items.add(item);
            }

            // Debugging: Print item count in the server log
            System.out.println("Number of items fetched: " + items.size());

            // Attach the items list to the request scope
            req.setAttribute("items", items);

            // Forward the request to the JSP
            req.getRequestDispatcher("adminItems.jsp").forward(req, resp);
        } catch (SQLException e) {
            // Log error for debugging
            e.printStackTrace();

            // Prepare an error message for the user
            errorMessage = "Unable to fetch products due to a database error. Please try again later.";
        } catch (Exception e) {
            // Log unexpected errors
            e.printStackTrace();

            // Prepare a generic error message for the user
            errorMessage = "An unexpected error occurred. Please try again.";
        }

        // Handle errors by redirecting to the JSP with an error message
        if (errorMessage != null) {
            req.setAttribute("error", errorMessage);
            req.getRequestDispatcher("adminItems.jsp").forward(req, resp);
        }
    }


    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("itemId");

        try (Connection connection = dataSource.getConnection()) {
            String sql = "DELETE FROM products WHERE product_id = ?";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(userId));
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    req.setAttribute("message", "Item deleted successfully.");
                    req.getSession().setAttribute("alertType", "success");
                } else {
                    req.setAttribute("error", "Failed to delete the Item.");
                    req.getSession().setAttribute("alertType", "error");
                }
                resp.sendRedirect("adminItems.jsp");
            }
        } catch (NumberFormatException e) {
            req.setAttribute("error", "Invalid Item ID format.");
        } catch (SQLException e) {
            req.setAttribute("error", "Database error: " + e.getMessage());
        }
    }
}
