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
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
        <h2>Here are your current ads.</h2>
        <c:forEach var="ad" items="${ads}">
            <br>
            <td>Ad Title: ${ad.title}</td></br>
            <td>Ad Description: ${ad.description}</td></br>
            <td>Ad Categories: ${ad.category}</td></br>
            </tr>
        </c:forEach>

        <form class="form-horizontal">
            <fieldset>

                <!-- Form Name -->
                <legend>Form Name</legend>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textinput">Text Input</label>
                    <div class="col-md-4">
                        <input id="textinput" name="textinput" type="text" placeholder="placeholder" class="form-control input-md">
                        <span class="help-block">help</span>
                    </div>
                </div>

                <!-- Textarea -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="textarea">Text Area</label>
                    <div class="col-md-4">
                        <textarea class="form-control" id="textarea" name="textarea">default text</textarea>
                    </div>
                </div>

                <!-- File Button -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="filebutton">File Button</label>
                    <div class="col-md-4">
                        <input id="filebutton" name="filebutton" class="input-file" type="file">
                    </div>
                </div>

                <!-- Button (Double) -->
                <div class="form-group">
                    <label class="col-md-4 control-label" for="button1id">Double Button</label>
                    <div class="col-md-8">
                        <button id="button1id" name="button1id" class="btn btn-success">Good Button</button>
                        <button id="button2id" name="button2id" class="btn btn-danger">Scary Button</button>
                    </div>
                </div>

            </fieldset>
        </form>

    </div>
</body>
</html>
