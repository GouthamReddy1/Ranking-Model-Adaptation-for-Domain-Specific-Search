<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>

<%

		String feedback = (String)session.getAttribute("a");
		String rate = (String)session.getAttribute("b");
		Statement st = null;
		ResultSet rs1=null;
	
	try{
		
		//Class.forName("com.mysql.jdbc.Driver");	
		//	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
                        Connection con=Databasecon.getconnection();
                        st=con.createStatement();
			String sql1="select * from cmtcount where type='"+feedback+"' and rate='"+rate+"'";
			
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				int hit=0;
				hit=rs1.getInt(3)+1;
				
				try{
				//Class.forName("com.mysql.jdbc.Driver");	
				//Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
				Connection con2=Databasecon.getconnection();
                                    PreparedStatement ps=con.prepareStatement("Update cmtcount set count=? where type='"+feedback+"' and rate='"+rate+"'");
				ps.setInt(1,hit);
				int x=ps.executeUpdate();
				
				response.sendRedirect("comments.jsp");
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
