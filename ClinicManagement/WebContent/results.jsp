<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>myClinic::Status</title>
<link rel="stylesheet" type="text/css" href="stylesheets\results.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&family=Frank+Ruhl+Libre:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	
	<div class="container">
		<%if(request.getParameter("addMessage") != null){ %>
			<p class="green"><%= request.getParameter("addMessage") %></p>
			<br>
        	<p>Please login to avail the services..</p>
        	<p>Thank you!!</p>
        	<%response.setHeader("refresh", "2; url=loginForm.jsp");%>
        <% } %>
        
        <!-- Successful update message form 'UpdateDoctorController' -->
        <% if(request.getParameter("updateDoctorMessage") != null){%>
        	<p class="green"><%=request.getParameter("updateDoctorMessage")%></p>
        	<%response.setHeader("refresh", "2; url=viewDoctor");%>
        <% } %>
        
        <% if(request.getParameter("viewError") != null){%>
        	<p class="green"><%=request.getParameter("viewError")%></p>
        	<%response.setHeader("refresh", "2; url=home.jsp");%>
        <% } %>
        
         <% if(request.getParameter("doctorAddMsg") != null){%>
        	<p class="green">
        	<%=request.getParameter("doctorAddMsg")%>
        	<br>Add visiting hours details
        	</p>
        	<%response.setHeader("refresh", "2; url=viewDoctor");%>
        <% } %>
        
        <% if(request.getParameter("deleteMessage") != null){%>
        	<p class="green"><%=request.getParameter("deleteMessage")%></p>
        	<%response.setHeader("refresh", "2; url=viewDoctor");%>
        <% } %>
        
        
        <!-- Success message form 'AddDoctorTimingController' --> 
        <% if(request.getParameter("AddDoctorTimingMsg") != null){ %>
        	<p class="green"><%=request.getParameter("AddDoctorTimingMsg")%></p>
        	<%response.setHeader("refresh", "2; url=doctorTiming");%>
        <% } %>
        
        
        <!-- Successful update message form 'UpdateDoctorTimingController' -->
        <% if(request.getParameter("updateDoctorTimingMsg") != null){ %>
        	<p class="green"><%=request.getParameter("updateDoctorTimingMsg")%></p>
        	<%response.setHeader("refresh", "2; url=doctorTiming");%>
        <% } %>
        
        
        <!-- Successful delete message form 'DeleteDoctorTimingController' -->
        <% if(request.getParameter("deleteTimingMessage") != null){ %>
        	<p class="green"><%=request.getParameter("deleteTimingMessage")%></p>
        	<%response.setHeader("refresh", "2; url=doctorTiming");%>
        <% } %>
        
         <!-- Successful password change message form 'DoctorPasswordChangeController' -->
        <% if(request.getAttribute("PasswordChangeStatus") != null){ %>
        	<p class="green"><%=request.getAttribute("PasswordChangeStatus")%></p>
        	<%response.setHeader("refresh", "2; url=DoctorLoginForm.jsp");%>
        <% } %>
        
         <!-- Successful appointment message form 'AppointmentController' -->
        <% if(request.getAttribute("appointmentMsg") != null){ %>
        	<p class="green"><%=request.getAttribute("appointmentMsg")%></p>
        	<%response.setHeader("refresh", "2; url=getAppointment");%>
        <% } %>
        
        <!-- Successful appointment cancel message form 'DeleteAppointmentsController' -->
        <% if(request.getAttribute("appointmentCancelMsg") != null){ %>
        	<p class="green"><%=request.getAttribute("appointmentCancelMsg")%></p>
        	<%response.setHeader("refresh", "2; url=getAppointment");%>
        <% } %>
        
        <!-- Successful appointment status update message form 'AppointmentStatusUpdateController' -->
        <% if(request.getAttribute("AppointmentStatusUpdateMessage") != null){ %>
        	<p class="green"><%=request.getAttribute("AppointmentStatusUpdateMessage")%></p>
        	<%response.setHeader("refresh", "2; url=getAppointment");%>
        <% } %>
        
         <!-- Successful reschedule appointment message form 'RescheduleAppointmentController' -->
        <% if(request.getParameter("rescheduleMessage") != null){ %>
        	<p class="green"><%=request.getParameter("rescheduleMessage")%></p>
        	<%response.setHeader("refresh", "2; url=getAppointment");%>
        <% } %>
        	
	</div>	
</body>
</html>