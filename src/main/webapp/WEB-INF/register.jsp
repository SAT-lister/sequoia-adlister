<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>
            <c:if test="${sessionScope.existingUser != null}">
                <div class="alert alert-danger">
                    <strong>Bruh, That username already exists!</strong>
                </div>
            </c:if>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text">
            </div>
            <c:if test="${sessionScope.wrongEmail != null}">
                <div class="alert alert-danger">
                    <strong>Dude, That's not an email!</strong>
                </div>
            </c:if>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <c:if test="${sessionScope.passwordsNotMatch}">
                <div class="alert alert-danger">
                    <strong>Bruh, These don't match!</strong>
                </div>
            </c:if>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</body>
</html>
