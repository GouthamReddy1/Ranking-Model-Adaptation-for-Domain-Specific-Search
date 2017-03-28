<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%@ page import="java.sql.*,databaseconnection.*"%>
<%
				
				

ResultSet rs=null;
try
{
//Class.forName("com.mysql.jdbc.Driver");

//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
    Connection con=Databasecon.getconnection();
	Statement st = con.createStatement();	
	

	String qry="select * from upload where domain like '%"+domain+"%'";
		rs =st.executeQuery(qry);
		
		
%>


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

<div style="position:absolute; left:250px; top:60px"><font size="6">Ranking Model Adaptation for Domain-Specific Search</font></div>
 <div id="submenu">
    <div class="clsSubmenu_left">
      <div class="clsSubmenu_right">
        <div class="clsSubmenu_center">
          <ul class="clsClearfix">
            <li><a class="current" href="index.html">Homepage</a></li>
            <li><a href="admin.jsp">AdminLogin</a></li>
            <li><a href="user.jsp">UserLogin</a></li>
            <li><a href="#">Solutions</a></li>
            <li><a href="#">Contacts</a></li>
            
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  <!--CONTENT -->
  <div id="Content">
    <div class="sidebarmenu">
<ul id="sidebarmenu1">
        <li><a href="view.jsp">view</a></li>
        <li><a href="#">Item 2</a></li>
        <li><a href="#">Item 2</a></li>
        <li><a href="#">Item 2</a></li>

        <li><a href="#">Folder 1</a> 
      </ul>

</div>

 <div style="position:absolute; left:240px; top:280px"> 
  <h1><font size="4">Search Engine</font></h1>
  <br>
<table>
<form name="form" action="search.jsp" method="post" onSubmit="return validation()">

<tr>
<td width="172" class="id"><input type="text"  name="id" size="65"></td>

<td><input type="submit" name="B1" class="button2" value="Search"></td>
</tr> 
</form>
</table>
<%
while(rs.next())
	     {
		 
		
		 
		 
			String s=rs.getString(2);
			}
			%>
				<%


	}
	catch(Exception e2){
		out.println(e2.getMessage());
	}
%>

  
 </div>
   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>
</body>
</html>
