<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myCLINIC: Insert doctor Form</title>
    <!-- Insert required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
    <script src="javaScript/validation.js"></script>
</head>

<body>
	<%@include file="header.jsp"%>
	<div class="container">
    	<div class="box">

        	<h3><u>Add Doctor's Details</u></h3>
        	<br><br>
        
        	<%if(request.getParameter("insertError") != null){ %>
    			<p style="color: red; font-size: 25px;"><%=request.getParameter("insertError") %><p>
    		<% } %>
    	
    		<%if(request.getParameter("addMessage") != null){ %>
    			<p style="color: green; font-size: 25px;"><%=request.getParameter("addMessage") %><p>
    		<% } %>

        	<form name="myForm" class="form" action="addDoctor" method="post" onsubmit="return (validateForm());">
            	<!-- Docter's Name Field  -->
	           	<div>
	                <div class="label">
	                    <label id="name">Doctor Name</label>
	                </div>
	                <div class="input">
	                    <input type="text" name="dname" id="name" placeholder="First & Last Name" required>
	                </div>
	            </div>
	            
	            <!--Docter's Gender  -->
	            <div>
	                <div class="label">
	                    <label for="gender">Gender</label>
	                </div>
	                <div class="input">
	                    <input type="radio" name="dgender" id="mgender" value="male" required>
	                    <label for="mgender">Male</label>
	
	                    <input type="radio" name="dgender" id="fgender" value="female" required>
	                    <label for="fgender">Female</label>
	
	                    <input type="radio" name="dgender" id="ogender" value="other" required>
	                    <label for="ogender">Other</label>
	                </div>
	            </div>

	            <!-- Doctor's DOB  -->
	            <div>
	                <div class="label">
	                    <label for="dob">Date of Birth</label>
	                </div>
	                <div class="input">
	                    <input type="date" name="ddob" id="dob" required>
	                </div>
	            </div>

	            <!-- Doctor's Contact details -->
	            <div>
	                <div class="label">
	                    <label for="pnumber">Contact Number</label>
	                </div>
	                <div class="input">
	                    <input type="text" name="dphone" placeholder="10 digits contact number" id="pnumber" required>
	                </div>
	            </div>

	            <!-- Doctor's Email -->
	            <div>
	                <div class="label">
	                    <label for="email">Email</label>
	                </div>
	                <div class="input">
	                    <input type="email" name="demail" placeholder="xyz@gmail.com" id="email" required>
	                </div>
	            </div>

	            <!-- Doctor's qualification -->
	            <div>
	                <div class="label">
	                    <label for="qual">Qualification</label>
	                </div>
	                <div class="input">
	                    <textarea rows="6px" cols="30px" name="dqualification" id="qual"
	                        placeholder="Enter degrees" required></textarea>
	                </div>
	            </div>

	            <!-- Doctor's Specialization -->
	            <div>
	                <div class="label">
	                    <label for="spl">Specialization</label>
	                </div>
	                <div class="input">
	                    <input type="text" name="dspecial" placeholder="Specialization" id="spl" required>
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
	<%@include file="footer.jsp"%>
</body>
	

</html>