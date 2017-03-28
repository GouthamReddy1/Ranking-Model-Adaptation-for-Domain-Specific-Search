<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@ page import="java.sql.*,databaseconnection.*"%>

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
var a = document.form.feedback.value;
var b = document.form.rate.value;
var c = document.form.comment.value;


if(a=="")
{
alert("Enter Your Feedback");
document.form.feedback.focus();
return false;
}
if(document.form.rate.selectedIndex==0)
{ 
alert("Please select ratings");
document.form.rate.focus();
return false;
}

if(c=="")
{
alert("Enter the Comment");
document.form.comment.focus();
return false;
}
}
</script>
</head>
<body>
<div id="Container">
<div><img src="images/bb.jpeg" width="1142"></div>
<div style="position:absolute; left:30px; top:20px"><img src="images/1 copy.png" height="150"> </div>
<div style="position:absolute; left:730px; top:320px"><img src="images/76.png"></div>


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
         <li><a href="index.html">HomePage</a></li>
        <li><a href="admin.jsp">Adminlogin</a></li>
        <li><a href="user.jsp">UserLogin</a></li>
        <li><a href="register.jsp">Registration</a></li>

        <li><a href="userpage.jsp">DomainSearch</a> 
        <li><a href="logout.jsp">Logout</a>
      </ul>

</div>

 <div style="position:absolute; left:240px; top:280px; width: 502px; height: 305px;"> 
 <h1><font size="5">Add Your Comments Here:</font></h1>
 <br><br>
 <p>  <%
                                                       String message=request.getParameter("Message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='red' size='3'><blink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Comments Posted Successfully !</blink></font>");
                                                       }
                                               %> 
											   </p>
      <table width="469" height="247" align="center">
        <form action="commentinsert.jsp" method="post" name="form" onSubmit="return validation();">
          <% 
	
	java.util.Date now = new java.util.Date();
	 String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	 SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
     String strDateNew1 = sdf1.format(now);
	 %>
          <tr> 
            <td  width="179" height="46" class="paragraping"><font size="3">Date</font></td>
            <td><%=strDateNew1%></td>
          </tr>
          <tr> 
            <td width="179" height="56" class="paragraping"><font size="3">Feedback 
              About</font></td>
            <td width="278" class="id"><input type="text"  name="feedback"></td>
          </tr>
		  <tr> 
            <td width="179" height="56" class="paragraping"><font size="3">Ratings
              </font></td>
            <td width="278" class="id"><select name="rate">
<option>--Select Rating--</option>
<option>Best</option>
<option>Good</option>
<option>Average</option>
<option>Bad</option>
<option>Worst</option>
</select></td>
          </tr>
          <tr> 
            <td width="179" height="84" class="paragraping"><font size="3">Comment</font></td>
            <td width="278" class="name"><textarea name="comment" rows="3" cols="24"></textarea></td>
          </tr>
          <tr> 
            <td height="49"></td>
            <td><input type="submit" name="B1" class="button2" value="Add"> </td>
          </tr>
        </form>
      </table>
      <br>
  
  <br><br></fieldset>
      </div>
   </div>                                
                     
       

<!--FOOTER--> 

<!--END OF FOOTER--> 
</div>
</body>
</html>
