<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/20/2025
  Time: 9:18 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>LUXYWatch</title>


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
            <a class="navbar-brand" href="home.jsp">
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
                        <li class="nav-item ">
                            <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.jsp"> About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="item-all">Shop</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="category.jsp">Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.jsp">Contact Us</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp">Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Log Out</a>
                        </li>
                    </ul>
                </div>

            </div>
        </nav>
    </header>
    <!-- end header section -->
</div>


<!-- blog section -->

<section class="blog_section layout_padding">
    <div class="container">
        <div class="heading_container">
            <h2>
                Categories
            </h2>
        </div>
        <div class="row">
            <div class="col-md-6 col-lg-4 mx-auto">
                <div class="box">
                    <div class="img-box">
                        <img src="images/images (4).jpg" alt="">
                    </div>
                    <div class="detail-box">
                        <h5>
                            Smart Watch
                        </h5>
                        <p>
                            alteration in some form, by injected humour, or randomised words which don't look even slightly believable.
                        </p>
                        <a href="">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 mx-auto">
                <div class="box">
                    <div class="img-box">
                        <img src="images/download (2).jpg" alt="">
                    </div>
                    <div class="detail-box">
                        <h5>
                            Classic Watch
                        </h5>
                        <p>
                            alteration in some form, by injected humour, or randomised words which don't look even slightly believable.
                        </p>
                        <a href="">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 mx-auto">
                <div class="box">
                    <div class="img-box">
                        <img src="images/3-e1711870791227.png" alt="">
                    </div>
                    <div class="detail-box">
                        <h5>
                            Kids Watch
                        </h5>
                        <p>
                            alteration in some form, by injected humour, or randomised words which don't look even slightly believable.
                        </p>
                        <a href="">
                            Read More
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- end blog section -->

<!-- info section -->
<section class="info_section long_section">

    <div class="container">
        <div class="contact_nav">
            <a href="">
                <ion-icon name="call"></ion-icon>
                <span>
            Call : +94 701234567
          </span>
            </a>
            <a href="">
                <ion-icon name="mail-open-outline"></ion-icon>
                <span>
            Email : luxywatch@gmail.com
          </span>
            </a>
            <a href="">
                <ion-icon name="location"></ion-icon>
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
                            <a class="" href="item-all">Shop</a>
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
                                <ion-icon name="logo-facebook"></ion-icon>
                            </a>
                            <a href="">
                                <ion-icon name="logo-twitter"></ion-icon>
                            </a>
                            <a href="">
                                <ion-icon name="logo-linkedin"></ion-icon>
                            </a>
                            <a href="">
                                <ion-icon name="logo-instagram"></ion-icon>
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
<script src="js/jquery-3.4.1.min.js"></script>
<!-- bootstrap js -->
<script src="JS/bootstrap.js"></script>
<!-- custom js -->
<script src="JS/custom.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
<!-- End Google Map -->

<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

</body>
</html>
