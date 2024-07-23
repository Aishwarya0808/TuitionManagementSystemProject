<%@page import = "java.sql.*" %>

<%
try
{
     Class.forName("com.mysql.jdbc.Driver");  
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/swayam","root","");
     Statement smt=con.createStatement();
     ResultSet rs=smt.executeQuery("select * from admission_info");
     out.println("<center><form><table><tr height=200><td><p style=font-size:30px;>Select The Name:</p></td><td><select style=width:250px;height:30px; name=sname>");
     
     while(rs.next())
     {
          String nm=rs.getString(1);
          out.println("<option>"+nm+"</option>");
     }
     out.println("</select></tr></table><table><tr><td><center><input type=submit name=btn value=view></table>");
     
     String a = request.getParameter("btn");
     if(a!=null)
     {
     
          PreparedStatement psmt1 = con.prepareStatement("select * from admission_info where Full_Name = ?");
          psmt1.setString(1,request.getParameter("sname"));

          String work = request.getParameter("sname");
          session.putValue("user1",work);

          ResultSet rs1 = psmt1.executeQuery();
          out.println("<table border=1 width=600><center><tr><th>Name</th><th>Phone</th><th>Course</th><th>Age</th><th>Gender</th><th>City</th><th>Status</th></tr>");
          while(rs1.next())
          {
               String nm=rs1.getString(1);
               String ph=rs1.getString(2);
               String c=rs1.getString(3);
               String ag=rs1.getString(4);
               String ge=rs1.getString(5);
               String add=rs1.getString(6);
               String st=rs1.getString(7);

               
               out.println("<tr><td>"+nm+"</td><td>"+ph+"</td><td>"+c+"</td><td>"+ag+"</td><td>"+ge+"</td><td>"+add+"</td><td>"+st+"</td></tr>");
            }
            out.println("<table border=0 width=500 style=text-align:center;margin-top:100px;><tr><td>Change Admission Status</td></tr><tr><td><lable><input type=radio value=Yes name=s>Yes</lable><lable><input type=radio value=No name=s>No</lable></td></tr><tr><td><input type=submit value=sumbit name=btn1></td></table>");
       }
          String ans=request.getParameter("btn1");
          if(ans!=null)
          {
               PreparedStatement psmt2 = con.prepareStatement("UPDATE admission_info SET status=? where Full_Name=?");
               psmt2.setString(1,request.getParameter("s"));
               String data = (String)session.getValue("user1");
               //String data = (String)session.getValue("fullname");
               psmt2.setString(2,data);
               int cnt = psmt2.executeUpdate();
               
               PreparedStatement psmt3 = con.prepareStatement("UPDATE register_info SET status=? where Full_Name=?");
               psmt3.setString(1,request.getParameter("s"));
              // String data1 = (String)session.getValue("user1");
               String data1 = (String)session.getValue("fullname");
               psmt3.setString(2,data1);
               int cnt1 = psmt3.executeUpdate();
               /*out.println(""+cnt1);*/

               if(cnt1>=1)
                 out.println("Record Updated");
               else 
                  out.println("Record not Updated");

                if(cnt>=1)
                 out.println("Record Updated");
               else 
                  out.println("Record not Updated");
          }

     }
catch(Exception e)
{
 out.println("error"+e);
}

%>
