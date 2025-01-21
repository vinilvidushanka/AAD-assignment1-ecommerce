<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <script
          src="https://kit.fontawesome.com/64d58efce2.js"
          crossorigin="anonymous"
  ></script>
  <link rel="stylesheet" href="CSS/index.css" />
  <title>LUXYWatch</title>
</head>
<body>
<div class="container">
  <div class="forms-container">
    <div class="signin-signup">
      <form action="#" class="sign-in-form">
        <h2 class="title">Sign in</h2>
        <div class="input-field">
          <i class="fas fa-user"></i>
          <input type="text" placeholder="Username" />
        </div>
        <div class="input-field">
          <i class="fas fa-lock"></i>
          <input type="password" placeholder="Password" />
        </div>
        <button class="btn transparent" class="btn solid">
          <a href="adminHome.jsp">Sign in</a>
        </button>
<%--        <input type="submit" value="Login" class="btn solid" />--%>
        <p class="social-text">Or Sign in with social platforms</p>
        <div class="social-media">
          <a href="#" class="social-icon">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="#" class="social-icon">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#" class="social-icon">
            <i class="fab fa-google"></i>
          </a>
          <a href="#" class="social-icon">
            <i class="fab fa-linkedin-in"></i>
          </a>
        </div>
      </form>
      <form action="user" class="sign-up-form" method="post">
        <h2 class="title">Sign up</h2>
        <div class="input-field">
          <i class="fas fa-user"></i>
          <input type="text" placeholder="Username" name="name" id="name" required />
        </div>
        <div class="input-field">
          <i class="fas fa-envelope"></i>
          <input type="email" placeholder="Email" name="email" id="email" required />
        </div>
        <div class="input-field">
          <i class="fas fa-lock"></i>
          <input type="password" placeholder="Password" name="password" id="password" required />
        </div>
        <input type="submit" class="btn" value="Sign up" />
        <p class="social-text">Or Sign up with social platforms</p>
        <div class="social-media">
          <a href="#" class="social-icon">
            <i class="fab fa-facebook-f"></i>
          </a>
          <a href="#" class="social-icon">
            <i class="fab fa-twitter"></i>
          </a>
          <a href="#" class="social-icon">
            <i class="fab fa-google"></i>
          </a>
          <a href="#" class="social-icon">
            <i class="fab fa-linkedin-in"></i>
          </a>
        </div>
      </form>
    </div>
    <% String message = request.getParameter("message");
      String error = request.getParameter("error");
    %>

    <%
      if (message != null) {
    %>

    <div style="color: green"><%= message %></div>

    <% } %>

    <%
      if (error != null) {
    %>

    <div style="color: red"><%= message %></div>

    <% } %>
  </div>

  <div class="panels-container">
    <div class="panel left-panel">
      <div class="content">
        <h3>New here ?</h3>
        <p>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Debitis,
          ex ratione. Aliquid!
        </p>
        <button class="btn transparent" id="sign-up-btn">
          Sign up
        </button>
      </div>
      <img src="images/3-e1711870791227.png" class="image" alt="" />
    </div>
    <div class="panel right-panel">
      <div class="content">
        <h3>One of us ?</h3>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum
          laboriosam ad deleniti.
        </p>
        <button class="btn transparent" id="sign-in-btn">
          <a href="home.jsp">Sign in</a>
        </button>
      </div>
      <img src="images/3-e1711870791227.png" class="image" alt="" />
    </div>
  </div>
</div>

<script src="assets/jquery-3.7.1.min.js"></script>
<script src="JS/index.js"></script>
</body>
</html>