<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myCLINIC: Create An Account</title>
    <!-- link required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
    <script src="javaScript/validation.js"></script>

</head>

<body>
	<%@include file="header.jsp"%>
	<div class="container">
    <div class="box">
        <div class="info">
            <h3>myCLINIC</h3>
            <h4>Your comfort our responsibility</h4>
            <p>Make an appointment, minimize waiting time, Get discount</p>
            <p>and stay HEALTHY</p>
        </div>
		<br>
        <h4>Create An Account</h4>
        <br><br>
        <% 
        	String email = request.getParameter("email");
        %>
        <form name ="myForm"class="form" action="Signin"  method="post" onSubmit="return (validateForm());">
            <!-- User's Full Name  -->
            <div>
                <div class="label">
                    <label for="name">Full Name</label>
                </div>
                <div class="input">
                    <input type="text" name="uname" placeholder="First & Last Name" id="name" required>
                </div>
            </div>

            <!-- User Gender  -->
            <div>
                <div class="label">
                    <label for="gender">Gender</label>
                </div>
                <div class="input">
                    <input type="radio" name="ugender" id="mgender" value="male" required>
                    <label for="mgender">Male</label>

                    <input type="radio" name="ugender" id="fgender" value="female" required>
                    <label for="fgender">Female</label>

                    <input type="radio" name="ugender" id="ogender" value="other" required>
                    <label for="ogender">Other</label>
                </div>
            </div>

            <!-- User date of birth  -->
             <div>
	         	<div class="label">
	             	<label for="dob">Date of Birth </label>
	            </div>
	            <div class="input">
	            	<input type="date" name="dob" id="dob" required>
	            </div>
	        </div>

            <!-- User's Email  -->
            <div>
                <div class="label">
                    <label for="email">Email</label>
                </div>
                <div class="input">
                    <input type="email" name="uemail" value="<%=email %>" id="email" readonly>
                </div>
            </div>

            <!-- User's Password  -->
            <div>
                <div class="label">
                    <label for="pass">Password</label>
                </div>
                <div class="input">
                    <input type="password" name="upassword" placeholder="password" id="pass" required>
                </div>
            </div>


            <!-- Action Button  -->
            <div>
                <div class="label"></div>
                <div class="input">
                    <input type="submit" value="Create An Account">
                </div>
            </div>
        </form>

        <p>Have an Account?<a href="loginForm.jsp">Log in</a></p>

    </div>

    </div>
    <%@include file="footer.jsp"%>
   

</body>

</html>