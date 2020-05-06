<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ page import="com.Appointment"  %>   
    
    
     <%-- <%
if (request.getParameter("date") != null)
{
session.setAttribute("title", request.getParameter("title"));
session.setAttribute("fname", request.getParameter("fname"));
session.setAttribute("lname", request.getParameter("lname"));
session.setAttribute("phone", request.getParameter("phone"));
session.setAttribute("email", request.getParameter("email"));
session.setAttribute("date", request.getParameter("date"));
session.setAttribute("aCatergory", request.getParameter("aCatergory"));
session.setAttribute("dCatergory", request.getParameter("dCatergory"));
session.setAttribute("dName", request.getParameter("dName"));
}
    
%>   --%>



<%


session.setAttribute("statusMsg", "");
System.out.println("Trying to process.............");


if (request.getParameter("date") != null)
{
Appointment appObj = new Appointment();
String stsMsg = "";
//Insert--------------------------
if (request.getParameter("hidDateSave") == "")
{
stsMsg = appObj.insertAppointment(request.getParameter("title"),
request.getParameter("fname"),
request.getParameter("lname"),
request.getParameter("phone"),
request.getParameter("email"),
request.getParameter("date"),
request.getParameter("aCatergory"),
request.getParameter("dCatergory"),
request.getParameter("dName"));
}
else//Update----------------------
{
stsMsg = appObj.updateAppointment(request.getParameter("hidDateSave"),
request.getParameter("title"),
request.getParameter("fname"),
request.getParameter("lname"),
request.getParameter("phone"),
request.getParameter("email"),
request.getParameter("date"),
request.getParameter("aCatergory"),
request.getParameter("dCatergory"),
request.getParameter("dName"));
}
session.setAttribute("statusMsg", stsMsg);
}
//Delete-----------------------------
if (request.getParameter("hiddateDelete") != null)
{
	Appointment appObj = new Appointment();
String stsMsg =
itemObj.deleteItem(request.getParameter("hidDateDelete"));
session.setAttribute("statusMsg", stsMsg);
}


%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/items.js"></script>
<meta charset="ISO-8859-1">





</head>
<body>


<div class="container">
<div class="row">
<div class="col-6">

<h1>Appointment Management v9</h1>
<form id="formApp" name="formApp" method="post" action="Appointments.jsp">
Title: <input id="title" name="title" type="text" class="form-control form-control-sm">
<br> 
First Name: <input id="fname" name="fname" type="text" class="form-control form-control-sm">
<br> 
Last Name: <input id="lname" name="lname" type="text" class="form-control form-control-sm">
<br> 
Phone Number: <input id="phone" name="phone" type="text" class="form-control form-control-sm">
<br>
<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
<input type="hidden" id="hidDateSave" name="hidDateSave" value="">
</form>


<div id="alertSuccess" class="alert alert-success">

  <%
  out.print(session.getAttribute("statusMsg"));
  
  %>


</div>

<div id="alertError" class="alert alert-danger"></div>
  
   <br>
   
   <%
   
      Appointment appobj = new Appointment();
      out.print(appObj.readAppointment());
   %>
   
   
   </div>
   </div>
   </div>


<%-- <br>

  
<table border="1">
<tr>
<th>Title</th>
<th>First Name</th>
<th>Last Name</th>
<th>Phone</th>
<th>Email</th>
<th>Date</th>
<th>aCatergory</th>
<th>dCatergory</th>
<th>dName</th>
<th>Remove</th>
</tr>
<tr>
<td><%out.print(session.getAttribute("title")); %></td>
<td><%out.print(session.getAttribute("fname")); %></td>
<td><%out.print(session.getAttribute("lname")); %></td>
<td><%out.print(session.getAttribute("phone")); %></td>
<td><%out.print(session.getAttribute("email")); %></td>
<td><%out.print(session.getAttribute("date")); %></td>
<td><%out.print(session.getAttribute("aCatergory")); %></td>
<td><%out.print(session.getAttribute("dCatergory")); %></td>
<td><%out.print(session.getAttribute("dName")); %></td>
<td><input name="btnUpdate" type="button" value="Update"></td>
<td><input name="btnRemove" type="button" value="Remove"></td>
</tr>
</table>  
 --%>









</body>
</html>