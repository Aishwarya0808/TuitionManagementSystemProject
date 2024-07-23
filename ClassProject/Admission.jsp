<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admission Form</title>
<style>
    body{
        font-family: Arial, sans-serif;
        /*background-color: #FFFF00;*/
        margin: 0;
        padding: 0;
        background-image: url(admissionbg.png);
        background-repeat: no-repeat;
        background-size: cover;
        position: relative;
   }
    .container {
        max-width: 500px;
        margin-left:60%;
        background: #fff;
        padding: 20px;
        border-radius: 5px;
        margin-top: 5%;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .container h2 {
        text-align: center;
        margin-bottom: 20px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input, .form-group select {
        width: calc(100% - 12px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .form-group button {
        padding: 10px 20px;
        background: #007bff;
        border: none;
        color: #fff;
        border-radius: 5px;
        cursor: pointer;
    }
    .form-group button:hover {
        background: #0056b3;
    }
    .error {
        color: red;
        font-size: 0.8em;
    }
    .gender-selection label{
        display: flex;
        align-items: center;
        width: 20%;
    }
    .gender-selection{
        display: flex;
        align-items: center;
        width: 100%;
    }
</style>
<script>
    function simple() 
    { 
        
        var c = document.getElementById('c1').value;
        var ag =document.getElementById('a1').value;
        var ad = document.getElementById('add').value;
        var m = document.getElementById('m1').value;
        var f = document.getElementById('f1').value;
        
        if(c==0)
        {
             alert("Please Select the Course");
        }
        if(ag=="")
        {
            alert("Age is required");
        }
        else if(age<18)
        {
            alert("Enter the Valid Age");
        }
        
        if(ad=="")
        {
            alert("Address is required");
        }
        if(m==""||f=="")
        {
            alert("Gender is required");
        }  
    }
</script>
</head>

<body>
<div class="container">
    <h2>Admission Form</h2>
    <form onsubmit="simple()" method="POST">
        <div class="form-group">
            <label for="name">Full Name:</label>
            <%
                String nm = (String)session.getValue("fullname");
                out.println("<input type=text name=n1 value="+nm+" readonly>");
            %>
            
        </div>

        <div class="form-group">
            <label for="phone">Enter the Phone Number:</label>
            <%
                String phone = (String)session.getValue("phone");
                out.println("<input type=text name=p1 value="+phone+" readonly>");
            %>
        </div>

        <div class="form-group">
            <label for="course">Course:</label>
            <select id="c1" name="course" required>
               <option value="0">Select Course</option>
                <option value="C language">C language</option>
                <option value="C++">C++</option>
                <option value="Data Structure">Data Structure</option>
                <option value="Advanced Java">Advanced Java</option>
                <option value="Full Stack Developer">Full Stack Developer</option>
                </select>
            
        </div>

        <div class="form-group">
            <label for="age">Age:</label>
            <input type="number" id="a1" name="age" required>
            
        </div>

        <div class="form-group">
        <div class="gender-selection">
            <label for="gender">Gender:</label>
            <label for="male">
            <input type="radio" id="m1" value="male" name="gender" required>Male
            </label>
            <label for="female">
            <input type="radio" id="f1" value="female" name="gender" required>Female
            </label>
        </div>
        </div>

        <div class="form-group">
        <div class="input-box address">
          <label>Address</label>
          <input type="text" placeholder="Enter the address" required name="address" id="add" />
        </div>
        </div>

        <div class="form-group">
          <button type="submit" value="submit" name="btn" onclick="simple()">Submit</button>
        </div>
    </form>
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
       PreparedStatement psmt = con.prepareStatement("insert into admission_info values(?,?,?,?,?,?,?)");
       psmt.setString(1,request.getParameter("n1"));
       psmt.setString(2,request.getParameter("p1"));
       psmt.setString(3,request.getParameter("course"));
       psmt.setString(4,request.getParameter("age"));
       psmt.setString(5,request.getParameter("gender"));
       psmt.setString(6,request.getParameter("address"));
       psmt.setString(7,"No");
        
       
       int cnt = psmt.executeUpdate();
       if(cnt>=1)
       {
         out.println("<script> alert ('Submitted Successfully'); </script>");
       }
      /* else 
       {
         out.println("<script> alert ('Record not Inserted Successfully'); </script>");
       }*/
    }
    catch(Exception e)
    {
       out.println("error"+e);  
    }
 }
%>
