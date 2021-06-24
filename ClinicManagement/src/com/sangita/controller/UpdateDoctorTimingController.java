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
 * Servlet implementation class UpdateDoctorTimingController
 */
public class UpdateDoctorTimingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctorTimingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//fetch the required parameters
		String d_idStr = request.getParameter("d_id");
		String dayName = request.getParameter("dayName");
		String startTimeStr = request.getParameter("stime");
		String endTimeStr = request.getParameter("etime");
				 
								
		//parse the required fields
		Long d_id = Long.parseLong(d_idStr);
		int startTime = Integer.parseInt(startTimeStr);
		int endTime = Integer.parseInt(endTimeStr);
						
								
		//create variable for error code and messages
		StringBuilder errorCode = new StringBuilder("");
		String updateTimeMessage = "";
		int result = 0;
								
		//updation logic in database
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
									
			String sql = "update  doctor_timing"
							+ " set start_time=?, end_time=? where doctor_id=? and day_name=?"; 
			pstmt = con.prepareStatement(sql);
									
			//Set the data into database
			pstmt.setInt(1, startTime);
			pstmt.setInt(2, endTime);
			pstmt.setLong(3, d_id);
			pstmt.setString(4, dayName);
									
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
			updateTimeMessage = "Time slot updated Successfully...";
			response.sendRedirect("results.jsp?updateDoctorTimingMsg=" + updateTimeMessage);
		}else{
			updateTimeMessage = "Unable to update time slot...";
			response.sendRedirect("UpdateDoctorTimingForm.jsp?d_id="+d_id+"&updateError=" + updateTimeMessage);
		}							
	}
}
