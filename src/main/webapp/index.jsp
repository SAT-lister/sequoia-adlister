<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="DessertLister!" />
    </jsp:include>
    <link rel="stylesheet" href="/CSS/main.css"/>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to the DessertLister!</h1>
        <img src="img/001-food-5.svg"/>
        <img src="img/007-candy.svg"/>
        <img src="img/008-pancakes.svg"/>
        <img src="img/009-ice-cream.svg"/>
        <img src="img/010-cookies.svg"/>
    </div>
</body>
</html>
