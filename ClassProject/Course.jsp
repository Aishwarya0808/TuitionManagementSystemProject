<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
</head>
<body>
<center>
	<h1>Course Details</h1>
	<table border="1" height=500 width="500">
		<tr>
			<td>
<table cellpadding="10px" cellspacing="10" border="0">
	<form onsubmit="simple()">
	<tr>
		<td><h3>Select Course:</h3></td>
		<td>
			<select id="course" name="course" onchange="simple()" style="width: 250px;">
                <option>Select Course</option>
                <option value="C language">C language</option>
                <option value="C++">C++</option>
                <option value="Data Structure">Data Structure</option>
                <option value="Advanced Java">Advanced Java</option>
                <option value="Full Stack Developer">Full Stack Developer</option>
                </select>
        </td>
    </tr>
   
    <tr>
        <td><h3>Enter the Duration:</h3></td>
        <td><input type="text" name="duration"></td>
	</tr>
	<tr>
		<td><h3>Enter the Fees:</h3></td>
		<td><input type="text" name="fees"></td>
	</tr>
	<tr>
		<td><h3>Enter Syllabus File Name </h3></td>
		<td>
            <input type="text" name="fname">
        </td>
	</tr>
	<tr>
		<td><input type="submit" value="submit" name="btn" onclick="submit()"></td>
	</tr>

</form>
</table></td>
</tr></table>
</body>
</html>
<%
String a = request.getParameter("btn");
if(a!=null)
{
    try
    {
       Class.forName("com.mysql.jdbc.Driver");  
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/swayam","root","");
       PreparedStatement psmt = con.prepareStatement("insert into course_info values(?,?,?,?)");
       psmt.setString(1,request.getParameter("course"));
       psmt.setString(2,request.getParameter("duration"));
       psmt.setString(3,request.getParameter("fees"));
       psmt.setString(4,request.getParameter("fname"));
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