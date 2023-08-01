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
    <title>Edit</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<div class="container">
    <h1>Edit </h1>
    <form:form action="/teams/${team.id }/edit" method="post" modelAttribute="team">
        <input type="hidden" name="_method" value="put">
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
            <form:textarea path="gameDay" class="form-control"/>
        </p>
        <input type="submit" value="Submit" class="btn btn-outline-success" />
    </form:form>
    <form action="/teams/${team.id }" method="post">
        <input type="hidden" name="_method" value="delete"> <input
            type="submit" value="Delete"  class="btn btn-danger">
    </form>
    <a href="/home">go back</a>
</div>
</body>
</html>


