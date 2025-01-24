<%@ page import="lk.ijse.aadassignment1ecommerce.DTO.ItemDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/21/2025
  Time: 7:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LUXYWatch</title>

    <style>
        table{
            border-collapse: collapse;
            width: 90%;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="CSS/bootstrap.css" />

    <!-- fonts style -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />

    <!-- font awesome style -->
    <link href="CSS/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="CSS/style.css" rel="stylesheet" />
    <!-- responsive style -->
    <link href="CSS/responsive.css" rel="stylesheet" />
</head>
<body class="sub_page">

<div class="hero_area">
    <!-- header section strats -->
    <header class="header_section long_section px-0">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="adminHome.jsp">
          <span>
            LUXYWatch
          </span>
            </a>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="d-flex mx-auto flex-column flex-lg-row align-items-center">
                    <ul class="navbar-nav  ">
                        <li class="nav-item">
                            <a class="nav-link" href="adminHome.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="Item">Items</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Categories">Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="user">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="adminOrders.jsp">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Log Out</a>
                        </li>
                    </ul>
                </div>
                <div class="quote_btn-container">
                    <%--                    <a href="">--%>
                    <%--              <span>--%>
                    <%--                Log Out--%>
                    <%--              </span>--%>
                    <%--                        <i class="fa fa-user" aria-hidden="true"></i>--%>
                    <%--                    </a>--%>
                    <form class="form-inline">
                        <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                    </form>
                </div>
            </div>
        </nav>
    </header>
    <!-- end header section -->
</div>

<div class="m-5"><h4>Add Item</h4></div>

<%
    String message = (String) session.getAttribute("message");
    String alertType = (String) session.getAttribute("alertType");
    if (message != null && alertType != null) {
%>
<script>
    alert('<%= message %>');
</script>
<%
        // Clear the session attributes after displaying the alert
        session.removeAttribute("message");
        session.removeAttribute("alertType");
    }
%>

<form action="Item" method="post" class="row g-3 m-5" >
    <div class="col-md-4">
        <label for="itemName" class="form-label">Item Name</label>
        <input type="text" name="itemName" class="form-control" id="itemName">
    </div>
    <div class="col-md-4">
        <label for="itemDesc" class="form-label">Description</label>
        <input type="text" name="itemDesc" class="form-control" id="itemDesc">
    </div>
    <div class="col-md-4">
        <label for="itemImg" class="form-label">Image</label>
        <input type="file" name="url" class="form-control" id="itemImg" accept="image/*">
    </div>
    <div class="col-md-4">
        <label for="price" class="form-label">Price</label>
        <input type="text" name="price" class="form-control" id="price">
    </div>
    <div class="col-md-4">
        <label for="stock" class="form-label">Stock</label>
        <input type="number" name="stock" class="form-control" id="stock">
    </div>
    <div class="col-md-4">
        <label for="categoryId" class="form-label">Category Id</label>
        <input type="text" name="categoryId" class="form-control" id="categoryId">
    </div>
    <div class="col-12">
        <button type="submit" class="btn btn-primary mt-3">Save</button>
        <button type="submit" class="btn btn-primary mt-3">Update</button>
        <button type="danger" class="btn btn-primary mt-3">Delete</button>
    </div>
</form>


<h3 class="m-5">Items list</h3>

<%
    List<ItemDTO> itemList = (List<ItemDTO>) request.getAttribute("items");
    if(itemList != null && !itemList.isEmpty()) {

%>
<table class="m-5">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Stock</th>
        <th>Category ID</th>
        <th>Image</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (ItemDTO item : itemList) {
    %>
    <tr>
        <td><%= item.getId() %></td>
        <td><%= item.getName() %></td>
        <td><%= item.getDescription() %></td>
        <td><%= item.getPrice() %></td>
        <td><%= item.getStock() %></td>
        <td><%= item.getCategoryId() %></td>
        <td><%= item.getUrl() %></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<%
    }
%>


<!-- info section -->
<section class="info_section long_section">

    <div class="container">
        <div class="contact_nav">
            <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
            Call : +94 701234567
          </span>
            </a>
            <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>
            Email : luxywatch@gmail.com
          </span>
            </a>
            <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
            Sri Lanka
          </span>
            </a>
        </div>

        <div class="info_top ">
            <div class="row ">
                <div class="col-sm-6 col-md-4 col-lg-3">
                    <div class="info_links">
                        <h4>
                            QUICK LINKS
                        </h4>
                        <div class="info_links_menu">
                            <a class="" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                            <a class="" href="about.jsp"> About</a>
                            <a class="" href="shop.jsp">Shop</a>
                            <a class="" href="category.jsp">Categories</a>
                            <a class="" href="contact.jsp">Contact Us</a>
                            <a class="" href="cart.jsp">Cart</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-4 col-lg-3 mx-auto">

                </div>
                <div class="col-md-4">
                    <div class="info_form">
                        <h4>
                            SIGN UP TO OUR NEWSLETTER
                        </h4>
                        <form action="">
                            <input type="text" placeholder="Enter Your Email" />
                            <button type="submit">
                                Subscribe
                            </button>
                        </form>
                        <div class="social_box">
                            <a href="">
                                <i class="fa fa-facebook" aria-hidden="true"></i>
                            </a>
                            <a href="">
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </a>
                            <a href="">
                                <i class="fa fa-linkedin" aria-hidden="true"></i>
                            </a>
                            <a href="">
                                <i class="fa fa-instagram" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end info_section -->


<!-- footer section -->
<footer class="footer_section">
    <div class="container">
        <p>
            &copy; <span id="displayYear"></span> All Rights Reserved By LUXYWatch

        </p>
    </div>
</footer>
<!-- footer section -->


<!-- jQery -->
<script src="assets/jquery-3.7.1.min.js"></script>
<!-- bootstrap js -->
<script src="JS/bootstrap.js"></script>
<!-- custom js -->
<script src="JS/custom.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
<!-- End Google Map -->

</body>
</html>
