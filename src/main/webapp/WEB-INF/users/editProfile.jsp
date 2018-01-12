<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Profile</title>
</head>
<body>
<form action="/editProfile" method="POST" class="form-horizontal">
    <fieldset>

        <!-- Form Name -->
        <legend>Edit Profile</legend>

        <input id="id" type="hidden" name="id" value="${user.id}">
        <!-- Username -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="username">Username</label>
            <div class="col-md-4">
                <input id="username" name="username" type="text" placeholder="username" class="form-control input-md" value="${user.username}">
            </div>
        </div>

        <br>

        <!-- Email -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="email">Email</label>
            <div class="col-md-4">
                <input id="email" name="email" type="text" placeholder="email" class="form-control input-md" value="${user.email}">
            </div>
        </div>

        <br>

        <!-- Upload Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="upload-button">Upload</label>
            <div class="col-md-4">
                <input id="upload-button" name="upload-button" class="input-file" type="file">
            </div>
        </div>

        <br>

        <!-- Button (Double) -->
        <div class="form-group">
            <div class="col-md-8">
                <button id="button1id" name="button1id" class="btn btn-success">Submit</button>
                <button id="button2id" name="button2id" class="btn btn-danger">Cancel</button>
            </div>
        </div>

    </fieldset>
</form>



</body>
</html>
