

<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
    <head>
	<title>Ranking Model Adaptation for Domain-Specific Search</title>
    </head>
    <body>
	<form>
	<% 
	
         String username=request.getParameter("username");
	String password=request.getParameter("password");
        System.out.println("administrator"+username+password);	
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select * from admin where username='"+username+"' AND password='"+password+"'";
	try
	{
	   con=Databasecon.getconnection();
	    st=con.createStatement();
	    rs=st.executeQuery(sql);
	    if(rs.next())
	     {
		session.setAttribute("username",username);
		 %>	
		<jsp:forward page="adminpage.jsp"/>
	    	<%
	             		    
	    }
	  out.println("Oop's! you are not Authenticated Person");
	}
	catch(SQLException e1)
	{
		
		System.out.println(e1);
	
	 }

	finally
	{
	     st.close();
	      con.close();
	}
            %>
             </form>
       </body> 	
</html>