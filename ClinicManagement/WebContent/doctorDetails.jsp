<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">

<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.sangita.bo.Doctor" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="stylesheets/doctorDetails.css">
    <link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru:wght@300&display=swap" rel="stylesheet">
    <title>Doctors Details</title>
</head>
<body>
	<%@include file="header.jsp"%>

	<% 
	   String doctorIdStr = request.getParameter("d_id");
	   Long doctorId = Long.parseLong(doctorIdStr);
	   List<Doctor> list = (List<Doctor>)session.getAttribute("doctorList");
	   for(Doctor doctor: list){
		 if(doctor.getId() == doctorId){
	%>

    <div class="info">
        <p>Doctor's Information</p>
        <table>
    		<tr>
       			<td class="attri">Name:</td> 
       			<td class="value"><%=doctor.getName() %></td>
       		</tr>
       		
       		<tr>
       			<td class="attri">Gender:</td>
       			<td class="value"><%=doctor.getGender() %></td> 
       		</tr>
       		
       		<tr>
       			<td class="attri">Date of Birth:</td> 
       			<td class="value"><%=doctor.getDob() %></td>
       		</tr>
       		
       		<tr>
       			<td class="attri">Email</td>
       			<td class="value"><%=doctor.getEmail() %></td>
       		</tr>
       		
       		<tr>
       			<td class="attri">Contact Number:</td> 
       			<td class="value"><%=doctor.getContactNumber() %></td>
       		</tr>
       		
       		<tr>
       			<td class="attri">Qualification:</td> 
       			<td class="value"><%=doctor.getQualification() %></td>
       		</tr>
       		
       		<tr>
       			<td class="attri">Specialization:</td> 
       			<td class="value"><%=doctor.getSpecialist() %></td>
       		</tr>
			
			<tr>
       			<td class="attri">Timing:</td> 
       			<td class="value">
       				 <% 
	       					ArrayList<String> dayList = doctor.getDayList();
	       					ArrayList<Integer> startTimeList = doctor.getStart_time();
	       					ArrayList<Integer> endTimeList = doctor.getEnd_time();
	       					
	       					if(dayList.size() == 0){
	       				%>
	       						<%="No record found.." %>
	       				<% }else { 
	       					for(int i = 0; i < dayList.size(); i++){ 
	       				%>
	       						<%=dayList.get(i) + " --> " + startTimeList.get(i) + "-" + endTimeList.get(i) +"<br/>"%>   
	       				
	       					<% } %> 
	       				<%} %>     			
       			</td>
       		</tr>       		
     		</table>
       		
		<% 	}
			}
		%>
    </div>
    <%@include file="footer.jsp"%>
</body>
</html>