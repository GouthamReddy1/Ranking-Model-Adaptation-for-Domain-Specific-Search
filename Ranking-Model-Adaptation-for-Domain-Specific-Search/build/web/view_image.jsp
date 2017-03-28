<%@page import="databaseconnection.Databasecon"%>
`<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>

<% Blob image = null;

Connection con = null;

byte[ ] imgData = null ;

Statement stmt = null;

ResultSet rs = null;
String d=request.getQueryString();

try {

//Class.forName("com.mysql.jdbc.Driver");

//con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
con=Databasecon.getconnection();
stmt = con.createStatement();

rs = stmt.executeQuery("select * from upload where types='"+d+"'");

if (rs.next()) {

image = rs.getBlob(1);
System.out.println(image);
imgData = image.getBytes(1,(int)image.length());

} else {

out.println("Display Blob Example");

out.println("image not found for given product_name");

return;

}

// display the image

response.setContentType("image/gif");

OutputStream o = response.getOutputStream();

o.write(imgData);

o.flush();

o.close();

} catch (Exception e) {

out.println("Unable To Display image");

out.println("Image Display Error=" + e.getMessage());

return;

} finally {

try {

rs.close();

stmt.close();

con.close();

} catch (SQLException e) {

e.printStackTrace();

}

}

%> 