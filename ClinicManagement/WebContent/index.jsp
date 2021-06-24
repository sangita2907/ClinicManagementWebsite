<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myCLINIC</title>
    <!-- Link required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/index.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&family=Frank+Ruhl+Libre:wght@300&display=swap"
        rel="stylesheet">
</head>

<body>
	<!--Check whether user session is active or not  -->
	<!-- If active redirect to home page  -->
	<%
		if(session.getAttribute("user") != null){ 
			response.sendRedirect("home.jsp");
		}
	%>
	
	<%@include file="header.jsp"%>
    <img src="images/caring.jpg" alt="We are here for you" class="floatRight">
    <div class="container">
        <span class="info ">
            <h4>Your comfort our responsibility</h4>
            <p>Make an appointment, minimize waiting time, Get discount</p>
            <p>and stay HEALTHY</p>
            <button class="submit"><a href="UserLoginForm.jsp"><i>Log in</i></a></button>
            <br><br>
            <p>Don't have an account?<br>immediately join us for hassle free services.. </p>
            <button class="submit"><a href="signinFormPart1.jsp"><i>Sign up</i></a></button>
        </span>
    </div>
    <%@include file="footer.jsp"%>
</body>

</html>