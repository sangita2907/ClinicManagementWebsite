<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myCLINIC: Login</title>
    <!-- Add required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets\FormS.css">
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
        
        <% if(request.getAttribute("loginError")!=null){%>
    		<h1 style="color:red"><%=request.getAttribute("loginError") %></h1>
		<% }%>
		
        <br>
        <a class="slide" href="UserLoginForm.jsp"></a>
        <a class="slide" href="DoctorLoginForm.jsp"></a>
        
        <h4>Login as user</h4>
        <br><br>
        <form class="form" action="loginService" method="post">
            <div>
                <div class="label">
                    <label for="name">E-mail</label>
                </div>
                <div class="input">
                    <input type="email" name="uname" id="name" placeholder="Enter email" required>
                </div>
            </div>

            <div>
                <div class="label">
                    <label>Password</label>
                </div>
                <div class="input">
                    <input type="password" name="upass" id="pass" placeholder="password" required>
                </div>
            </div>

            <div>
                <div class="label"></div>
                <div class="input">
                    <input type="submit" value="Login">
                </div>
            </div>


            <p>Don't have an account?<a href="signinForm.jsp">Sign Up</a></p>

        </form>
    </div>
    </div>
    <%@include file="footer.jsp"%>

</body>

</html>
        
        
		
        