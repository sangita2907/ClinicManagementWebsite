package com.sangita.controller;

import java.io.IOException;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AppointmentController
 */
public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetch the required parameters
		String user_idStr = request.getParameter("uid");
		String name = request.getParameter("pname");
		String gender = request.getParameter("pgender");
		String ageStr = request.getParameter("page");
		String phoneStr = request.getParameter("pphone");
		String doctor_idStr = request.getParameter("doctor");
		String timingStr = request.getParameter("adate");
		String symptoms = request.getParameter("symptoms");
						
		//parse the required fields
		Long user_id = Long.parseLong(user_idStr);
		Integer age = Integer.parseInt(ageStr);
		Long phone = Long.parseLong(phoneStr);
		Long doctor_id = Long.parseLong(doctor_idStr);
				
		//parse dateStr to Sql date 
		Date timing = Date.valueOf(timingStr);
		
		//create variable for error code and messages
		StringBuilder errorCode = new StringBuilder("");
		String appStatus = "";
		int result = 0;
						
		//Insertion in database
		Connection con = null;
		PreparedStatement pstmt = null;
						
		//Declare required type
		String dbUser = "system";
		String dbPassword = "root";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
						
		try{
			//establish database connection
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, dbUser, dbPassword);
							
			String sql = "insert into clinic_appointment(id, name, gender, age, phoneNumber, userID, doctorID, appointment_date, symptoms, status, when_taken)values(aid_seq.nextval, ?, ?,?,?,?,?,?,?, 'incomplete', sysdate)";
			pstmt = con.prepareStatement(sql);
							
			//Set the data into database
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setInt(3, age);
			pstmt.setLong(4, phone);
			pstmt.setLong(5, user_id);
			pstmt.setLong(6, doctor_id);
			pstmt.setDate(7, timing);
			pstmt.setString(8, symptoms);
							
			result = pstmt.executeUpdate();
							
							
		}catch(ClassNotFoundException e){
			errorCode.append("Driver not loaded.." + e.getMessage());
		}catch(SQLException e){
			errorCode.append("Database Error" + e.getMessage());
			e.printStackTrace();
		}catch(Exception e){
			errorCode.append("Other error.." + e.getMessage());
		}finally{
			//release resource
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					errorCode.append("Database Connection Closing Error.." + e.getMessage());
				}
			}
		}
						
						
		if(result == 1){
			appStatus = "Appointment Successfully...";
			request.setAttribute("appointmentMsg", appStatus);
			request.getRequestDispatcher("results.jsp").forward(request, response);
		}else{
			appStatus = "Unable to take appointment";
			request.setAttribute("insertError", appStatus);
			request.getRequestDispatcher("appointmentForm.jsp").forward(request, response);
		}
						
	}

}
