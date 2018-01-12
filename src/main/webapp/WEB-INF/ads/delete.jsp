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
        <jsp:param name="title" value="delete" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="profile-header">
    <h1>Delete ad</h1>
    <br>
    <a href="/profile" class="btn btn-default btn-return">Return to Profile</a>
    <span> ${sessionScope.id}</span>
</div>
<div class="container">
    <c:forEach var="Ad" items="${deleteAds}">
        <div class="col-sm-4">
                <div>
                    <input type="radio">
                    <h4>${Ad.title}</h4>
                    <p>${Ad.description}</p>

                </div>
        </div>
    </c:forEach>
    <a class="btn btn-default"> Delete ad</a>
</div>

</body>
</html>