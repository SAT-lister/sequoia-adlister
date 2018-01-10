<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>

</head>
<body>
<% String username = request.getParameter("username");
if (username == null) username = "";

    String email = request.getParameter("email");
    if (email == null) email = "";
// checking to see if this form has been submitted
    if (request.getMethod().equals("POST"))

%>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" value="<%=username%>" />
            </div>
            <c:if test="${sessionScope.existingUser != null}">
                <div class="alert alert-danger">
                    <strong>Bruh, That username already exists!</strong>
                </div>
                <c:remove var="existingUser" scope="session"/>
            </c:if>
            <c:if test="${sessionScope.emptyUsername}">
                <div class="alert alert-danger">
                    <strong>Hey, Please input a username!</strong>
                </div>
                <c:remove var="emptyUsername" scope="session"/>
            </c:if>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" value="<%=email%>">
            </div>
            <c:if test="${sessionScope.emptyEmail}">
                <div class="alert alert-danger">
                    <strong>Hey, Please input an email!</strong>
                </div>
                <c:remove var="emptyEmail" scope="session"/>
            </c:if>
            <c:if test="${sessionScope.existingEmail != null}">
                <div class="alert alert-danger">
                    <strong>Yo, That email already exists!</strong>
                </div>
                <c:remove var="existingEmail" scope="session"/>
            </c:if>
            <c:if test="${sessionScope.wrongEmail}">
                <div class="alert alert-danger">
                    <strong>Dude, That's not an email!</strong>
                </div>
                <c:remove var="wrongEmail" scope="session"/>
            </c:if>
            <div class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <c:if test="${sessionScope.emptyPassword}">
                <div class="alert alert-danger">
                    <strong>Hey, Please input a password!</strong>
                </div>
                <c:remove var="emptyPassword" scope="session"/>
            </c:if>
            <div class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password">
            </div>
            <c:if test="${sessionScope.emptyPasswordConfirmation}">
                <div class="alert alert-danger">
                    <strong>Hey, Please input a password!</strong>
                </div>
                <c:remove var="emptyPasswordConfirmation" scope="session"/>
            </c:if>
            <c:if test="${sessionScope.passwordsNotMatch}">
                <div class="alert alert-danger">
                    <strong>Man, These passwords don't match!</strong>
                </div>
                <c:remove var="passwordsNotMatch" scope="session"/>
            </c:if>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>
</body>
</html>
