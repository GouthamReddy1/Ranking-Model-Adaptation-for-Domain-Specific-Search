<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@ page import="java.sql.*,databaseconnection.*"%>


<html>
<head>
</head>
<body>
<%

ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery");
		String paramname=null;
		String file=null;
		String domain=null,subdomain=null,title=null,types=null,image=null,descrip=null;
		
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
 
		File file1 = null;
			
		
		try {
			
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				if(paramname.equalsIgnoreCase("domain"))
				{
					domain=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("subdomain"))
				{
					subdomain=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("title"))
				{
					title=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("types"))
				{
					types=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("image"))
				{
					image=multi.getParameter(paramname);
				}
				
				if(paramname.equalsIgnoreCase("descrip"))
				{
					descrip=multi.getParameter(paramname);
				}
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			image = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+image);
			file1 = new File(fPath);
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            //name=dirName+"\\Gallery\\"+image;
			int count=0;
			
			
	 
			
			
			//Class.forName("com.mysql.jdbc.Driver");	
			//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root"); 
                        Connection con=Databasecon.getconnection();
			PreparedStatement ps=con.prepareStatement("INSERT INTO upload VALUES(?,?,?,?,?,?,?)");
				ps.setString(1,image);
				ps.setString(2,domain);
				ps.setString(3,subdomain);
               	ps.setString(4,title);
				ps.setString(5,types);	
       			ps.setString(6,descrip);
				ps.setInt(7,count);
       
			    				
				
       if(f == 0)
			ps.setObject(1,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(1,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				response.sendRedirect("adminpage.jsp?Message=success");
			}
			else
			{
				response.sendRedirect("adminpage.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
	
 %>
</body>
</html>