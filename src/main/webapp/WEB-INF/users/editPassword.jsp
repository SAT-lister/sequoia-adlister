<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
    <jsp:include page="../partials/head.jsp">
        <jsp:param name="title" value="Edit Profile!" />
    </jsp:include>
    <link rel="stylesheet" href="/CSS/main.css"/>
</head>
<body>
<jsp:include page="../partials/navbar.jsp" />
<div class="container">
    <form action="/editPassword" method="POST" class="form-horizontal">
        <fieldset>

        <!-- Form Name -->
        <legend>Change your Password</legend>

        <input id="id" type="hidden" name="id" value="${user.id}">

        <!-- Password -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="password">New Password</label>
            <div class="col-md-4">
                <input id="password" name="password" type="password" placeholder="password" class="form-control input-md">
            </div>
        </div>

        <c:if test="${sessionScope.emptyPassword}">
            <div class="alert alert-danger">
                <strong>Hey, Please input a password!</strong>
            </div>
            <c:remove var="emptyPassword" scope="session"/>
        </c:if>

        <br>

        <!-- Confirm Password -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="confirm-password">Confirm Password</label>
            <div class="col-md-4">
                <input id="confirm-password" name="confirm-password" type="password" placeholder="confirm password" class="form-control input-md">
            </div>
        </div>

        <br>
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

    <!-- Button (Double) -->
        <div class="form-group">
            <div class="col-md-8">
                <button id="button1id" name="button1id" class="btn btn-success">Submit</button>
                <button id="button2id" name="button2id" class="btn btn-danger">Cancel</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
