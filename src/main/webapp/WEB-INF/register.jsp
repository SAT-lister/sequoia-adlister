<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>

    <script type="text/javascript">
        document.getElementById("username").value = getSavedValue("username");    // set the value to this input
        document.getElementById("email").value = getSavedValue("email");   // set the value to this input
        /* Here you can add more inputs to set value. if it's saved */

        //Save the value function - save it to localStorage as (ID, VALUE)
        function saveValue(e){
            var id = e.id;  // get the sender's id to save it .
            var val = e.value; // get the value.
            localStorage.setItem(id, val);// Every time user writing something, the localStorage's value will override .
        }

        //get the saved value function - return the value of "v" from localStorage.
        function getSavedValue  (v){
            if (localStorage.getItem(v) === null) {
                return " ";// You can change this to your defualt value.
            }
            return localStorage.getItem(v);
        }
    </script>

</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" onkeyup="saveValue(this);">
            </div>
            <c:if test="${sessionScope.existingUser != null}">
                <div class="alert alert-danger">
                    <strong>Bruh, That username already exists!</strong>
                </div>
            </c:if>
            <div class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="text" onkeyup="saveValue(this);">
            </div>
            <c:if test="${sessionScope.wrongEmail}">
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
                    <strong>Man, These passwords don't match!</strong>
                </div>
            </c:if>
            <input type="submit" class="btn btn-primary btn-block">
        </form>
    </div>


    <script src="../JavaScript/main.js"></script>

</body>
</html>
