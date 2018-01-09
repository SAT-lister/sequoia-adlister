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
    <form action="/search">
        <div class="form-group col-md-6" >
            <input type="text" name="search" class="form-control" placeholder="search dessert lister">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
    </form>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <h6>${ad.category}</h6>
        </div>
    </c:forEach>
</div>

</body>
</html>
