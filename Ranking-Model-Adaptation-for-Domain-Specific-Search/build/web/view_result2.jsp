
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>


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
<script language="JavaScript">
function validation()
{
var a = document.form.id.value;
var b = document.form.name.value;
var c = document.form.pass.value;
var d = document.form.email.value;
var e= document.form.phone.value;

if(a=="")
{
alert("Enter Your Id");
document.form.id.focus();
return false;
}
if(b=="")
{
alert("Enter the Name");
document.form.name.focus();
return false;
}
if(b1=="")
{
alert("Enter the Password");
document.form.pass.focus();
return false;
}
if(c=="")
{
alert("Enter the emailid");
document.form.email.focus();
return false;
}
if (c.indexOf("@", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.form.email.focus();
return false;
}
if (c.indexOf(".", 0) < 0)
{
alert("Please enter a valid e-mail address.");
document.form.email.focus();
return false;
}	
if(d=="")
{
alert("Enter the phoneno");
document.form.phone.focus();
return false;
}
if(isNaN(d))
    {
        alert("Please enter the Correct Phone number");
			document.form.phone.focus();
        return false;
    }
if(e=="")
{
alert("Enter the designation");
document.form.designation.focus();
return false;
}
}
</script>
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
        <li><a href="index.html">HomePage</a></li>
        <li><a href="admin.jsp">Adminlogin</a></li>
        <li><a href="user.jsp">UserLogin</a></li>
        <li><a href="register.jsp">Registration</a></li>

        <li><a href="userpage.jsp">DomainSearch</a> 
        <li><a href="logout.jsp">Logout</a>
      </ul>

</div>

 <div style="position:absolute; left:240px; top:280px"> 
  <h1><font size="5">Searching</font></h1>
  <br><br><br>
<table>
 <table align="center">
 <%
 
	String a=(String)session.getAttribute("a");
 %>

    
	<tr></tr>
	<tr></tr>    
	<tr></tr>
	<form name="f" action="searchresult.jsp">
	<%
	Connection con = null;
   Statement st=null;
    ResultSet rs1=null;
	
String tit = null,typ = null,image=null,des=null;
	
	try{
		con=Databasecon.getconnection();
		st = con.createStatement();
		
		String sql="select * from upload where types='"+a+"'";
		rs1=st.executeQuery(sql);
		while(rs1.next())
		{
		des=rs1.getString("descrip");
		
		
		%>
		
		<tr>
		<td><font size="+2"><%=a%></font></td>
		</tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr>
	
		</tr>
		
		<tr>

		<td><img src="view_image.jsp?<%=a%>" width="100" height="100"></td><td><font size="4" face="Times New Roman, Times, serif"><%=des%></font></td>
		</tr>
		<%
		
		}
		}
		catch(Exception e1)
		{
		out.println(e1.getMessage());
		}
		
	%>
	
	
	
	</form>
	
	
	
	</table>

</table>
<br><br><br><br>
      <p><img src="images/comment.png" height="60" width="100"></p>
<div style="position:absolute; left:100px; top:350px"> <p><font size="4"><strong><blink><a href="comments.jsp">Post Your comments</a><blink></strong></font></p></div>
 </div>
   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>
</body>
</html>
