<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="stylesheets/hpage.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Kiwi+Maru:wght@300&display=swap" rel="stylesheet">
    <title>Home</title>
</head>

<body>
	<%@include file="header.jsp"%>

    <div class="container">
        <p class="heading">We care about your health</p>
        <p class="body">We believe-</p>
        <p class="body">Healthy citizens are the greatest asset a country can have..</p>
        <p class="body">So we are here for you..</p>

    </div>
    <div class="container2">
        <h1> Welcome to our Online Clinic Service</h1>
        <div class="services">
        </div>
        <div class="info">
            <p class="body">Our aim is to provide hussle very appointment service which is simple and easy than the
                conventional one.
                Here you can take an appointment from any time and anywhere. We try to provide you the best minimal
                waiting time to see the doctor.
                <br><br>
                <form action="appointmentForm.jsp">
                	<input type="submit" value="Make An Appointment">
                </form>
            </p>

        </div>

        <div class="info">
            <p class="body">
                <br><br>
                Our Clinic has the best specialist doctors as we try to give you the best services.
                <br><br>
                <form action="doctorTiming" method="get">
                	<button class="fa fa-search"></button>Check out Doctors
                </form>
            </p>
        </div>
        <div class="service2"></div>

        <!-- Motivational Quote -->
        <div class="feed">
        	<br><br>
            <p>&lsquo;&lsquo;Sleep is that golden chain that ties health and our bodies together.&rsquo;&rsquo;</p>
        </div>

    </div>
    <%@include file="footer.jsp"%>

</body>

</html>
