package com.sangita.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class updateDoctorController
 */
public class updateDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDoctorController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}	
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//fetch the required parameters
		String idStr = request.getParameter("did");
		String name = request.getParameter("dname");
		String gender = request.getParameter("dgender");
		String dobStr = request.getParameter("ddob");
		String phoneStr = request.getParameter("dphone");
		String email = request.getParameter("demail");
		String qualification = request.getParameter("dqualification");
		String specialize = request.getParameter("dspecial");
						
		//parse the required fields
		Long id = Long.parseLong(idStr);
		Long phone = Long.parseLong(phoneStr);
				
		//parse dateStr to Sql date 
		Date dob = Date.valueOf(dobStr);
				
						
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
							
			String sql = "update  clinic_doctor"
					+ " set name=?,gender=?,dob=?,contact_number=?, email=?, qualification=?, specialist=? where id=?"; 
			pstmt = con.prepareStatement(sql);
							
			//Set the data into database
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setDate(3, dob);
			pstmt.setLong(4, phone);
			pstmt.setString(5, email);
			pstmt.setString(6, qualification);
			pstmt.setString(7, specialize);
			pstmt.setLong(8, id);
							
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
			HttpSession session = request.getSession();
			session.setAttribute("profileUpdateTaken", true);
			updateMessage = "Record Successfully updated...";
			response.sendRedirect("results.jsp?updateDoctorMessage=" + updateMessage);
		}else{
			updateMessage = "Unable to update record...";
			response.sendRedirect("updateDoctor.jsp?d_id="+id+"&updateError=" + errorCode);
		}
						

	}

}
