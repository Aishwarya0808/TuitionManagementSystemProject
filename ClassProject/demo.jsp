<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>After Admin Login page</title>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=Edge">
     <meta name="description" content="">
     <meta name="keywords" content="">
     <meta name="author" content="">
     <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

     <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/font-awesome.min.css">
     <link rel="stylesheet" href="css/owl.carousel.css">
     <link rel="stylesheet" href="css/owl.theme.default.min.css">

     <!-- MAIN CSS -->
     <link rel="stylesheet" href="css/batch.css">

     
</head>
<body>
 <!-- MENU -->
     <section class="navbar custom-navbar navbar-fixed-top" role="navigation">
          <div class="container">

               <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                         <span class="icon icon-bar"></span>
                    </button>

                    <!-- lOGO TEXT HERE -->
                    <a href="#" class="navbar-brand">Swayam</a>
               </div>

               <!-- MENU LINKS -->
               <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-nav-first">
                         <li><a href="Course.jsp">Course</a></li>
                         <li><a href="login.html">Admission Status</a></li>
                         <li><a href="Attendenceallocation.jsp">Attendence</a></li>
                         <li><a href="feesstatus.jsp">Fees Status</a></li>
                         <li><a href="feedback.jsp">View Feedback</a></li>
                         <li><a href="index.html">Logout</a></li>
                    </ul>
               </div>

          </div>
     </section>
     
<%
try
{
     Class.forName("com.mysql.jdbc.Driver");  
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/swayam","root","");
     Statement smt=con.createStatement();
     ResultSet rs=smt.executeQuery("select * from admission_info");
     out.println("<form><table><tr><td>select the course</td><td><select name=sname>");
     while(rs.next())
     {
          String nm=rs.getString(1);

          out.println("<option value="+nm+">"+nm+"</option>");

     }
     out.println("</select></table></form>");
}
catch(Exception e)
{
 out.println("error"+e);
}

%>
    

</body>
</html>
