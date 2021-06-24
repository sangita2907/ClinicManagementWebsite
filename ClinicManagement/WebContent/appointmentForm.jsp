<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List" %>
<%@page import="com.sangita.bo.Doctor" %>
<%@page import="com.sangita.bo.User" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
<script type="text/javascript" src="javaScript/validation.js"></script>
<title>myClinic:: Take an appointment</title>
</head>
<body>
	<%@include file="header.jsp" %>
	
	 <%
    	List<Doctor> list = (List<Doctor>)session.getAttribute("doctorList");
		/* User loginUser = (User)session.getAttribute("user"); */ 
    %>  
    
	<div class="container">
		<div class="box">
			<h2>Appointment Form</h2>
			<br>
			<%
				if(request.getAttribute("insertError") != null){
					
			%>
					<p style="color: red; font-size: 20px;"><%=request.getAttribute("insertError") %></p>
			<%	} %>
			<br>
			<form name="myForm" class="form" action="appointment" method="post" onsubmit="return (validateForm());">
			
				<!--User Id  -->
	            <div>
	            
	                <div class="input">
	                	<% if(user != null){ %>
	                    	<input type="text" name="uid" id="uid" value="<%=user.getId()%>" hidden>
	                	<% } %>
	                	<% if(doctorUser != null){ %>
	                    	<input type="text" name="uid" id="uid" value="<%=doctorUser.getId()%>" hidden>
	                	<% } %>
	                </div>
	            </div>
	           
	           <!--Patient's Name  -->
	            <div>
	                <div class="label">
	                    <label for="name">Patient Name </label>
	                </div>
	                <div class="input">
	                    <input type="text" name="pname" id="name" placeholder="Enter patient name" required>
	                </div>
	            </div>
	            
	            
	            <!--Patient's Gender  -->
	            <div>
	                <div class="label">
	                    <label for="gender">Gender</label>
	                </div>
	                <div class="input">
	                    <input type="radio" name="pgender" id="mgender" value="male" required>
	                    <label for="mgender">Male</label>
	
	                    <input type="radio" name="pgender" id="fgender" value="female" required>
	                    <label for="fgender">Female</label>
	
	                    <input type="radio" name="pgender" id="ogender" value="other" required>
	                    <label for="ogender">Other</label>
	                </div>
	            </div>
	            
	             <!--Patient's Age  -->
	            <div>
	                <div class="label">
	                    <label for="age">Age </label>
	                </div>
	                <div class="input">
	                    <input type="text" name="page" id="age" placeholder="Enter patient age" required>
	                </div>
	            </div>
	            
	             <!-- patient's Contact details -->
	            <div>
	                <div class="label">
	                    <label for="pnumber">Contact Number</label>
	                </div>
	                <div class="input">
	                    <input type="text" name="pphone" placeholder="10 digits contact number" id="pnumber" required>
	                </div>
	            </div>
	            
	            <!-- Patient's Email -->
	            <div>
	                <div class="label">
	                    <label for="email">Email</label>
	                </div>
	                <div class="input">
	                	<% if(user != null){ %>
	                    	<input style="background-color: lightgrey;" type="email" name="pemail" id="email" value="<%=user.getEmail() %>" readonly>
	                    <% } %>
	               		<% if(doctorUser != null){ %>
	               			<input style="background-color: lightgrey;" type="email" name="pemail" id="email" value="<%=doctorUser.getEmail() %>" readonly>
	               		<% } %>
	                </div>
	            </div>
	            
				<!-- Select doctor -->
	            <div>
	                <div class="label" for="doctorName">
	                    <label>Doctor</label>
	                </div>
	     
	                <div class="input">
	                	
	                    <select name="doctor" id="doctorName" required>
	                        <option value="">[choose yours]</option> 
	                         	<% for(Doctor doctor: list){ %>
	                        		<option value="<%=doctor.getId()%>"><%=doctor.getName()%>,<%=doctor.getSpecialist()%></option>
                    		 	<%} %>
                    	</select>
	               	</div>
	            </div>
	            
	             <!-- Visiting Time  -->
	            <div>
	                <div class="label">
	                    <label for="adate">Appointment Date </label>
	                </div>
	                <div class="input">
	                    <input type="date" name="adate" id="adate" required>
	                </div>
	            </div>
	            
	            <!-- Symptoms -->
	            <div>
	                <div class="label">
	                    <label for="symp">Symptoms</label>
	                </div>
	                <div class="input">
	                    <textarea rows="6px" cols="30px" name="symptoms" id="symp"
	                        placeholder="Enter the problems you are facing"></textarea>
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