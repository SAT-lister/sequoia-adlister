<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: sschutzman
  Date: 1/11/18
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="View Ad" />
    </jsp:include>
    <link rel="stylesheet" href="/CSS/main.css">
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">

            <h2>${ad.title}</h2></a>
            <p>${ad.description}</p>
            <h6>${ad.category}</h6>


    </div>
</body>
</html>
