<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

</script>
</head>

<body>

<%



ResultSet rs=null;
PreparedStatement psmt1=null;
String feedback = (String)session.getAttribute("a");
String rate = (String)session.getAttribute("b");
		
int b=1;
try{

	//Class.forName("com.mysql.jdbc.Driver");	
	//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
	Connection con=Databasecon.getconnection();
	psmt1=con.prepareStatement("insert into cmtcount(type,rate,count) values(?,?,?)");
	psmt1.setString(1,feedback);
	psmt1.setString(2,rate);
	psmt1.setInt(3,b);
	
	


int s = psmt1.executeUpdate();
response.sendRedirect("comments.jsp?Message=success");

con.close();
psmt1.close();

}catch(Exception ex){

out.println("Error in connection : "+ex);

}

%>

</body>
</html>