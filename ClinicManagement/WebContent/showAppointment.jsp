<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.sangita.bo.Appointment"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>myClinic::appointment Status</title>
<link rel="stylesheet" type="text/css"
	href="stylesheets/showAppointment.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Pacifico&family=Yanone+Kaffeesatz:wght@300;600&display=swap"
	rel="stylesheet">
</head>
<body>
	<%@include file="header.jsp"%>
	<%
		String searchElement = request.getParameter("search");
		List<Appointment> list = (List<Appointment>) session.getAttribute("appointment_list");
		List<Doctor> doctorlist = (List<Doctor>) session.getAttribute("doctorList");
	%>
	<div class="box">
		<div class="titleBox">
			<span>_Appointments_</span>
			<form action="showAppointment.jsp" method="post">
				<select name="searchBy">
					<option value="-1">Search by Appointments</option>
					<option value="active">Active Appointments</option>
					<option value="today">Today's Appointments</option>
					<%if (doctorUser != null) {%>
						<option value="yourActiveAppointment">Your Appointments[Active]</option>
						<option value="yourOldAppointment">Your Appointments[Old]</option>
					<%} else if (user.getRole().equals("admin")) {%>
						<option value="yourActiveAppointment">Your Appointments[Active]</option>
						<option value="yourOldAppointment">Your Appointments[Old]</option>
					<%}%>
					<option value="old">Old Appointments</option>
				</select>
				<button class="fa fa-search"></button>
			</form>
		</div>
		
		<div>
			<!-- Error message from 'DeleteAppointmentController' -->
			<%if (request.getAttribute("appointmentCancelMsg") != null) {%>
				<p style="color: red; font-size: 20px; text-align: center;"><%=request.getAttribute("appointmentCancelMsg")%></p>
				<br />
			<%}%>

			<!-- Error message from 'AppointmentStatusUpdateController' -->
			<%if (request.getAttribute("AppointmentStatusUpdateMessage") != null) {%>
				<p style="color: red; font-size: 20px; text-align: center;"><%=request.getAttribute("AppointmentStatusUpdateMessage")%></p>
				<br />
			<%}%>
			
			<%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			  Date now = new Date();
			  String dateStr = sdf.format(now);
			  Date date = sdf.parse(dateStr);%>

			<table>
				<tr>
					<th>Actions</th>
					<th>Patient Name</th>
					<th>Gender</th>
					<th>Age</th>
					<th>Contact Number</th>
					<th>Symptoms</th>
					<th>Doctor Name</th>
					<th>Department</th>
					<th>Appointment Date</th>
				</tr>
				<%if (request.getParameter("searchBy") == null) {%>
					<%for (Appointment app : list) {%>
						<%if (user != null) {%>
							<%if (app.getStatus().equals("incomplete")&& (app.getDate().compareTo(date) > 0)) {%>
								<%if (user.getRole().equals("admin")) {%>

									<tr>
										<td><%=app.getStatus()%></td>
					
										<td><%=app.getName()%></td>
										<td><%=app.getGender()%></td>
										<td><%=app.getAge()%></td>
										<td><%=app.getPhone()%></td>
										<td>
											<%if (app.getSymptoms() == null) {%>
												<%="Not mentioned"%> 
											<%} else {%>
												<%=app.getSymptoms()%> 
											<%}%>
										</td>
										<%for (Doctor d : doctorlist) {
											if (d.getId() == app.getDoctorId()) {%>
												<td><%=d.getName()%></td>
												<td><%=d.getSpecialist()%></td>
											<%}%>
										<%}%>
										<td><%=app.getDate()%></td>
									</tr>
								<%} else {%>
									<%if (app.getUserId() == user.getId()) {%>
										<tr>
											<td>
												<a href="DeleteAppointment?a_id=<%=app.getId()%>"> 
													<i class="fa fa-trash"> 
														<span class="info">Delete</span>
													</i>
												</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												<a href="rescheduleForm.jsp?a_id=<%=app.getId()%>"> 
													<i class="fa fa-refresh">
														<span class="info">Reschedule</span>
													</i>
												</a>
											</td>
											<td><%=app.getName()%></td>
											<td><%=app.getGender()%></td>
											<td><%=app.getAge()%></td>
											<td><%=app.getPhone()%></td>
											<td>
												<%if (app.getSymptoms() == null) {%>
													<%="Not mentioned"%> 
												<%} else {%>
													<%=app.getSymptoms()%> 
												<%}%>
											</td>
											<%for (Doctor d : doctorlist) {
												if (d.getId() == app.getDoctorId()) {%>
													<td><%=d.getName()%></td>
													<td><%=d.getSpecialist()%></td>
												<%}%>
											<%}%>
											<td><%=app.getDate()%></td>
										</tr>
									<%}%>
								<%}%>
							<%}%>
						<%} else if (doctorUser != null) {%>
							<%if (app.getStatus().equals("incomplete") && (app.getDate().compareTo(date) > 0)) {%>
								<%if (doctorUser.getId() == app.getDoctorId()) {%>
									<tr>
										<td><%=app.getStatus()%></td>
										<td><%=app.getName()%></td>
										<td><%=app.getGender()%></td>
										<td><%=app.getAge()%></td>
										<td><%=app.getPhone()%></td>
										<td>
											<%if (app.getSymptoms() == null) {%>
												<%="Not mentioned"%> 
											<%} else {%>
												<%=app.getSymptoms()%> 
											<%}%>
										</td>
										<%for (Doctor d : doctorlist) {
											if (d.getId() == app.getDoctorId()) {%>
												<td><%=d.getName()%></td>
												<td><%=d.getSpecialist()%></td>
											<%} %>
										<%} %> 
										<td><%=app.getDate()%></td>
									</tr>
								<%}
							 }
						  }
					  }%>
					<!-- old appointments -->
					<%}else if (request.getParameter("searchBy").equals("old")) {%>
						<%for (Appointment app : list) {%>
							<%if (user != null) {%>
								<%if ((app.getDate().compareTo(date) < 0)
										|| ((app.getDate().compareTo(date) == 0) && (app
												.getStatus().equals("success")))
										|| ((app.getDate().compareTo(date) == 0) && (app
												.getStatus().equals("not visited")))) {%>
									<%if (user.getRole().equals("admin")) {%>
										<tr>
											<td>
												<%=app.getStatus() %>
											</td>
											<td><%=app.getName()%></td>
											<td><%=app.getGender()%></td>
											<td><%=app.getAge()%></td>
											<td><%=app.getPhone()%></td>
											<td>
												<%if (app.getSymptoms() == null) {%> 
													<%="Not mentioned"%>
												<%} else {%>
													<%=app.getSymptoms()%>
												<%}%>
											</td>
											<%for (Doctor d : doctorlist) {
												if (d.getId() == app.getDoctorId()) {%>
													<td><%=d.getName()%></td>
													<td><%=d.getSpecialist()%></td>
												<%}%>
											<%}%>
											<td><%=app.getDate()%></td>
										</tr>
									<%} else {%>
										<%if (app.getUserId() == user.getId()) {%>
											<tr>
												<td>
						
												</td>
												<td><%=app.getName()%></td>
												<td><%=app.getGender()%></td>
												<td><%=app.getAge()%></td>
												<td><%=app.getPhone()%></td>
												<td>
													<%if (app.getSymptoms() == null) {%>
														<%="Not mentioned"%> 
													<%} else {%>
														<%=app.getSymptoms()%> 
													<%}%>
												</td>
												<%for (Doctor d : doctorlist) {
													if (d.getId() == app.getDoctorId()) {%>
														<td><%=d.getName()%></td>
														<td><%=d.getSpecialist()%></td>
													<%}%>
												<%}%>
												<td><%=app.getDate()%></td>
											</tr>
										<%}%>
									<%}%>
								<%}%>
							<%} else if (doctorUser != null) {%>
								<%if ((app.getDate().compareTo(date) < 0)|| ((app.getDate().compareTo(date) == 0) && (app.getStatus().equals("success"))) || ((app.getDate().compareTo(date) == 0) && (app.getStatus().equals("not visited")))) {%>
									<%if (doctorUser.getId() == app.getDoctorId()) {%>
										<tr>
											<td><%=app.getStatus()%></td>
						
											<td><%=app.getName()%></td>
											<td><%=app.getGender()%></td>
											<td><%=app.getAge()%></td>
											<td><%=app.getPhone()%></td>
											<td>
												<%if (app.getSymptoms() == null) {%> 
													<%="Not mentioned"%> 
												<%} else {%>
													<%=app.getSymptoms()%> 
												<%}%>
											</td>
											<%for (Doctor d : doctorlist) {
												if (d.getId() == app.getDoctorId()){%>
													<td><%=d.getName()%></td>
													<td><%=d.getSpecialist()%></td>
												<%}%>
											<%} %>
											<td><%=app.getDate()%></td>
										</tr>
									<%}%>
								<%}%>
							<%}%>
						<%}%>
					<!-- today's appointments -->
					<%} else if (request.getParameter("searchBy").equals("today")) {%>
						<%for (Appointment app : list) {%>
							<%if (user != null) {%>
								<%if ((app.getDate().compareTo(date) == 0 ) && (app.getStatus().equals("incomplete"))) {%>
									<%if (user.getRole().equals("admin")) {%>
										<tr>
											<td>
												<%=app.getStatus() %> 	
											</td>

											<td><%=app.getName()%></td>
											<td><%=app.getGender()%></td>
											<td><%=app.getAge()%></td>
											<td><%=app.getPhone()%></td>
											<td>
												<%if (app.getSymptoms() == null) {%>
													<%="Not mentioned"%> 
												<%} else {%>
													<%=app.getSymptoms()%> 
												<%} %>
											</td>
											<%for (Doctor d : doctorlist) {
												if (d.getId() == app.getDoctorId()) {%>
													<td><%=d.getName()%></td>
													<td><%=d.getSpecialist()%></td>
												<%}%>
											<%} %>
											<td><%=app.getDate()%></td>
										</tr>
									<%} else {%>
										<%if (app.getUserId() == user.getId()) {%>
											<tr>
												<td>
													<a href="DeleteAppointment?a_id=<%=app.getId()%>"> 
														<i class="fa fa-trash"> 
															<span class="info">Delete</span>
														</i>
													</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
													<a href="rescheduleForm.jsp?a_id=<%=app.getId()%>"> 
														<i class="fa fa-refresh"> 
															<span class="info">Reschedule</span>
														</i>
													</a>
												</td>
												<td><%=app.getName()%></td>
												<td><%=app.getGender()%></td>
												<td><%=app.getAge()%></td>
												<td><%=app.getPhone()%></td>
												<td>
													<%if (app.getSymptoms() == null) {%>
						 								<%="Not mentioned"%> 
						 							<%} else {%>
														<%=app.getSymptoms()%> 
													<%}%>
												</td>
												<%for (Doctor d : doctorlist) {
													if (d.getId() == app.getDoctorId()) {%>
														<td><%=d.getName()%></td>
														<td><%=d.getSpecialist()%></td>
													<%}
												}%>
												<td><%=app.getDate()%></td>
											</tr>
										<%}%>
									<%}%>
								<%}%>
							<%} else if (doctorUser != null) {%>
								<%if ((app.getDate().compareTo(date) == 0) && (doctorUser.getId() == app.getDoctorId()) && (app.getStatus().equals("incomplete"))) {%>
									<tr>
										<td>
											<form action="StatusUpdate" method="post">
												<input type="text" name="a_id" value=<%=app.getId()%> hidden>
					
												<select name="status">
													<option value="success">Completed</option>
													<option value="not visited">Not Visited</option>
												</select> <br />
												<button type="submit">done</button>
											</form>
										</td>
										<td><%=app.getName()%></td>
										<td><%=app.getGender()%></td>
										<td><%=app.getAge()%></td>
										<td><%=app.getPhone()%></td>
										<td>
											<%if (app.getSymptoms() == null) {%>
												<%="Not mentioned"%> 
											<%} else {%>
												<%=app.getSymptoms()%> 
											<%}%>
										</td>
										<%for (Doctor d : doctorlist) {
											if (d.getId() == app.getDoctorId()) {%>
												<td><%=d.getName()%></td>
												<td><%=d.getSpecialist()%></td>
											<%}
										}%>
										<td><%=app.getDate()%></td>
									</tr>
								<%}%>
							<%}%>
						<%}%>
					<!-- Search by 'your appointments[active]' -->
					<%} else if (request.getParameter("searchBy").equals("yourActiveAppointment")) {%>
						<%for (Appointment app : list) {%>
							<%if (doctorUser != null) {%>
								<%if (app.getUserId() == doctorUser.getId()) {%>
									<%if(app.getDate().compareTo(date) > 0){ %>
										<tr>
											<td>
												<a href="DeleteAppointment?a_id=<%=app.getId()%>"> 
													<i class="fa fa-trash"> 
														<span class="info">Delete</span>
													</i>
												</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												<a href="rescheduleForm.jsp?a_id=<%=app.getId()%>"> 
													<i class="fa fa-refresh">
														<span class="info">Reschedule</span>
													</i>
												</a>
											</td>
											<td><%=app.getName()%></td>
											<td><%=app.getGender()%></td>
											<td><%=app.getAge()%></td>
											<td><%=app.getPhone()%></td>
											<td>
												<%if (app.getSymptoms() == null) {%>
						 							<%="Not mentioned"%>
						 						<%} else {%>
													<%=app.getSymptoms()%>
												<%}%>
											</td>
												<%for (Doctor d : doctorlist) {
													if (d.getId() == app.getDoctorId()) {%>
														<td><%=d.getName()%></td>
														<td><%=d.getSpecialist()%></td>
													<%}
												}%>
											<td><%=app.getDate()%></td>
										</tr>
									<%}%>
								<%} %>
							<%} else if (user != null) {%>
								<%if (app.getUserId() == user.getId()) {%>
									<%if(app.getDate().compareTo(date) > 0){ %>
										<tr>
											<td>
												<a href="DeleteAppointment?a_id=<%=app.getId()%>">
													<i class="fa fa-trash"> 
														<span class="info">Delete</span>
													</i>
												</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
												<a href="rescheduleForm.jsp?a_id=<%=app.getId()%>"> 
													<i class="fa fa-refresh">
														<span class="info">Reschedule</span>
													</i>
												</a>
											</td>
											<td><%=app.getName()%></td>
											<td><%=app.getGender()%></td>
											<td><%=app.getAge()%></td>
											<td><%=app.getPhone()%></td>
											<td>
												<%if (app.getSymptoms() == null) {%>
													<%="Not mentioned"%>
												<%} else {%>
													<%=app.getSymptoms()%>
												<%}%>
											</td>
										<%for (Doctor d : doctorlist) {
											if (d.getId() == app.getDoctorId()) {%>
												<td><%=d.getName()%></td>
												<td><%=d.getSpecialist()%></td>
											<%}
										}%>
									<td><%=app.getDate()%></td>
								</tr>
							<%}%>
						<%}%>
					<%}%>
				<%}%>
			<!-- Search by 'your appointments[Old]' -->
			<%} else if (request.getParameter("searchBy").equals("yourOldAppointment")) {%>
					<%for (Appointment app : list) {%>
						<%if (doctorUser != null) {%>
							<%if (app.getUserId() == doctorUser.getId()) {%>
								<%if(app.getDate().compareTo(date) < 0){ %>
									<tr>
										<td>
											<%=app.getStatus() %>
										</td>
										<td><%=app.getName()%></td>
										<td><%=app.getGender()%></td>
										<td><%=app.getAge()%></td>
										<td><%=app.getPhone()%></td>
										<td>
											<%if (app.getSymptoms() == null) {%>
						 						<%="Not mentioned"%>
						 					<%} else {%>
												<%=app.getSymptoms()%>
											<%}%>
										</td>
											<%for (Doctor d : doctorlist) {
												if (d.getId() == app.getDoctorId()) {%>
													<td><%=d.getName()%></td>
													<td><%=d.getSpecialist()%></td>
												<%}
											}%>
										<td><%=app.getDate()%></td>
									</tr>
								<%}%>
							<%} %>
						<%} else if (user != null) {%>
							<%if (app.getUserId() == user.getId()) {%>
								<%if(app.getDate().compareTo(date) < 0){ %>
									<tr>
										<td>
											<%=app.getStatus() %>
										</td>
										<td><%=app.getName()%></td>
										<td><%=app.getGender()%></td>
										<td><%=app.getAge()%></td>
										<td><%=app.getPhone()%></td>
										<td>
											<%if (app.getSymptoms() == null) {%>
												<%="Not mentioned"%>
											<%} else {%>
												<%=app.getSymptoms()%>
											<%}%>
										</td>
										<%for (Doctor d : doctorlist) {
											if (d.getId() == app.getDoctorId()) {%>
												<td><%=d.getName()%></td>
												<td><%=d.getSpecialist()%></td>
											<%}
										}%>
									<td><%=app.getDate()%></td>
								</tr>
							<%}%>
						<%}%>
					<%}%>
				<%}%>
			<%} %>
		</table>
		</div>
	</div>
	<%@include file="footer.jsp"%>


</body>
</html>