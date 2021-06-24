<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<%@page import="java.util.List" %>
<%@page import="com.sangita.bo.Doctor" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>myCLINIC: Update doctor Form</title>
    <!-- Insert required files -->
    <link rel="stylesheet" type="text/css" href="stylesheets/FormS.css">
    <script src="javaScript/validation.js"></script>
</head>

<body>
	<%@include file="header.jsp"%>
    <div class="container">
    <div class="box">
    
        <h3>Update Doctor's Details</h3>
        <br>
        <form name="myForm" class="form" action="updateDoctor" method="post" onsubmit="return (validateForm());">
        	
        	<% if(request.getParameter("updateError") != null){ %>
        		<p style="color: red; font-size: 20px;"><%=request.getParameter("updateError") %></p>
        	<% } %>
        	
        	<%
    		String doctorIdStr = request.getParameter("d_id");
			Long doctorId = Long.parseLong(doctorIdStr);
			List<Doctor> list = (List<Doctor>)session.getAttribute("doctorList");
			for(Doctor doctor: list){
				if(doctor.getId() == doctorId){
			%>
        	<!-- Docter's id Field  -->
            <div>
                <div class="label">
                    <label id="id">ID</label>
                </div>
                <div class="input">
                    <input style="background-color: lightgrey;" type="text" name="did" id="id" value="<%= doctor.getId()%>" readonly = readonly>
                </div>
            </div>
            
            <!-- Docter's Name Field  -->
            <div>
                <div class="label">
                    <label id="name">Name</label>
                </div>
                <div class="input">
                    <input type="text" name="dname" id="name" value="<%= doctor.getName()%>" required>
                </div>
            </div>
            <!--Docter's Gender  -->
            <div>
                <div class="label">
                    <label for="gender">Gender</label>
                </div>
                <div class="input">
                
                	<%if(doctor.getGender().equals("male")){ %>
	                    <input type="radio" name="dgender" id="mgender" value="male" checked required>
	                    <label for="mgender">Male</label>
	                    
	                    <input type="radio" name="dgender" id="fgender" value="female"  required>
	                    <label for="fgender">Female</label>
	
	                    <input type="radio" name="dgender" id="ogender" value="other" required>
	                    <label for="ogender">Other</label>
                    
                    <%} else if(doctor.getGender().equals("female")){ %>
	                    <input type="radio" name="dgender" id="mgender" value="male" required>
	                    <label for="mgender">Male</label>
	                    
	                    <input type="radio" name="dgender" id="fgender" value="female" checked  required>
	                    <label for="fgender">Female</label>
	
	                    <input type="radio" name="dgender" id="ogender" value="other" required>
	                    <label for="ogender">Other</label>
                    
                    <%}else if(doctor.getGender().equals("other")){ %>
                    <input type="radio" name="dgender" id="mgender" value="male" required>
                    <label for="mgender">Male</label>
                    
                    <input type="radio" name="dgender" id="fgender" value="female" required>
                    <label for="fgender">Female</label>

                    <input type="radio" name="dgender" id="ogender" value="other" checked required>
                    <label for="ogender">Other</label>
                    <%} %>
                  
                </div>
            </div>

            <!-- Doctor's DOB  -->
            <div>
                <div class="label">
                    <label for="dob">Date of Birth</label>
                </div>
                <div class="input">
                    <input type="date" name="ddob" id="dob" value="<%= doctor.getDob()%>" required>
                </div>
            </div>

            <!-- Doctor's Contact details -->
            <div>
                <div class="label">
                    <label for="pnumber">Contact Number</label>
                </div>
                <div class="input">
                    <input type="text" name="dphone" id="pnumber" value="<%= doctor.getContactNumber()%>" required>
                </div>
            </div>

            <!-- Doctor's Email -->
            <div>
                <div class="label">
                    <label for="email">Email</label>
                </div>
                <div class="input">
                    <input style="background-color: lightgrey;" type="email" name="demail" id="email" value="<%= doctor.getEmail()%>" readonly required>
                </div>
            </div>

            <!-- Doctor's qualification -->
            <div>
                <div class="label">
                    <label for="qual">Qualification</label>
                </div>
                <div class="input">
                    <textarea rows="6px" cols="30px" name="dqualification" id="qual" required><%=doctor.getQualification() %></textarea>
                </div>
            </div>

            <!-- Doctor's Specialization -->
            <div>
                <div class="label">
                    <label for="spl">Specialization</label>
                </div>
                <div class="input">
                    <input type="text" name="dspecial" id="spl" value="<%=doctor.getSpecialist()%>" required>
                </div>
            </div>
            <% }} %>
            
            <!-- Action Button  -->
            <div>
                <div class="label"></div>
                <div class="input">
                    <input type="submit" value="Update">&nbsp;&nbsp;&nbsp;
                </div>
            </div>

        </form>
    </div>
    </div>
    <%@include file="footer.jsp"%>

</body>

</html>