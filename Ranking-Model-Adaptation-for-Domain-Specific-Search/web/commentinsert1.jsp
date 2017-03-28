
<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
String feedback = (String)session.getAttribute("a");
String rate = (String)session.getAttribute("b");
Connection con1=null;
Statement st1 = null;
ResultSet rs1 = null;
int hit=0;
try{
	//Class.forName("com.mysql.jdbc.Driver");	
	//con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
        con1=Databasecon.getconnection();
	st1=con1.createStatement();
	rs1 = st1.executeQuery("select * from cmtcount where type='"+feedback+"' and rate='"+rate+"'");
	if(!rs1.next())
		{
		
		response.sendRedirect("insertcount.jsp");
	
		}
	else	
		response.sendRedirect("updatecount.jsp");

	
}
catch(Exception e2){
		out.println(e2.getMessage());
	}
%>