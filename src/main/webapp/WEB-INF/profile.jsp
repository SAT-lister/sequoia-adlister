<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% List ads = (List)session.getAttribute("ads");
    request.setAttribute("ads",ads);%>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="stylesheet" href="/CSS/main.css"/>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h3>Your current email is: ${sessionScope.user.email}</h3>
        <a href="/editProfile?id=${user.id}">Edit Your Profile</a>
        <h2>Here are your current ads.</h2>
        <c:forEach var="ad" items="${ads}">
            <br>
            <td>Ad Title: ${ad.title}</td></br>
            <td>Ad Description: ${ad.description}</td></br>
            <td>Ad Categories: ${ad.category}</td></br>
            </tr>
        </c:forEach>

        
    </div>
</body>
</html>
