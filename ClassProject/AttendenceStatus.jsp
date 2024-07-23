<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>Attendence Status</title>
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
     /*background-image: url(attend-bg.png);
     background-size: cover;
     backdrop-filter:blur(8px) ;*/
     background-color: #B2D3C2;
    
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
                         <li><a href="AttendenceStatus.jsp">Attendence</a></li>
                    </ul>
               </div>

          </div>
     </section> 

     <!-- Course-->
     <div class="bg-image">
     <center>
     <h1>Attendence</h1><br>
     <table  border="0" style="text-align: center;" width="400px"; >
     <form>
     <tr>
          <td><h4><b>Enter Full Name:</b></h4></td>
         
          <td><%
                String nm = (String)session.getValue("fullname");
                out.println("<input type=text name=n1 value="+nm+" style=width:220px  readonly>");
                %>
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
     </table>
   
     </center>
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
          PreparedStatement psmt = con.prepareStatement("select * from attendance_info where Name=?");
          String fname=request.getParameter("n1");
          psmt.setString(1,fname);
          int count=0;
          ResultSet rs=psmt.executeQuery();
          while(rs.next())
               {
                    count++;
                    String n=rs.getString(1);
                    String date=rs.getString(2);
                    String status=rs.getString(3);
                    out.println("<center><table border=1 style=text-align:center width=500><tr><td>Name</td><td>Date</td><td>Status</td></tr>");
                    out.println("<tr><td>"+n+"</td><td>"+date+"</td><td>"+status+"</td></tr></center><br>");
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