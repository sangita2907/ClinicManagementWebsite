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
 * Servlet implementation class SigninController
 */
public class SigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SigninController() {
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
		String name = request.getParameter("uname");
		String gender = request.getParameter("ugender");
		String dobStr = request.getParameter("dob");
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");
		
		//parse dateStr to sql date 
		Date dob = Date.valueOf(dobStr);
		
		//create variable for error code and messages
		StringBuilder errorCode = new StringBuilder("");
		String addMessage = "";
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
			
			String sql = "insert into clinic_user(id, name, gender, dob, email, password, role, whencreated)values(cid_seq.nextval, ?, ?, ?, ?, ?,'user', sysdate)";
			pstmt = con.prepareStatement(sql);
			
			//Set the data into database
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setDate(3, dob);
			pstmt.setString(4, email);
			pstmt.setString(5, password);
			
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
			addMessage = "Signup Successful!!";
			response.sendRedirect("results.jsp?addMessage=" + addMessage);
		}else{
			addMessage = "Signup Unsuccessful!!";
			response.sendRedirect("signinForm.jsp?signinError=" + errorCode);
		}
		
		
	}

}
