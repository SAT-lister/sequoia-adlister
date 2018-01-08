<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Dessert" />
    </jsp:include>
    <link rel="stylesheet" href="/CSS/main.css"/>
</head>
<body>
 <jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="row">
    <div class="container md-col-6">
        <h1>Create a new Dessert</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <select id="category" name="categories" class="form-control" type="text">
                    <option value="cookies">Cookie</option>
                    <option value="cakes">Cake</option>
                    <option value="ice-cream">Ice Cream</option>
                    <option value="pie">Pie</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
        </div>
    </div>
    </div>
</body>
</html>
