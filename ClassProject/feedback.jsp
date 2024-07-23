<%@page import = "java.sql.*" %>
<!DOCTYPE html> 
<html lang="en"> 

<head> 
	<meta charset="UTF-8"> 
	<meta name="viewport"
		content="width=device-width,initial-scale=1.0"> 
	<title>Feedback Form</title> 
	<style type="text/css">

body { 
	margin: 0; 
	display: flex; 
	align-items: center; 
	justify-content: space-around; 
	flex-direction: column; 
	height: 90vh; 
	background-image: url(feedbackimg.png);
	background-size: cover;
	back
	font-family: 'Poppins', sans-serif; 

} 

.textup { 
	text-align: center; 
	font-weight: 700; 
} 

i { 
	margin-right: 3px; 
} 

.form-box { 
	background-color: #fff; 
	box-shadow: 0 0 10px rgba(36, 67, 40, 0.8); 
	padding: 15px; 
	border-radius: 8px; 
	margin-left:50%;
	width: 600px;
	height: 600px; 

} 

form { 
	max-width: 400px; 
	margin: 0 auto; 
} 

.radio-group { 
	display: flex; 
	margin-bottom: 16px; 
} 

input[type="radio"] { 
	margin-right: 8px; 
} 

label { 
	display: block; 
	margin-bottom: 8px; 
	font-size: 17px; 
	font-weight: 600; 
} 

input, 
textarea { 
	width: 100%; 
	padding: 8px; 
	margin-bottom: 12px; 
	box-sizing: border-box; 
	border-radius: 10px; 

} 

button { 
	background-color: #368b44; 
	color: #fff; 
	padding: 20px; 
	border: none; 
	border-radius: 25px; 
	cursor: pointer; 
	width: 100%; 
	font-size: 15px; 
	transition: .2s linear; 
} 

button:hover { 
	background-color: #0a6808; 
	border: none; 
	transform: translateY(-10px); 
} 

h1 { 
	margin-left:50%;
}

	</style>
</head> 

<body> 
	<h1>Feedback Form</h1>
	<div class="form-box"> 
		<div class="textup"> 
			<i class="fa fa-solid fa-clock"></i> 
			It only takes two minutes!! 
		</div> 
		<form onsubmit="simple()"> 
			<label for="uname"> 
				<i class="fa fa-solid fa-user"></i> 
				Name 
			</label> 
			<%
                String nm = (String)session.getValue("fullname");
                out.println("<input type=text name=uname value="+nm+" readonly>");
             %>

			<label for="email"> 
				<i class="fa fa-solid fa-envelope"></i> 
				Email Address 
			</label> 
			<input type="email" id="e1" name="email" required> 

			<label for="phone"> 
				<i class="fa-solid fa-phone"></i> 
				Phone No 
			</label> 
			<%
                String nm1 = (String)session.getValue("phone");
                out.println("<input type=text name=phone value="+nm1+" readonly>");
            %>
			
			<label> 
				<i class="fa-solid fa-face-smile"></i> 
				Do you satisfy with our service? 
			</label> 
			<div class="radio-group"> 
				<input type="radio" id="yes1" name="satisfy" value="yes" checked> 
				<label for="yes">Yes</label> 

				<input type="radio" id="no1" name="satisfy" value="no"> 
				<label for="no">No</label> 
			</div> 

			<label for="msg"> <i class="fa-solid fa-comments" style="margin-right: 3px;"></i> 
				Write your Suggestions: 
			</label> 
			<textarea id="msg" name="msg" rows="5" cols="10" required></textarea> 
			<button type="submit" value="submit" name="btn" onclick="simple()">Submit</button>
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
       PreparedStatement psmt = con.prepareStatement("insert into feedback_info values(?,?,?,?,?)");
       psmt.setString(1,request.getParameter("uname"));
       psmt.setString(2,request.getParameter("email"));
       psmt.setString(3,request.getParameter("phone"));
       psmt.setString(4,request.getParameter("satisfy"));
       psmt.setString(5,request.getParameter("msg"));
     
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