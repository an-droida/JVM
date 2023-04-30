<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Delete Movie</title>
</head>
<body>
<h1>Delete Movie</h1>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  Class.forName("com.mysql.jdbc.Driver");
  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "password");
  PreparedStatement stmt = conn.prepareStatement("DELETE FROM movies WHERE id = ?");
  stmt.setInt(1, id);
  stmt.executeUpdate();
  stmt.close();
  conn.close();
%>
<p>The movie has been deleted.</p>
<a href="index.jsp">Back to List of Movies</a>

</body>
</html>
