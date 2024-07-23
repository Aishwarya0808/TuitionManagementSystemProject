<%@page import = "java.sql.*" %>

<%
try
{
     Class.forName("com.mysql.jdbc.Driver");  
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/swayam","root","");
     Statement smt=con.createStatement();
     ResultSet rs=smt.executeQuery("select * from feedback_info");
     out.println("<center><form><table><tr height=200><td><p style=font-size:30px;>View Feedback:</p></td><td><select style=width:250px;height:30px; name=sname>");
     
     while(rs.next())
     {
          String nm=rs.getString(1);
          out.println("<option>"+nm+"</option>");
     }
     out.println("</select></tr></table><table><tr><td><center><input type=submit name=btn value=view></table>");
     
     String a = request.getParameter("btn");
     if(a!=null)
     {
     
          PreparedStatement psmt1 = con.prepareStatement("select * from feedback_info where Name = ?");
          psmt1.setString(1,request.getParameter("sname"));
          ResultSet rs1 = psmt1.executeQuery();
          out.println("<table border=1 width=1200><center><tr><th>Name</th><th>Mail</th><th>Phone</th><th>User satisfy with our service? </th><th>Feedback</th></tr>");
          while(rs1.next())
          {
               String nm=rs1.getString(1);
               String mail=rs1.getString(2);
               String c=rs1.getString(3);
               String ph=rs1.getString(4);
               String service=rs1.getString(5);
               

               
               out.println("<tr><td>"+nm+"</td><td>"+mail+"</td><td>"+c+"</td><td>"+ph+"</td><td>"+service+"</td></tr>");
            }
     }
            

     }
catch(Exception e)
{
 out.println("error"+e);
}

%>
