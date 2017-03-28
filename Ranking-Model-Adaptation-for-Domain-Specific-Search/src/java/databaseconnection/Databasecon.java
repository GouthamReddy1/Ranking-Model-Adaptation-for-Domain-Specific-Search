package databaseconnection;
import java.sql.*;

public class Databasecon
{
	static Connection con;
	public static Connection getconnection()
	{
 		
 			
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","rank","rank");
		}
		catch(Exception e)
		{
			//System.out.println("class error");
                    e.printStackTrace();
		}
		return con;
	}
	
}
