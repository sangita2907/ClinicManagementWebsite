<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.sangita.bo.Doctor" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="stylesheets/view.css">
    <title>myCLINIC</title>
</head>
<body>
	
	<%@include file="header.jsp"%>
	<div class="box">
    	<div class="container">
		    <%
		    	String searchElement = request.getParameter("search");
		    	List<Doctor> list = (List<Doctor>)session.getAttribute("doctorList");
		    	String error = (String)request.getAttribute("errorCode");
		    	
		    %>
    	
	    	<% if(request.getParameter("updateMessage") != null){ %>
	        		<p style="color: green; font-size: 25px;"><%=request.getParameter("updateMessage") %></p>
	        <% } %>
        	
        	
	        <table>
	            <caption>List of Doctors</caption>
	            <thead>
	                <tr>
	                    <th>Doctor's Name</th>
	                    <th>Specialist</th>
	                    <th>Visiting Time</th>
	                    <th>links</th>
	                   
	                </tr>
	            </thead>
	            <tbody>
	            	<% for(Doctor doctor: list){ %>
		                <tr>
		                    <td><%=doctor.getName()%></td>
		                    <td><%=doctor.getSpecialist()%></td>
		                    <td>
			                    <% 
			       					ArrayList<String> dayList = doctor.getDayList();
			       					ArrayList<Integer> startTimeList = doctor.getStart_time();
			       					ArrayList<Integer> endTimeList = doctor.getEnd_time();
			       					
			       					if(dayList.size() == 0){
			       				%>
			       						<%="No record found..<br />" %>
			       				<% }else { 
			       					for(int i = 0; i < dayList.size(); i++){ 
			       				%>
			       						<%if(startTimeList.get(i) <= 11 && endTimeList.get(i) <= 11){%>
			       							<%=dayList.get(i) + " --> " + startTimeList.get(i) +" A.M - " + endTimeList.get(i) +" A.M<br/>"%>   
			       						<%}else if(startTimeList.get(i) >= 12 && endTimeList.get(i) >= 12){  %>
			       							<%=dayList.get(i) + " --> " + (startTimeList.get(i)-12) +" P.M - " + (endTimeList.get(i) - 12) +" P.M<br/>"%>   
			       						<%}else if(startTimeList.get(i) <= 11 && endTimeList.get(i) >= 12){  %>
			       							<%=dayList.get(i) + " --> " + startTimeList.get(i) +" A.M - " + (endTimeList.get(i) - 12) +" P.M<br/>"%>   
			       						<%} %>
			       					<%} %>
			       				<%} %> 
			       				
			       				<% if(user != null){ 
			       						if(user.getRole().equals("admin") ){ %>
		                    				<a href="addDoctorTimingForm.jsp?d_id=<%=doctor.getId()%>">add time</a>&nbsp;&nbsp;&nbsp;&nbsp;
		                    				<% if(dayList.size() != 0){ %>
		                    					<a href="UpdateDoctorTimingForm.jsp?d_id=<%=doctor.getId()%>">update time</a>&nbsp;&nbsp;&nbsp;&nbsp;
		                    					<a href="DeleteDoctorTimingForm.jsp?d_id=<%=doctor.getId()%>">delete time</a>&nbsp;&nbsp;&nbsp;&nbsp;
		                    				<% } %> 
		                    			<% } %>
		                    	<% } %>
		       				</td>
		                    <td>
		                    	<a href="doctorDetails.jsp?d_id=<%=doctor.getId()%>">Details</a>&nbsp;&nbsp;&nbsp;&nbsp;
		                    	<% if(user != null){ %>
		                    		<% if(user.getRole().equals("admin")){ %>
		                    			<a href="updateDoctor.jsp?d_id=<%=doctor.getId()%>">Update</a>&nbsp;&nbsp;&nbsp;&nbsp;
		                    			<%-- <a href="deleteDoctor?d_id=<%=doctor.getId()%>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp; --%>
		                    		<% } %>
		                   		<% } %>
		                   		<a href="appointmentForm.jsp">Take Appointment</a>
		                    </td>
		                    
		                </tr>
	                <% } %>
	            </tbody>
	        </table>
    	</div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>