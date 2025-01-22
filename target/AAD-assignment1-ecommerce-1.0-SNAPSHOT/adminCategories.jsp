<%@ page import="lk.ijse.aadassignment1ecommerce.DTO.CategoryDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/21/2025
  Time: 7:44 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>LUXYWatch</title>

  <style>
    table{
      border-collapse: collapse;
      width: 100%;
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
            <li class="nav-item">
              <a class="nav-link" href="adminItems.jsp">Items</a>
            </li>
            <li class="nav-item active">
              <a class="nav-link" href="adminCategories.jsp">Categories </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="adminUsers.jsp">Users</a>
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

<div class="m-5"><h4>Add Category</h4></div>

<%
  String message = request.getParameter("message");
  String error = request.getParameter("error");
%>

<% if (message != null) { %>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <%= message %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<% } %>

<% if (error != null) { %>
<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <%= error %>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<% } %>


<form action="Categories" method="post" class="row g-3 m-5" >
  <div class="col-md-6">
    <label for="categoryName" class="form-label">Category Name</label>
    <input type="text" name="categoryName" class="form-control" id="categoryName">
  </div>
  <div class="col-md-6">
    <label for="categoryDesc" class="form-label">Description</label>
    <input type="text" name="categoryDesc" class="form-control" id="categoryDesc">
  </div>
  <div class="col-12">
    <button type="submit" class="btn btn-primary mt-3">Save</button>
    <button type="submit" class="btn btn-primary mt-3">Update</button>
    <button type="danger" class="btn btn-primary mt-3">Delete</button>
  </div>
</form>



<%--<div class="m-5"><h3>Category list</h3></div>--%>

<%--<div class="m-5">--%>

<%--  <%--%>
<%--    List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");--%>

<%--    if(categories != null && !categories.isEmpty()) {--%>

<%--  %>--%>
<%--  <table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--      <th>ID</th>--%>
<%--      <th>Name</th>--%>
<%--      <th>Description</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <%--%>
<%--      for (CategoryDTO category : categories) {--%>
<%--    %>--%>
<%--    <tr>--%>
<%--      <td><%= category.getId() %></td>--%>
<%--      <td><%= category.getName() %></td>--%>
<%--      <td><%= category.getDescription() %></td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--      }--%>
<%--    %>--%>
<%--    </tbody>--%>
<%--  </table>--%>
<%--  <%--%>
<%--    }--%>
<%--  %>--%>

<%--</div>--%>

<div class="m-5">
  <h3>Category List</h3>
</div>

<div class="m-5">
  <%
    List<CategoryDTO> categories = (List<CategoryDTO>) request.getAttribute("categories");

    if (categories != null && !categories.isEmpty()) {
  %>
  <table class="table table-bordered table-striped table-hover">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (CategoryDTO category : categories) {
    %>
    <tr>
      <td><%= category.getId() %></td>
      <td><%= category.getName() %></td>
      <td><%= category.getDescription() %></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <%
  } else {
  %>
  <div class="alert alert-info">No categories available.</div>
  <%
    }
  %>
</div>



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
