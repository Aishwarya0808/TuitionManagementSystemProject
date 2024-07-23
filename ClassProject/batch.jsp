<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>After Login page</title>
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
     <link rel="stylesheet" href="css/attendence-style.css">
     <style type="text/css">
     
    body
    {
    /* background-image: url(attend-bg.png);
     background-size: cover;
     backdrop-filter:blur(8px) ;*/
     background-color:#CCEEFF ;
    
     }

     </style>
     
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
                        
                         <li><a href="batch.jsp">Course</a></li>
                        
                    </ul>
               </div>

          </div>
     </section> 

     <!--Course-->
     <center>
     <h1>Course Details</h1>
     <table  border="0" style="text-align: center;" width="400px">
     <form>
     <tr>
          <td><h4>Select Course:</h4></td>
          <td>
          <select id="course" name="course" style="width: 250px; height: 30px;">
          <option>Select Course</option>
          <option value="C language">C language</option>
          <option value="C++">C++</option>
          <option value="Data Structure">Data Structure</option>
          <option value="Advanced Java">Advanced Java</option>
          <option value="Full Stack Developer">Full Stack Developer</option>
          </select>
          </td>
    </tr>
    <tr height=30>
          <td></td>
          <td></td>
     </tr>
       <tr>
          <td colspan="2"><input type="submit" value="View" name="btn"></td>
     </tr>

   </form>
</table><br><br>
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
          PreparedStatement psmt = con.prepareStatement("select * from course_info where Course_Name=?");
          String fname=request.getParameter("course");
          psmt.setString(1,fname);
          int count=0;
          ResultSet rs=psmt.executeQuery();
          while(rs.next())
               {
                    count++;
                    String cname=rs.getString(1);
                    String cduration=rs.getString(2);
                    String fees=rs.getString(3);
                    String filename=rs.getString(4);
                    

                    out.println("<center><table border=1 style=text-align:center width=500><tr><td>Course Name</td><td>Course Duration </td><td>Course Fees </td> <td> Syllabus  </td></tr>");
                    out.println("<tr><td>"+cname+"</td><td>"+cduration+"</td><td>"+fees+"</td>");
                    out.println("<td><a href = "+filename+">Syllabus </a></td></tr></center>");
               }
               if(count==0)
               {
                    out.println("<head><script> alert ('No student name found');</script> </head>");
               }
     }

      
    catch(Exception e)
    {
       out.println("error"+e);  
    }
 }
%>

