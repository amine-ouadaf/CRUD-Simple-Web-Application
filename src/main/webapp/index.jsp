<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Welcome to CRUD Application</title>
</head>
<body>
<h1>Welcome to CRUD Application</h1>
<p>Choose an action:</p>
<ul>
  <li><a href="${pageContext.request.contextPath}/persons">View Person List</a></li>
  <li><a href="${pageContext.request.contextPath}/persons?action=edit&id=1">Edit Person (ID 1)</a></li>
</ul>
</body>
</html>