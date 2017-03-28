<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String a=request.getQueryString();
		session.setAttribute("a",a);
		Statement st = null;
		ResultSet rs1=null;
	
	try{
		
		//Class.forName("com.mysql.jdbc.Driver");	
		//	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
                        Connection con=Databasecon.getconnection();
                        st=con.createStatement();
			String sql1="select * from upload where types='"+a+"'";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				int hit=0;
				hit=rs1.getInt(7)+1;
				
				try{
				//Class.forName("com.mysql.jdbc.Driver");	
				//Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
                                    Connection con2=Databasecon.getconnection();
				PreparedStatement ps=con.prepareStatement("Update upload set count=? where types='"+a+"'");
				ps.setInt(1,hit);
				int x=ps.executeUpdate();
				
				
				response.sendRedirect("view_result2.jsp");
				}
				catch (Exception ex) 
				{
					out.println(ex.getMessage());
				}
			}	
	}
	catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		
	
 %>
