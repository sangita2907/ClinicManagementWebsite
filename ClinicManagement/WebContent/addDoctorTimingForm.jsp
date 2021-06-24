<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.sangita.bo.Doctor" %>
<%@page import="java.util.List" %>
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

        	<h3><u>Add Doctor's Timing Details</u></h3>
        	<br>
        	<p>*insert one day at a time.<br>
        	*use 24hour format to store time.</p>
        	<br><br>
        	
        	<!-- Show the error message if occurred -->
        
        	<%if(request.getParameter("insertError") != null){ %>
    			<p style="color: red; font-size: 25px;"><%=request.getParameter("insertError") %><p>
    		<% } %>
    	

        	<form name="timeForm" class="form" action="AddDoctorTiming" method="post" onsubmit="return (validateForm());">
        	
        		<%
        			//get and parse the required attributes
        			String d_id = request.getParameter("d_id");  
        		%>
        	
        		<!-- Doctor id -->
        		<div>
	                <div class="label">
	                    <label for="did">Doctor ID</label>
	                </div>
	     
	                <div class="input">
	                	<input style="background-color: lightgrey;" type="text" name="d_id" id="did" value="<%=d_id%>" readonly>
	               	</div>
	            </div>
	            
            	<!-- days -->
	           	<div>
	                <div class="label">
	                    <label for="dayName">Day</label>
	                </div>
	                <div class="input">
	                    <input type="text" name="day" id="dayName" placeholder="Enter day" required>
	                </div>
	            </div>

	            <!-- visiting time -->
	            <div>
	                <div class="label">
	                    <label for="s_time">Visiting Time(start)</label>
	                </div>
	                <div class="input">
	                    <input type="number" name="stime" id="s_time" max="24" min="1" required>
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
	                    <input type="submit" value="Insert">&nbsp;&nbsp;&nbsp;
	                    <input type="reset" value="Reset All">
	                </div>
	            </div>
	
	        </form>
	    </div>
	    
	</div>
	<%@include file="footer.jsp" %>
</body>
</html>