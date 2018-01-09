<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Desserts" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here are all the desserts!</h1>
    <br>
    <div class="form-group col-md-4" >
        <form action="/search">
            <input type="text" name="search" class="form-control" placeholder="search dessert lister">
            <button type="submit" class="btn btn-default">Search</button>
        </form>
    </div>
</div>
    <div class="container">
    <div class="col-md-4">
    <c:forEach var="ad" items="${ads}">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <h6>${ad.category}</h6>
    </c:forEach>
        </div>
</div>

</body>
</html>
