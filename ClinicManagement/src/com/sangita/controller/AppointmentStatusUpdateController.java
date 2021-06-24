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
 * Servlet implementation class AppointmentStatusUpdateController
 */
public class AppointmentStatusUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentStatusUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//fetch the required parameters
		String idStr = request.getParameter("a_id");
		String status = request.getParameter("status");
		
		//parse the required fields
		long id = Long.parseLong(idStr);
							
		//create variable for error code and messages
		StringBuilder errorCode = new StringBuilder("");
		String updateMessage = "";
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
									
			String sql = "update  clinic_appointment"
							+ " set status=? where id=?"; 
					pstmt = con.prepareStatement(sql);
									
					//Set the data into database
					pstmt.setString(1, status);
					pstmt.setLong(2, id);
									
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
					updateMessage = "Status Successfully updated...";
					request.setAttribute("AppointmentStatusUpdateMessage", updateMessage);
					request.getRequestDispatcher("results.jsp").forward(request, response);
				}else{
					updateMessage = "Unable update status...";
					request.setAttribute("AppointmentStatusUpdateMessage", updateMessage);
					request.getRequestDispatcher("showAppointment.jsp").forward(request, response);
				}
								

	}

}
