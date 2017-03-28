

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
var a = document.form.domain.value;
var b = document.form.subdomain.value;
var c = document.form.title.value;
var d = document.form.types.value;
var e= document.form.image.value;
var f= document.form.descrip.value;

if(a=="")
{
alert("Enter The domain");
document.form.domain.focus();
return false;
}
if(b=="")
{
alert("Enter the subdomain");
document.form.subdomain.focus();
return false;
}
if(c=="")
{
alert("Enter the title");
document.form.title.focus();
return false;
}
if(d=="")
{
alert("Enter the types");
document.form.types.focus();
return false;
}
if(e=="")
{
alert("select the image");
document.form.image.focus();
return false;
}

if(f=="")
{
alert("Enter the descrip");
document.form.descrip.focus();
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
            <li><a href="#"></a></li>
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
                <li><a href="logout.jsp">Logout</a></li>

       
      </ul>

</div>
<div style="position:absolute; left:750px; top:320px"><img src="images/sss.png" height="250"> </div>

 <div style="position:absolute; left:240px; top:250px"> 
 
      <h1><font size="4">Domain Insertion</font></h1>
			<br>
			<p align="center">  <%
                                                       String message=request.getParameter("Message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='red' size='+1'><blink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Domain Inserted Successfully !</blink></font>");
                                                       }
                                               %> 
											   </p>
                     
<fieldset style="border: 2px #FF9900 solid;">
      <legend><font color="#000099" size="4"><strong>Upload</strong></font></legend>

 
                  
<table width="402" align="center">
<form action="adminpageinsert.jsp" enctype="multipart/form-data" method="post" name="form" onsubmit="return validation();">


<tr>
<td width="135" height="46" class="paragraping"><font size="3">Domain Name</font></td>
<td width="219" class="id"><input type="text"  name="domain" ></td>
</tr> 
<tr>
            <td width="135" height="46" class="paragraping"><font size="3">Sub Domain</font></td>
<td width="219" class="name"><input type="text"  name="subdomain"></td>
</tr>
<tr>
<tr>
<td width="135" height="46" class="paragraping"><font size="3">Title</font></td>
<td width="219" class="name"><input type="text"  name="title"></td>
</tr>
<tr>
<td width="135" height="46" class="paragraping"><font size="3">Types</font></td>
<td width="219" class="name"><input type="text"  name="types"></td>
</tr>
<tr>
<td width="135" height="46" class="paragraping"><font size="3">Image</font></td>
<td width="219" class="phone"><input type="file"  name="image"></td>
</tr>

<tr>
            <td width="135" height="46" class="paragraping"><font size="3">Descriptions</font></td>
<td width="219" class="email"><textarea rows="2" cols="20" name="descrip"></textarea></td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="B1" class="button2" value="Submit">
<input type="reset" name="reset" class="button2" value="Clear"></td>
</tr>
</form>

</table> 
</fieldset>
  </div>
   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>
</body>
</html>
