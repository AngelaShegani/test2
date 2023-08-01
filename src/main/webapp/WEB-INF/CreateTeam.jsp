<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/27/2023
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<div class="container" class="form-group">
    <h1>New Listing </h1>
    <a href="/home">Dashboard</a>
    <form:form action="/teams" method="post" modelAttribute="team">
        <form:hidden path="user" value="${thisUser.id}"/>
        <form:errors style="color: red" path = "*"/>

        <p>
            <form:label path="teamName">Team Name:</form:label>
            <form:input path="teamName" class="form-control"/>
        </p>
        <p>
            <form:label path="skillLevel">Skill level(1-5):</form:label>
            <form:input path="skillLevel" class="form-control"/>
        </p>
        <p>
            <form:label path="gameDay">Game Day:</form:label>
            <form:textarea path="gameDay" class="form-control" />
        </p>
        <input type="submit" value="Submit" class="btn btn-outline-success"/>
    </form:form>
</div>
</body>
</html>

