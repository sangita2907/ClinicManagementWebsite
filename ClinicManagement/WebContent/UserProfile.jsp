<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.sangita.bo.User" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>myClinic::Profile</title>
		<link rel="stylesheet" type="text/css" href="stylesheets/profile.css">
    	<link rel="preconnect" href="https://fonts.gstatic.com">
    	
		<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@200&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
	</head>
<body>
	<%@include file="header.jsp" %>
	<div class="container">
		<div class="box">
			<div>
				<div class="profilePic">
					<img src="stylesheets/images/user2.png">
					
					
				</div>
				<!-- <a href="#"><span>Update personal info</span></a> <br /> -->
				<%if(user.getRole().equals("admin")){ %>
					<a href="getAppointment?searchBy=yourActiveAppointment"><span>Your Active Appointments</span></a><br />
					<a href="getAppointment?searchBy=yourOldAppointment"><span>History</span></a>
				<%} else { %>
					<a href="getAppointment"><span>Active Appointments</span></a><br />
					<a href="getAppointment?searchBy=old"><span>History</span></a>
				<%} %>
				
			</div>
			<div>
				<!-- User details -->
				<h4> <%=user.getName()%> </h4>
				<p style="padding-left: 70px;"> <%=user.getRole()%> </p>
				<br><br><br>
				<p class="info">
				<i class="fa fa-user-circle-o"></i><%=user.getGender() %>
				<br>
				<i class="fa fa-calendar"></i><%=user.getDob() %>
				<br>
				<i class="fa fa-envelope-o"></i><%=user.getEmail() %>
				</p>
				
				
				
				
			</div>
			
		</div>
		<br /> 
		<br />
		<br />
		<br />
	</div>
	
	<%@include file="footer.jsp" %>

</body>
</html>