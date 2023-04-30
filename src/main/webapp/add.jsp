<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add New Movie</title>
</head>
<body>
<h1>Add New Movie</h1>
<form method="post" action="add.jsp">
  <label>Title:</label>
  <input type="text" name="title" required>
  <br>
  <label>Director:</label>
  <input type="text" name="director" required>
  <br>
  <label>Release Date:</label>

  <input type="date" name="release_date" required>
  <br>
  <label>Rating:</label>
  <input type="number" name="rating" step="0.1" min="0" max="10" required>
  <br>
  <label>Description:</label>
  <textarea name="description"></textarea>
  <br>
  <input type="submit" value="Add Movie">
</form>
<a href="index.jsp">Back to List of Movies</a>

</body>
</html>