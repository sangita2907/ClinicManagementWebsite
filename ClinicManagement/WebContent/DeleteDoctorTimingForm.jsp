<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.sangita.bo.Doctor" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>myClinic::Doctor Timing</title>
	<!-- Insert required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
</head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="container">
    	<div class="box">

        	<h3><u>Delete Doctor's Timing</u></h3>
        	<br>
        	
        	<!-- Show the error message if occurred -->
        
        	<%if(request.getParameter("deleteTimingError") != null){ %>
    			<p style="color: red; font-size: 25px;"><%=request.getParameter("deleteTimingError") %><p>
    		<% } %>
    		<br>
    	

        	<form class="form" action="DeleteDoctorTiming" method="post">
        	
        		<%
        			//get and parse the required attributes
        			String d_idStr = request.getParameter("d_id");  
        			Long d_id = Long.parseLong(d_idStr);
        			List<Doctor> list = (List<Doctor>)session.getAttribute("doctorList");
        			for(Doctor doctor: list){
        				if(d_id == doctor.getId()){
        		%>
        	
        		<!-- Doctor id -->
        		<div>
	                <div class="label">
	                    <label for="did">Doctor ID</label>
	                </div>
	     
	                <div class="input">
	                	<input type="text" name="d_id" id="did" value="<%=d_id%>" readonly>
	               	</div>
	            </div>
	            
            	<!-- Select day name which you want to update -->
	           	<div>
	                <div class="label">
	                    <label for="day_name">Day</label>
	                </div>
	                <div class="input">
	                    <select name="dayName">
	                        <option value="-1" selected>[choose day]</option> 
	                         	<% 
	                         		ArrayList<String> dayList = doctor.getDayList();
	                    			ArrayList<Integer> startTimeList = doctor.getStart_time();
		       						ArrayList<Integer> endTimeList = doctor.getEnd_time();
	                    			int i = 0;
	                         		for(i = 0; i < dayList.size(); i++){ 
	                         	%>
	                        			<option value="<%=dayList.get(i)%>"><%=dayList.get(i)%></option>
                    			<%
									} 
                				%>	 	
                    	</select>
                    	
	                </div>
	            </div>

	            <!-- Action Button  -->
	            <div>
	                <div class="label"></div>
	                <div class="input">
	                    <input type="submit" value="Delete Slot">&nbsp;&nbsp;&nbsp;
	                    <input type="reset" value="Reset All">
	                </div>
	            </div>
	            <% }} %>
	
	        </form>
	    </div>
	    
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>