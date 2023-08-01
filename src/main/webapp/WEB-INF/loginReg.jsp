<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/27/2023
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login and Registration</title>
    <h1> Welcome, House Hunter </h1>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css">
    <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script>
    <!-- change to match your file/naming structure -->
</head>
<body>
<div class="container">
    <!-- REGISTER -->
    <div class="login-reg-main border-round give-me-space-up-down">
        <h3>Register:</h3>
        <form:form action="/register" method="POST" modelAttribute="newUser">
            <div class="form-group">
                <form:label path="userName">Name:</form:label>
                <form:input path="userName" class="form-control" />
                <form:errors path="userName" class="text-danger" />
            </div>

            <div class="form-group">
                <form:label path="email">Email:</form:label>
                <form:input path="email" class="form-control" />
                <form:errors path="email" class="text-danger" />
            </div>

            <div class="form-group">
                <form:label path="password">Password:</form:label>
                <form:input path="password" class="form-control" type="password" />
                <form:errors path="password" class="text-danger" />
            </div>

            <div class="form-group">
                <form:label path="confirm">Confirm Password:</form:label>
                <form:input path="confirm" class="form-control" type="password" />
                <form:errors path="confirm" class="text-danger" />
            </div>
            <input type="submit" value="Register" class="btn btn-primary">
        </form:form>
    </div>
</div>

<!-- LOGIN -->
<div class="container">
    <div class="login-reg-main border-round">
        <h3>Login:</h3>
        <form:form action="/login" method="post" modelAttribute="newLogin">
            <div class="form-group">
                <label>Email:</label>
                <form:input path="email" class="form-control" />
                <form:errors path="email" class="text-danger" />
            </div>
            <div class="form-group">
                <label>Password:</label>
                <form:input path="password" class="form-control" type="password" />
                <form:errors path="password" class="text-danger" />
            </div>
            <input type="submit" value="Login" class="btn btn-success">

        </form:form>
    </div>
</div>
</body>
</html>

