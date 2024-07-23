<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <link rel="stylesheet" href="css/reg-style.css">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript">
    function simple()
    {
      var u=document.getElementById('user').value;
      var p=document.getElementById('pass').value;
      var cp=document.getElementById('cpass').value;
      var ph=document.getElementById('phone').value;
      var lowercount=0;
      var uppercount=0;
      var digitcount=0;
      var scount=0;
      var flag=false;
      for (var i=0;i<p.length;i++)
      {
        if(p[i]>='A' && p[i]<='Z')
            uppercount++;
        if(p[i]>='a' && p[i]<='z')
          lowercount++;
        if(p[i]>='0' && p[i]<='9')
          digitcount++;
        if(p[i]=='@'|| p[i]=='#' || p[i]=='$' || p[i]=='%' || p[i]=='&' || p[i]=='*')
          scount++
      }

      if(p.length==0||p.length>13||uppercount==0||lowercount==0||digitcount==0||scount==0)
      {
        alert("make a strong password");
        flag=true;
      }

      if(flag==false)
      {
      if(p!=cp)
      {
        alert("Password do not match");
      }
      else if(!((ph>'0' && ph<'9')&& ph.length==10))
      {
        alert("Enter valid Phone number");
      }
      
      }

    }
  </script>
  </head>
<body>
  <div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="#" >
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" placeholder="Enter your name" required name="fullname">
          </div>
          <div class="input-box">
            <span class="details">Username</span>
            <input type="text" placeholder="Enter your username" required id="user" name="username">
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="tel" id="phone" placeholder="Enter your number" required name="phone">
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" placeholder="Enter your password" required id="pass" name="passwords">
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" placeholder="Confirm your password" required id="cpass" name="confirmpass">
          </div>
        </div>
        <div class="button">
          <input type="submit" value="Register" name="btn" onsubmit="simple()">
        </div>
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
       Class.forName("com.mysql.jdbc.Driver");  
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/swayam","root","");
       PreparedStatement psmt = con.prepareStatement("insert into register_info values(?,?,?,?,?,?)");
       psmt.setString(1,request.getParameter("fullname"));
       psmt.setString(2,request.getParameter("phone"));
       psmt.setString(3,request.getParameter("username"));
       psmt.setString(4,request.getParameter("passwords"));
       psmt.setString(5,request.getParameter("confirmpass"));
       psmt.setString(6,"Yes");
       int cnt = psmt.executeUpdate();
       if(cnt>=1)
       {
         out.println("<script> alert ('Register Successfully'); </script>");
       }
       else 
       {
         out.println("<script> alert ('Register Unsuccessfully'); </script>");
       }
    }
    catch(Exception e)
    {
       out.println("error"+e);  
    }
 }
%>
