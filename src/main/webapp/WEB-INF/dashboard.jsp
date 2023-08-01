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
    <title>Welcome</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<div class="container">
    <h1>Welcome, ${thisLoggedInUser.userName}</h1>
    <a href="/logout">Log out</a>
    <hr />

    <table class="table table-dark">
        <thead>
        <tr>
            <th scope="col"> Address</th>
            <th scope="col">Listed on</th>
            <th scope="col">Added By</th>
            <th scope="col">Price </th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="team" items="${allDaTeams}">
            <tr>

                <td><a href="/teams/${team.id }"><c:out
                        value="${team.teamName}" /></a></td>
                <td><c:out value="${team.skillLevel }" /></td>
                <td><c:out value="${team.players.size() }/9"/></td>
                <td><c:out value="${team.gameDay }" /></td>



            </tr>
        </c:forEach>

        </tbody>
    </table>



    <a href="/teams/new" class="btn btn-outline-primary" >Add Listing</a>


</div>
</body>
</html>

