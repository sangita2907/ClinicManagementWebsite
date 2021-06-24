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
            <h4>Password Change Form</h4>
            <p> Hi! Looks like it is the first time you login as doctor..</p>
            <p>Please change the default password for better security..</p>
            
        </div>
        
        <% if(request.getAttribute("message")!=null){%>
    		<h1 style="color:red"><%=request.getAttribute("message") %></h1>
		<% }%>
		<br>
        <br>
        
        <%
        	String email = (String)request.getAttribute("email");
        	String password = (String)request.getAttribute("password");
        %>
        <form class="form" action="DPasswordChange" method="post">
            <div>
                <div class="label">
                    <label for="email">E-mail</label>
                </div>
                <div class="input">
                    <input type="email" name="demail" id="email" value="<%=email%>" readonly>
                </div>
            </div>

			<!-- Field for old password -->
            <div>
                <div class="label">
                    <label for="old_pass">Old Password</label>
                </div>
                <div class="input">
                    <input type="password" name="oldpass" id="old_pass" value="<%=password %>" readonly>
                </div>
            </div>
            
            <!-- Field for new password -->
            <div>
                <div class="label">
                    <label for="new_pass">New Password</label>
                </div>
                <div class="input">
                    <input type="password" name="newpass" id="new_pass" placeholder="password" required>
                </div>
            </div>
            
            <!-- Field for re-enter the new password -->
            <div>
                <div class="label">
                    <label for="re_new_pass">Re-enter New Password</label>
                </div>
                <div class="input">
                    <input type="password" name="re_newpass" id="re_new_pass" placeholder="password" required>
                </div>
            </div>

            <div>
                <div class="label"></div>
                <div class="input">
                    <input type="submit" value="Login">
                </div>
            </div>

        </form>
    </div>
    </div>
    <%@include file="footer.jsp"%>

</body>

</html>
        
        
		
