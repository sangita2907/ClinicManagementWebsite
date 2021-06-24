<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myCLINIC: Create An Account</title>
    <!-- link required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">

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
        <br>
        <form class="form" action="OtpValidation" method="post">
        	<%
        		String email = request.getParameter("email");
        		if(request.getParameter("message") != null){
        	%>
        			<p style="color: red; font-size: 25px;"><%=request.getParameter("message") %><p>
        	<% } %>
        	<br>
            <!-- User's Email  -->
            <div>
                <div class="label">
                    <label for="email">Email</label>
                </div>
                <div class="input">
                    <input type="email" name="uemail"  id="email" value="<%=email%>" readonly>
                </div>
            </div>
            
            <!-- User's OTP  -->
            <div>
                <div class="label">
                    <label for="u_otp">OTP</label>
                </div>
                <div class="input">
                    <input type="text" name="u_otp" id="u_otp" required>
                </div>
            </div>


            <!-- Action Button  -->
            <div>
                <div class="label"></div>
                <div class="input">
                    <input type="submit" value="Verify">
                </div>
            </div>
        </form>

    </div>

    </div>
    <%@include file="footer.jsp"%>
   

</body>

</html>