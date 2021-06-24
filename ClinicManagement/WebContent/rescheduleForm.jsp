<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List" %>
<%@page import="com.sangita.bo.Doctor" %>
<%@page import="com.sangita.bo.Appointment" %>
<%@page import="com.sangita.bo.User" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
<script type="text/javascript" src="javaScript/rescheduleAppointmentValidation.js"></script>
<title>myClinic::Reschedule Form</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	 <%
    	List<Doctor> doctorList = (List<Doctor>)session.getAttribute("doctorList");
		List<Appointment> list = (List<Appointment>) session.getAttribute("appointment_list");
    %>  
    
    <%String app_idStr = request.getParameter("a_id"); %>
    <% Long app_id = Long.parseLong(app_idStr); %>
    
	<div class="container">
		<div class="box">
			<h2>Appointment Reschedule Form</h2>
			<br>
			<%if(request.getParameter("rescheduleError") != null){%>
					<p style="color: red; font-size: 20px;"><%=request.getParameter("rescheduleError") %></p>
			<%} %>
			<br>
			<form name="myForm" class="form" action="RescheduleAppointment" method="post" onsubmit="return (validateForm());">
				<%for(Appointment app: list){ %>
					<%if(app.getId() == app_id){ %>
					
	           			<input type="text" name="a_id" value="<%=app_id %>" hidden>
				        <!--Patient's Name  -->
				        <div>
				        	<div class="label">
				            	<label for="name">Patient Name </label>
				            </div>
				            <div class="input">
				                <input style="background-color: lightgrey;" type="text" name="pname" id="name" value="<%=app.getName() %>" readonly>
				            </div>
				        </div>     
	            
						<!-- Select doctor -->
			            <div>
			                <div class="label" for="doctorName">
			                    <label>Doctor</label>
			                </div>
			     
			                <div class="input">
			                	<% for(Doctor d: doctorList){ %>
			                		<%if(app.getDoctorId() == d.getId()){ %>
			                			<input style="background-color: lightgrey;" type="text" name="dname" id="doctorName" value="<%=d.getName() %>" readonly>
			               			<%} %>
			               		<%} %>
			               	</div>
			            </div>
			        <%} %>
	            <%}%>
	            <!-- Visiting Time  -->
	            <div>
	                <div class="label">
	                    <label for="adate">Appointment Date </label>
	                </div>
	                <div class="input">
	                    <input type="date" name="adate" id="adate" required>
	                </div>
	            </div>        
	
	            <div>
	                <div class="label"></div>
	                <div class="input">
	                    <input type="submit" value="Take an appointment">
	                </div>
	            </div>
		</form>
		
		
		</div>
	
	</div>
	
	<%@include file="footer.jsp" %>
	

</body>
</html>