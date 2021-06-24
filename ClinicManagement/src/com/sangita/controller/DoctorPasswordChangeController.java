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
 * Servlet implementation class DoctorPasswordChangeController
 */
public class DoctorPasswordChangeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorPasswordChangeController() {
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
		
		//fetch the required attributes
		String email = request.getParameter("demail");
		String oldPassword = request.getParameter("oldpass");
		String newPassword = request.getParameter("newpass");
		String re_newPassword = request.getParameter("re_newpass");
		
		if(!newPassword.equals(re_newPassword)){
			String message = "Please re-enter the password correctly..";
			request.setAttribute("email", email);
			request.setAttribute("password", oldPassword);
			request.setAttribute("message", message);
			
			request.getRequestDispatcher("PasswordChangeForm.jsp").forward(request, response);
		} else{
		
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
									
				String sql = "update  clinic_doctor" + " set password=? where email=? and password=?"; 
				pstmt = con.prepareStatement(sql);
									
				//Set the data into database
				pstmt.setString(1, newPassword);
				pstmt.setString(2, email);
				pstmt.setString(3, oldPassword);
					
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
				updateMessage = "Password change Successfully...";
				request.setAttribute("PasswordChangeStatus", updateMessage);
				request.getRequestDispatcher("results.jsp").forward(request, response);
					
				}else{
					updateMessage = "Unable to change password";
					
					request.setAttribute("email", email);
					request.setAttribute("password", oldPassword);
					request.setAttribute("message", updateMessage);
					
					request.getRequestDispatcher("PasswordChangeForm.jsp").forward(request, response);
				}
		}
		
	}

}
