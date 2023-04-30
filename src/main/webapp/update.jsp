<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Movie</title>
</head>
<body>
<h1>Edit Movie</h1>
<form method="post" action="update.jsp">
  <%
    int id = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "password");
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM movies WHERE id = ?");
    stmt.setInt(1, id);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
      String title = rs.getString("title");
      String director = rs.getString("director");
      Date releaseDate = rs.getDate("release_date");
      double rating = rs.getDouble("rating");
      String description = rs.getString("description");
      PrintWriter pw = response.getWriter();

      pw.println("<input type=\"hidden\" name=\"id\" value=\"" + id + "\">");
      pw.println("<label>Title:</label>");
      pw.println("<input type=\"text\" name=\"title\" value=\"" + title + "\" required>");
      pw.println("<br>");
      pw.println("<label>Director:</label>");
      pw.println("<input type=\"text\" name=\"director\" value=\"" + director + "\" required>");
      pw.println("<br>");
      pw.println("<label>Release Date:</label>");
      pw.println("<input type=\"date\" name=\"release_date\" value=\"" + releaseDate + "\" required>");
      pw.println("<br>");
      pw.println("<label>Rating:</label>");
      pw.println("<input type=\"number\" name=\"rating\" step=\"0.1\" min=\"0\" max=\"10\" value=\"" + rating + "\" required>");
      pw.println("<br>");
      pw.println("<label>Description:</label>");
      pw.println("<textarea name=\"description\">" + description + "</textarea>");
      pw.println("<br>");
      pw.println("<input type=\"submit\" value=\"Update Movie\">");
    }

    rs.close();
    stmt.close();
    conn.close();
  %>
</form>
<a href="index.jsp">Back to List of Movies</a>
</body>
</html>
