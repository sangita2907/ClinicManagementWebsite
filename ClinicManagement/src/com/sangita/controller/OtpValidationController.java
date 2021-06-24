package com.sangita.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OtpValidationController
 */
public class OtpValidationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OtpValidationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetch required type
		String receiverEmail = request.getParameter("uemail");
		
		//send user id and password 
		final String userName = "bhaskarmaity23@gmail.com";
		final String password = "sunny1212";
		
		//gmail email server details 
		Properties props = new Properties();
		
		//set key and value 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		//create email session object
		System.out.println("login starting .....");
		Session email_session = Session.getInstance(props,new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		});
		try {
			System.out.println("message sending");
		    //create message object 
			Message message = new MimeMessage(email_session);
			
			
			message.setFrom(new InternetAddress(userName));
			
			
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(receiverEmail));
			
			String subject= "myClinic account creation Otp";
			message.setSubject(subject);
				
			String dataText= "";
			
			Random rand = new Random(); 
			int otp = rand.nextInt(10000);
			if(otp <= 1000){
				otp = otp + 1000;
			}
			
			dataText = dataText + otp;
			message.setText(dataText);

			//send email 
			Transport.send(message);

			System.out.println("message sent ");
			ServletContext context = request.getServletContext();
			context.setAttribute("otp", dataText);
			response.sendRedirect("signinFormPart2.jsp?email=" + receiverEmail);
			

		} catch (MessagingException e) {
			//throw new RuntimeException(e);
			System.out.print(e.getMessage());
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//fetch required parameter
		String email = request.getParameter("uemail");
		String user_otp = request.getParameter("u_otp");
		
		
		//get the system generated otp
		ServletContext context = request.getServletContext();
		String system_otp = (String)context.getAttribute("otp");
		
		if(user_otp.equals(system_otp)){
			response.sendRedirect("signinFormPart3.jsp?email=" + email);
		}else{
			String message = "Please enter correct OTP..";
			response.sendRedirect("signinFormPart2.jsp?email=" + email + "&message=" + message);
		}
		
	}

}
