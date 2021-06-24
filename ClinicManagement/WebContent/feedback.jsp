<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.sangita.bo.User" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>myClinic::Feedback</title>

	<!-- Insert required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
</head>
<body>
	<%@include file="header.jsp"%> 
	
	<div class="container">
    	<div class="box">

        	<h3><u>Feedback</u></h3>
        	<br><br>

        	<form class="form" action="feedback" method="post">
        		
        		<%User loginUser = (User)session.getAttribute("user"); %>
            	<!-- User's Name Field  -->
	           	<div>
	                <div class="label">
	                    <label id="name">User Name</label>
	                </div>
	                <div class="input">
	                    <input type="text" name="uname" id="name" value="<%=loginUser.getName()%>">
	                </div>
	            </div>
	            
	            
	            <!-- User's Feedback -->
	             <div>
	                <div class="label">
	                    <label for="feed">Feedback</label>
	                </div>
	                <div class="input">
	                    <textarea rows="6px" cols="30px" name="ufeed" id="feed"
	                        placeholder="Enter here"></textarea>
	                </div>
	            </div>
	
	            <!-- Action Button  -->
	            <div>
	                <div class="label"></div>
	                <div class="input">
	                    <input type="submit" value="Submit">&nbsp;&nbsp;&nbsp;
	                    <input type="reset" value="Reset">
	                </div>
	            </div>
	
	        </form>
	    </div>
	    
	</div>
	
	<%@include file="footer.jsp" %>
</body>
</html>