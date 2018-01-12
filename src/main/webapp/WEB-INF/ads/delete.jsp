<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: terrellstewart
  Date: 1/11/18
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="delete"/>
    </jsp:include>
    <link rel="stylesheet" href="/CSS/main.css"/>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="profile-header">
    <h1>Delete ad</h1>
    <br>
    <a href="/profile" class="btn btn-default btn-return">Return to Profile</a>
    <span> ${sessionScope.id}</span>
</div>
<div class="container" style="margin-top: 30px">
    <form action="/ads/delete" method="post">
        <c:forEach var="Ad" items="${deleteAds}">
            <div class="col-sm-4">
                <div>
                    <input type="radio" name="id"  value="${Ad.id}">
                    <h4>${Ad.title}</h4>
                    <p>${Ad.description}</p>

                </div>
            </div>
        </c:forEach>
        <button class="btn btn-default" type="submit"> Delete ad</button>
    </form>
</div>
<br>

</body>
</html>