<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Movies</title>
</head>
<body>
<h1>List of Movies</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Director</th>
        <th>Release Date</th>
        <th>Rating</th>
        <th>Description</th>
        <th></th>
    </tr>

    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb", "root", "password");
        Statement stmt = conn.createStatement();


        ResultSet rs = stmt.executeQuery("SELECT * FROM movies");

        while (rs.next()) {
            int id = rs.getInt("id");
            String title = rs.getString("title");
            String director = rs.getString("director");
            Date releaseDate = rs.getDate("release_date");
            double rating = rs.getDouble("rating");
            String description = rs.getString("description");

            PrintWriter pw = response.getWriter();
            pw.println("<tr>");
            pw.println("<td>" + id + "</td>");
            pw.println("<td>" + title + "</td>");
            pw.println("<td>" + director + "</td>");
            pw.println("<td>" + releaseDate + "</td>");
            pw.println("<td>" + rating + "</td>");
            pw.println("<td>" + description + "</td>");
            pw.println("<td><a href=\"update.jsp?id=" + id + "\">Edit</a> | <a href=\"delete.jsp?id=" + id + "\">Delete</a></td>");
            pw.println("</tr>");
        }

        rs.close();
        stmt.close();
        conn.close();
    %>
</table>
<a href="add.jsp">Add New Movie</a>
</body>
</html>

<%--
USE moviedb;
CREATE TABLE movies (
                        id INT(11) NOT NULL AUTO_INCREMENT,
                        title VARCHAR(255) NOT NULL,
                        director VARCHAR(255) NOT NULL,
                        release_date DATE NOT NULL,
                        rating DECIMAL(3,1) NOT NULL,
                        description TEXT,
                        PRIMARY KEY (id)
);
--%>