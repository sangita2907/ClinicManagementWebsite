package com.sangita.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sangita.bo.Doctor;


/**
 * Servlet implementation class DoctorLoginController
 */
public class DoctorLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorLoginController() {
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
		String loginEmail = request.getParameter("demail");
		String loginPassword = request.getParameter("dpass");
		
		
		Doctor loginUser = null;
		
		//validate in database
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//declared required type
		String user = "system";
		String password = "root";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		//to store the error code
		StringBuilder errorCode = new StringBuilder("");
		
		
		try{
			//establish the database connection
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			
			//Create a statement object to send the SQL statement to the database
			stmt = con.createStatement();
			
			String sql="select * from  clinic_doctor where email='"+loginEmail+"' and password='"+loginPassword+"'";
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				//get the required data from database
				long phoneNumber = rs.getLong("contact_number");
				String generatedPassword = "";
				generatedPassword = generatedPassword + phoneNumber;
				System.out.println(generatedPassword);
				
				if(generatedPassword.equals( loginPassword)){
					
					request.setAttribute("email", loginEmail);
					request.setAttribute("password", loginPassword);
					
					request.getRequestDispatcher("PasswordChangeForm.jsp").forward(request, response);
					
				}else{
					long id = rs.getLong("id");
					String name = rs.getString("name");
					String gender = rs.getString("gender");
					Date dob = rs.getDate("dob");
					String email = rs.getString("email");
					String qualification = rs.getString("qualification");
					String specialist = rs.getString("specialist");
					String role = rs.getString("role");
					Date whenCreated = rs.getDate("when_created");
				
				
					//Create a user object
					loginUser = new Doctor();
					
					//fill data
					loginUser.setId(id);
					loginUser.setName(name);
					loginUser.setGender(gender);
					loginUser.setDob(dob);
					loginUser.setContactNumber(phoneNumber);
					loginUser.setEmail(email);
					loginUser.setQualification(qualification);
					loginUser.setSpecialist(specialist);
					loginUser.setRole(role);
					loginUser.setPassword(loginPassword);
					loginUser.setWhenCreated(whenCreated);
				
				}
			}	
		}catch(ClassNotFoundException e){
			errorCode.append("Driver Not Loaded.." + e.getMessage());
		}catch(SQLException e){
			errorCode.append("Database Error:" + e.getMessage());
			e.printStackTrace();
		}catch(Exception e){
			errorCode.append("Other Error: " + e.getMessage());
		}finally{
			//release the resource
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					errorCode.append("Database Connection closing Error: " + e.getMessage());
				}
			}
		}
		
		//if user found means login successful
		//if user not found invalid user/ password
		
		if(loginUser != null){
			//create session object
			HttpSession session = request.getSession();
			
			//add required attribute for next service
			session.setAttribute("userDoctor", loginUser);
			
			//send to the main service page
			response.sendRedirect("viewDoctor");
			
		}else{
			errorCode.append("invalid login id or password");
			 
			request.setAttribute("loginError", errorCode.toString());
			
			request.getRequestDispatcher("DoctorLoginForm.jsp").forward(request, response);
		}
		
	}	

}
