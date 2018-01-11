<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="collapse navbar-collapse">
            <div class="navbar-header">
                <a class="navbar-brand" href="/ads/index">DessertLister</a>
                    <c:if test="${sessionScope.user != null}">
                        <a class="navbar-brand" href="/profile">Welcome, ${sessionScope.user.username}!</a>
                            <a class="navbar-brand" href="/ads/create">Create a Dessert</a>

                    </c:if>
                    <c:if test="${sessionScope.user == null}">
                                <a class="navbar-brand" href="/register">Register</a>
                    </c:if>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${sessionScope.user == null}">
                            <li><a href="/login">Login</a></li>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                            <li><a href="/ads/delete">end it all</a></li>
                            <li><a href="/">Edit your Profile</a></li>
                            <li><a href="/logout">Logout</a></li>
                </c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
