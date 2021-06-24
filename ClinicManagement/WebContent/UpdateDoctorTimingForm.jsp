<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.sangita.bo.Doctor" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<html>
<head>
	<title>myClinic::Doctor Timing</title>
	<!-- Insert required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
    <script type="text/javascript" src="javaScript/dayValidate.js"></script>
</head>
<body>
	<%@include file="header.jsp" %>
	
	<div class="container">
    	<div class="box">

        	<h3><u>Update Doctor's Timing Details</u></h3>
        	<br>
        	<p>*update one day at a time.<br>
        	*use 24hour format to store time.</p>
        	<br />
        	
        	<!-- Show the error message if occurred -->
        
        	<%if(request.getParameter("updateError") != null){ %>
    			<p style="color: red; font-size: 25px;"><%=request.getParameter("updateError") %><p>
    		<% } %>
    		<br />
    	

        	<form name="timeForm" class="form" action="UpdateDoctorTiming" method="post" onsubmit="return (validateForm());">
        	
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

	            <!-- visiting time -->
	            <div>
	                <div class="label">
	                    <label for="s_time">Visiting Time(start)</label>
	                </div>
	                <div class="input">
	                    <input type="number" name="stime" id="s_time" max="24" min="1"  required>
	                </div>
	            </div>
	            
	            <div>
	                <div class="label">
	                    <label for="e_time">Visiting Time(end)</label>
	                </div>
	                <div class="input">
	                    <input type="number" name="etime" id="e_time" max="24" min="1" required>
	                </div>
	            </div>
	           

	            <!-- Action Button  -->
	            <div>
	                <div class="label"></div>
	                <div class="input">
	                    <input type="submit" value="Update Slot">&nbsp;&nbsp;&nbsp;
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