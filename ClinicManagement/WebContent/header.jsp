<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@page import="com.sangita.bo.User" %>
<%@page import="com.sangita.bo.Doctor" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myCLINIC</title>
    <link rel="stylesheet" type="text/css" href="stylesheets\header.css">
    <!-- Font For icons -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400&display=swap" rel="stylesheet"> 
</head>

<body>  

	<!--Validate whether the user is available or not-->
    <div class="header">
        <div class="inner_header">
            <div class="logo_container">
                <h1>my<span>CLINIC</span></h1>
            </div>
            <ul class="navigation">
            
            <% 
            	User user = null;
				if(session.getAttribute("user") != null){
					user = (User)session.getAttribute("user");
				}
			%>
			
			<%  Doctor doctorUser = null;
				if(session.getAttribute("userDoctor") != null){
					doctorUser = (Doctor)session.getAttribute("userDoctor");
				}
			%>
            
            	<%if(user != null){ %>
            		<a href="UserProfile.jsp"><li><%=user.getName()%>(<%=user.getRole()%>)</li></a>
                	<a href="logout"><li>Logout</li></a>
                <%} else if(doctorUser != null){ %>
                	<a href="DoctorProfile.jsp"><li><%=doctorUser.getName()%>(<%=doctorUser.getRole()%>)</li></a>
                	<a href="logout"><li>Logout</li></a>
                <% }else{ %>
                	<a href="index.jsp"><li>Home</li></a>
                	<a href="aboutUs.jsp"><li>About us</li></a>
                	<a href="signinFormPart1.jsp"><li>Signup</li></a>
                	<a href="UserLoginForm.jsp"><li>Login</li></a>
                <% } %>
                
            </ul>
        </div>
    </div>
    
    <%if (user != null || doctorUser != null) {%>
    <div class="searchContainer">
    	<div>
            <form action="searchController.jsp">
                <input type="text" name="search" placeholder="Department">
                <button class="fa fa-search"></button>
            </form>
        </div>
    
    	<div style="float: left;">
    	
    		<a href="home.jsp">Home</a> &nbsp;&nbsp;&nbsp;&nbsp;
    		
        	<% if(user != null){
        		if("admin".equals(user.getRole())){ %>
            		<a href="addDoctor.jsp">Appoint Doctor</a> &nbsp;&nbsp;&nbsp;&nbsp;
        		<% } %>
        	<% } %>
        	
        	<a href="doctorTiming">Doctors</a> &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="appointmentForm.jsp">Make an Appointment</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="getAppointment">Appointments</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="aboutUs.jsp">About us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	
    	</div>
    </div>
    <% } %>

</body>
</html>
    
