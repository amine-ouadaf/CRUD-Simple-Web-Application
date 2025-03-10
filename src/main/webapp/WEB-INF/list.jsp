<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.example.crudwebapp.model.Person" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Person List</title>
</head>
<body>
<h1>Persons</h1>
<form method="post" action="persons">
    <input type="hidden" name="action" value="create">
    Name: <input type="text" name="name"><br>
    Email: <input type="text" name="email"><br>
    <input type="submit" value="Add Person">
</form>

<table border="1">
    <tr><th>ID</th><th>Name</th><th>Email</th><th>Actions</th></tr>
    <%
        List<Person> persons = (List<Person>) request.getAttribute("persons");
        if (persons != null) {
            for (Person person : persons) {
    %>
    <tr>
        <td><%= person.getId() %></td>
        <td><%= person.getName() %></td>
        <td><%= person.getEmail() %></td>
        <td>
            <a href="persons?action=edit&id=<%= person.getId() %>">Edit</a>
            <form method="post" action="persons" style="display:inline">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= person.getId() %>">
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>