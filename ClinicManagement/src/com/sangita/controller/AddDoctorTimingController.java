package com.sangita.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddDoctorTimingController
 */
public class AddDoctorTimingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDoctorTimingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//fetch required parameters
		String d_idStr = request.getParameter("d_id");
		String dayName = request.getParameter("day");
		String startTimeStr = request.getParameter("stime");
		String endTimeStr = request.getParameter("etime");
		
		//parse the required variables
		long d_id = Integer.parseInt(d_idStr);
		int startTime = Integer.parseInt(startTimeStr);
		int endTime = Integer.parseInt(endTimeStr);
		
		//variable for storing message and error codes
		StringBuilder errorCode = new StringBuilder();
		String message = "";
		int result = 0;
		
		//database Insertion logic
		
		
		Connection con = null;
		PreparedStatement pstmt =null;
		
		//Declare required type
		String dbUser = "system";
		String dbPassword = "root";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try{
			
			//establish database connection
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, dbUser, dbPassword);
					
			String sql = "insert into doctor_timing(id, doctor_id, day_name, start_time, end_time)values(tid_seq.nextval, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
					
			//Set the data into database
			pstmt.setLong(1, d_id);
			pstmt.setString(2, dayName);
			pstmt.setInt(3, startTime);
			pstmt.setInt(4, endTime);
					
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
			message = "Time slot Successfully added...";
			response.sendRedirect("results.jsp?AddDoctorTimingMsg=" + message);
		}else{
			response.sendRedirect("addDoctorTimingForm.jsp?insertError=" + errorCode+"&d_id=" +d_id);
		}
					
	}

}
