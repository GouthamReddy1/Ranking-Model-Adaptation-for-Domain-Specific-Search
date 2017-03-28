<%@ page import="java.util.Date.*,java.text.DateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	 
<% 
	
	java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
	Statement st = null;
	ResultSet rs1=null;
	int n=0;
	try{
		
		//Class.forName("com.mysql.jdbc.Driver");	
		//	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ranking","root","root");
                Connection con=Databasecon.getconnection();
		st=con.createStatement();
		String sql1="select max(id) from reg";
		
		rs1=st.executeQuery(sql1);
		if(rs1.next())
		{
		if(rs1.getInt(1)==0)
		n=1;
		else
		n=rs1.getInt(1)+1;
		
		}
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
<script language="JavaScript">
function validation()
{
var a = document.form.id.value;
var b = document.form.name.value;
var b1 = document.form.pass.value;
var c = document.form.email.value;
var d= document.form.phone.value;

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
        <li><a href="user.jsp">Back</a></li>


       
      </ul>

</div>
<div style="position:absolute; left:750px; top:280px"><img src="images/reg1.png"> </div>

 <div style="position:absolute; left:240px; top:250px"> 
 
      <h1><font size="4">Registration</font></h1>
			<br>
			<p align="center">
			
         <%
                                                       String message=request.getParameter("Message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='red' size='+1'><blink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Registered Successfully !</blink></font>");
                                                       }
                                               %>   
											   </p>         
<fieldset style="border: 2px #FF9900 solid;">
      <legend><font color="#000099" size="4"><strong>Registration</strong></font></legend>

 
                  
<table width="366" align="center">
<form action="reginsert.jsp" method="post" name="form" onsubmit="return validation();">


<tr>
<td width="101" height="46" class="paragraping"><font size="3">Id</font></td>
<td width="172" class="id"><input type="text"  name="id" value="<%=n%>" ></td>
</tr> 
<tr>
<td width="101" height="46" class="paragraping"><font size="3">UserName</font></td>
<td width="172" class="name"><input type="text"  name="name"></td>
</tr>
<tr>
<tr>
<td width="101" height="46" class="paragraping"><font size="3">Password</font></td>
<td width="172" class="name"><input type="password"  name="pass"></td>
</tr>
<tr>
            <td width="101" height="46" class="paragraping"><font size="3">EmailId</font></td>
<td width="172" class="email"><input type="text"  name="email"></td>
</tr>
<tr>
            <td width="101" height="46" class="paragraping"><font size="3">PhoneNo</font></td>
<td width="172" class="phone"><input type="text"  name="phone"></td>
</tr>
<tr>
<td></td>
<td><%=strDateNew1%></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="B1" class="button2" value="Register">
<input type="reset" name="reset" class="button2" value="Clear"></td>
</tr>
</form>
<%
	}
	catch(Exception e1){
		out.println(e1.getMessage());
	}
%>
</table> 
</fieldset>
  </div>
   </div>                                
                     
       <br><br>

<!--FOOTER--> 

  <div id="footer">
    <div class="clsFooter_left">
      <div class="clsFooter_right">
        <div class="clsFooter_center">
          <ul class="clsfooternavigation clsborder">
           
           
			
			
          </ul>
          <p align="center"></p>
        </div>
      </div>
    </div>
  </div>
<!--END OF FOOTER--> 
</div>
</body>
</html>
