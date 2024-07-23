<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Attendence Allocation</title>
</head>
<body>
<center>
<h1>Attendence Allocation</h1>
<table border="1" height=350 width="500">
<tr>
     <td>
<table  border="0" height=350 width="500" style="text-align: center;">
<form>
     <tr>
          <td><h3>Name:</h3></td>
          <td><input type="text" name="n1" style="width:220px"></td>
     </tr>
     <tr>
          <td><h3>Date:</h3></td>
          <td><input type="date" name="d1" style="width:220px"></td>
     </tr>
     <tr>
          <td><h3>Status:</h3></td>
          <td>
          <select id="s1" name="s1" style="width: 220px;">
          <option value="Absent">Absent</option>
          <option value="Present">Present</option>
          </select>
          </td>
    </tr>
     <tr>
          <td><input type="submit" value="submit" name="btn"></td>
     </tr>

</form>
</table></td>
</tr></table></center>
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
       PreparedStatement psmt = con.prepareStatement("insert into attendance_info values(?,?,?)");
       psmt.setString(1,request.getParameter("n1"));
       psmt.setString(2,request.getParameter("d1"));
       psmt.setString(3,request.getParameter("s1"));
      
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
