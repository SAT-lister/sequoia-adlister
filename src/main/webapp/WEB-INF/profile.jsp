<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h2>Here are your current ads.</h2>
        <c:forEach items="${ads}" var="ad">
            <tr>
                <td>Ad Title: <C:out value="${ad.title}"/></td>
                <td>Ad Description: <C:out value="${ad.description}"/></td>
                <td>Ad Categories: <C:out value="${ad.category}"/></td>
            </tr>
        </c:forEach>
    </div>
</body>
</html>
