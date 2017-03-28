<%@ page import="java.sql.*" import="databaseconnection.*"%>






<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Ranking Model Adaptation for Domain-Specific Search</title>
<link href="css/common.css" rel="stylesheet" type="text/css" />
<style type="text/css">

.sidebarmenu ul{
margin: 0;
padding: 0;
list-style-type: none;
font: bold 13px Verdana;
width: 180px; /* Main Menu Item widths */
border-bottom: 1px solid #ccc;
}
 
.sidebarmenu ul li{
position: relative;
}

/* Top level menu links style */
.sidebarmenu ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
color: white;
text-decoration: none;
padding: 6px;
border-bottom: 1px solid #778;
border-right: 1px solid #778;
}

.sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
background-color: #FFAB21; /*background of tabs (default state)*/
}

.sidebarmenu ul li a:visited{
color: white;
}

.sidebarmenu ul li a:hover{
background-color: black;
}

/*Sub level menu items */
.sidebarmenu ul li ul{
position: absolute;
width: 170px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
}

.sidebarmenu a.subfolderstyle{
background: url(right.gif) no-repeat 97% 50%;
}

 
/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

</style>

</head>
<body>
<div id="Container">
<div><img src="images/bb.jpeg" width="1142"></div>

<div style="position:absolute; left:30px; top:20px"><img src="images/1 copy.png" height="150"> </div>
<div style="position:absolute; left:750px; top:350px"><img src="images/5.jpeg" > </div>

<div style="position:absolute; left:250px; top:60px"><font size="6">Ranking Model Adaptation for Domain-Specific Search</font></div>
 <div id="submenu">
    <div class="clsSubmenu_left">
      <div class="clsSubmenu_right">
        <div class="clsSubmenu_center">
          <ul class="clsClearfix">
           <li><a class="current" href="index.html">Homepage</a></li>
            <li><a href="admin.jsp">AdminLogin</a></li>
            <li><a href="user.jsp">UserLogin</a></li>
            <li><a href="adminpage.jsp">Back</a></li>
            <li><a href="#"></a></li>
            
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <!--CONTENT -->
  <div id="Content">
    <div class="sidebarmenu">
<ul id="sidebarmenu1">
             
         <li><a href="admin.jsp">AdminLogin</a></li>
        <li><a href="user.jsp">UserLogin</a></li>
        <li><a href="adminpage.jsp">Domain Upload</a></li>
		<li><a href="viewranking.jsp">ViewRanking</a></li>
        <li><a href="viewcomment.jsp">ViewUserComment</a></li>
		<li><a href="viewuserreg.jsp">ViewUserRegistration</a></li>
		<li><a href="viewgraph.jsp">ViewGraphRepresent</a></li>

      </ul>

</div>

 <div style="position:absolute; left:241px; top:284px; width: 411px; height: 305px;"> 
  <h1><font size="4">AdminViewRanking</font></h1>
  <br><br>
 <fieldset style="border: 2px #FF9900 solid;">
       <legend><font color="#000099" size="4"><strong>View</strong></font></legend>
<table width="346" height="256">
<% 

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;
	String domain=null,subdomain=null, title=null,types=null,count =null;
    String domain1 = (String)session.getAttribute("domain");
	String subdomain1 = (String)session.getAttribute("subdomain");
	String title1 = (String)session.getAttribute("title");
	String types1 = (String)session.getAttribute("types");

	try{
		//Class.forName("com.mysql.jdbc.Driver"); 
		//con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
                con=Databasecon.getconnection();
		st=con.createStatement();
		String sql="select * from upload where domain='"+domain1+"' and subdomain='"+subdomain1+"' and title='"+title1+"' and types='"+types1+"'";

		rs=st.executeQuery(sql);
			
		 while(rs.next())
		
       {
	          
			  domain=rs.getString(2);
	    	subdomain=rs.getString(3);
		   title=rs.getString(4);
		   types=rs.getString(5);
		   count=rs.getString(7);
	
		   
		 
%>
  <tr> 
          <td width="194" height="37"><font size="3">DomainName</font></td>
    <td width="140"><font size="3">  <%=domain%></font> </td>
	</tr>
	<tr>
	      <td height="40"><font size="3">SubDomain</font></td>
	<td><font size="3"> <%=subdomain%></font> </td>
	</tr>
	<tr>
	      <td height="45"><font size="3">Title</font></td>
    <td><font size="3"> <%=title%> </font></td>
		</tr>
		<tr>
			
          <td height="37"><font size="3">Types</font></td>
	<td><font size="3"> <%=types%> </font></td>
	</tr>
	<tr>
	      <td height="83"><font size="3">People Views</font></td>
	<td bgcolor="#FF9900"> <font size="3"><%=count%>&nbsp;&nbsp;&nbsp;&nbsp;Views</font> </td>
</tr>
    
  

  <%
	   }
	  
	 }
	   catch(Exception e2)
	   {
	     out.println(e2.getMessage());
	   }
	   
	    
%>
</table>
    </fieldset>          
 </div>
   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>
</body>
</html>
