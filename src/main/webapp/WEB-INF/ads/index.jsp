<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Desserts" />
    </jsp:include>
    <link rel="stylesheet" href="/CSS/main.css"/>
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
        <a href="/ads/view?id=${ad.id}"><h2>${ad.title}</h2></a>
        <p>${ad.description}</p>
        <h6>${ad.category}</h6>
    </c:forEach>
    </div>
</div>
<script src="https://static.filestackapi.com/v3/filestack.js"></script>
<script type="text/javascript">
    var fsClient = filestack.init('AwjEmOSsTKuJMBQBVgE7fz');
    function openPicker() {
        fsClient.pick({
            fromSources:["local_file_system","imagesearch","facebook","instagram","dropbox"],
            accept:["image/*"]
        }).then(function(response) {
            // declare this function to handle response
            handleFilestack(response);
        });
    }
</script>
</body>
</html>
