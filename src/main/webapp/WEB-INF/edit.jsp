<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Person</title>
</head>
<body>
<h1>Edit Person</h1>
<form method="post" action="persons">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${person.id}">
    Name: <input type="text" name="name" value="${person.name}"><br>
    Email: <input type="text" name="email" value="${person.email}"><br>
    <input type="submit" value="Update">
</form>
</body>
</html>