<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 7/27/2023
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Team details</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
<div class="container">

    <h1>${thisTeam.teamName }</h1>
    <a href="/home">Dashboard</a>
    <p>Elm Street: <c:out value="${thisTeam.user.userName }"/></p>
    <p>Ooak Lane: <c:out value="${thisTeam.teamName }"/></p>
    <p>Hill Drive: <c:out value="${thisTeam.skillLevel }"/></p>
    <p>Green Street: <c:out value="${thisTeam.gameDay }"/></p>
    <ul class="list-group">
        <c:forEach items="${thisPlayer }" var="player" >
            <li >${player.getPlayerName() }</li>
        </c:forEach>
    </ul>
    <hr />

    <form:form  action="/players/new" method="post" modelAttribute="player">
        <form:errors style="color: red" path = "*"/>
        <form:hidden path="team" value="${thisTeam.id}"/>
        <form:hidden path="user" value="${thisUser.id}"/>
        <p class= "d-inline">
            <form:label path="playerName" class="form-group mb-2">Player Name:</form:label>
            <form:input path="playerName" />
        </p>
        <input type="submit" value="Submit" class="btn btn-outline-warning"/>

    </form:form>

    <c:if test="${thisTeam.user.id eq thisUser.id }">
        <div class = "d-flex">
            <a href="/teams/${thisTeam.id }/edit" class="btn btn-primary" role="button" >edit</a>
            <form action="/teams/${thisTeam.id }" method="post">
                <input type="hidden" name="_method" value="delete"> <input
                    type="submit" value="Delete"  class="btn btn-danger">
            </form></div>
    </c:if>

</div>
</body>
</html>

