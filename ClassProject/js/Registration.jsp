<%@page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Registration</title>
</head>
<body>
<center>
		<h1>Registration Form</h1>
	<form>
	<table cellpadding="10" width="500" height="200" bgcolor="fffffff">
	<tr>
		<td align="center"><input type="number" name="n1" placeholder="Mobile number" required></td>
	</tr>

	<tr>
		<td align="center"><input type="Email" name="n2" placeholder="Enter the Email" required></td>
	</tr>

	<tr>
		<td align="center"><input type="password"name="n3" placeholder="Enter the Password" required></td>
	</tr>

	<tr>
	<td align="center">
	<input type="submit" value="Create Account" name = btn>
	</td>
	</tr>
	</table><br><br>
	</form>
</center>
</body>
</html>
<%
String a = request.getParameter("btn");
if(a!=null)
{
	try
	{
       Class.forName("com.mysql.jdbc.Driver");  
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/classproject_db","root","");
	   PreparedStatement psmt = con.prepareStatement("insert into student_regform values(?,?,?)");
	   psmt.setInt(1,Integer.parseInt(request.getParameter("n1")));
	   psmt.setString(2,request.getParameter("n2"));
	   psmt.setString(3,request.getParameter("n3"));
	 
	   int cnt = psmt.executeUpdate();
	   if(cnt>=1)
	   {
	   	 out.println("<script> alert ('Record Inserted Successfully'); </script>");
	   }
	   else 
	   {
	   	 out.println("<script> alert ('Record not Inserted Successfully'); </script>");
	   }
	}
	catch(Exception e)
	{
       out.println("error"+e);  
	}
 }
%>