<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Profile</title>
</head>
<body>
<form action="/editPassword" method="POST" class="form-horizontal">

    <fieldset>
        <legend>Change your password</legend>

        <input id="id" type="hidden" name="id" value="${user.id}">

        <!-- Password -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="password">Password</label>
            <div class="col-md-4">
                <input id="password" name="password" type="password" placeholder="password" class="form-control input-md">
            </div>
        </div>

        <br>

        <!-- Confirm Password -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="password-confirmation">Confirm Password</label>
            <div class="col-md-4">
                <input id="password-confirmation" name="password-confirmation" type="password" placeholder="confirm password" class="form-control input-md">
            </div>
        </div>

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
