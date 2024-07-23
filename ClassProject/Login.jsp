<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login Form</title>
  <link rel="stylesheet" href="css/login-style.css">
  <script type="text/javascript">
    function simple()
    {
      var user=document.getElementById('n1').value;
      var pass=document.getElementById('p1').value;
      var select=document.getElementById('c1').value;
      if(user.length==0)
      {
        alert("Enter the Username");
      }
      else if(pass.length==0)
      {
        alert("Enter the Password");
      }
      else if(select.length==0)
      {
        alert("Please select the type");
      }
    }
  </script>
</head>
<body>
  <div class="container">
    <input type="checkbox" id="check">
    <div class="login form">
      <header>Login</header>
      <form action="#" onsubmit="simple()">
        <input type="text" placeholder="Enter your Username" id="n1" required name="username"> 

        <input type="password" placeholder="Enter your password" id="p1" required name="password">

        <p>Select login type</p>
            <select id="c1" name="course" required style="width: 365px; height: 30px;">
                <option value="">Select type</option>
                <option value="Student">Student</option>
                <option value="Admin">Admin</option>
            </select><br><br>

        <a href="#">Forgot password?</a>
        <input type="submit" class="button" value="Login" name="btn" onclick="simple()">

      </form>
    </div>
  </div>
</body>
</html>
<%
String a = request.getParameter("btn");
if(a!=null)
{
    try
    {
      int flag=0;
       Class.forName("com.mysql.jdbc.Driver");  
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/swayam","root","");
       String type=request.getParameter("course");
       if(type.equals("Student"))
       {
          Statement smt=con.createStatement();
          ResultSet rs=smt.executeQuery("select * from register_info");

          String user=request.getParameter("username");
          String pass=request.getParameter("password");
          
          while(rs.next())
          {

           if(user.equals(rs.getString(3))&&pass.equals(rs.getString(4))&&rs.getString(6).equals("Yes"))
             {
                flag=1;
                break;
             }
             else
             {
                flag=0;
             }
         }
         if(flag==1)
         {
              String fullname= rs.getString(1);
              String phone= rs.getString(2);
              session.putValue("fullname",fullname);
              session.putValue("phone",phone);
              out.println("<head><script>alert('login Successfully');</script></head>");
              response.sendRedirect("AfterLogin.jsp");
          } 
          else
        { 
          out.println("<head><script>alert('Login is not Successfully');</script></head>");  
       }
       }

       if(type.equals("Admin"))
       {
          String user=request.getParameter("username");
          String pass=request.getParameter("password");

          if(user.equals("Myadmin")&&pass.equals("India@11"))
             {
                out.println("<head><script>alert('Admin is login');</script></head>");
                response.sendRedirect("AfterAdminLogin.jsp");
             }
             else
             {
             out.println("<head><script>alert('Admin is not login');</script></head>");
            }
         }
      }  
    catch(Exception e)
    {
       out.println("error"+e);  
    }
 }
%>