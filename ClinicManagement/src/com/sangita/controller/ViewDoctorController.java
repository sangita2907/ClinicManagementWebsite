package com.sangita.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import javax.servlet.http.HttpSession;

import com.sangita.bo.Doctor;

/**
 * Servlet implementation class ViewDoctorController
 */
public class ViewDoctorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewDoctorController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//list to store all doctors info
		List<Doctor> doctorList = new ArrayList<Doctor>();
		
		// to store the error messages
		StringBuilder errorCode = new StringBuilder();
		
		//validate database
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		//Declared required types
		String user = "system";
		String password = "root";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		
		try{
			//Establish database Connection
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
			stmt = con.createStatement();
			
			String sql = "Select * from clinic_doctor";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				long id = rs.getLong("id");
				String name = rs.getString("name");
				String gender = rs.getString("gender");
				Date dob = rs.getDate("dob");
				long contactNumber = rs.getLong("contact_number");
				String email = rs.getString("email");
				String qualification = rs.getString("qualification");
				String specialist = rs.getString("specialist");
				String role = rs.getString("role");
				Date whenCreated = rs.getDate("when_created");
				
				//create doctor object
				Doctor doctor = new Doctor();
				
				
				//fill data
				doctor.setId(id);
				doctor.setName(name);
				doctor.setGender(gender);
				doctor.setDob(dob);
				doctor.setContactNumber(contactNumber);
				doctor.setEmail(email);
				doctor.setQualification(qualification);
				doctor.setSpecialist(specialist);
				doctor.setRole(role);
				doctor.setWhenCreated(whenCreated);
				
				//add doctor into the list
				doctorList.add(doctor);	
				
			}
			
		}catch(ClassNotFoundException e){
			errorCode.append("Driver not found.." + e.getMessage());
		}catch(SQLException e){
			errorCode.append("Database Error.." + e.getMessage());
			e.printStackTrace();
		}catch(Exception e){
			errorCode.append("Other error.."  + e.getMessage());
		}finally{
			//release resources
			if(con != null){
				try{
					con.close();
				}catch(SQLException e){
					errorCode.append("Database Connection error.." + e.getMessage());
				}
			}
			
		}
		
		if(doctorList != null){
			HttpSession session = request.getSession();
			session.setAttribute("doctorList", doctorList);
			/*response.sendRedirect("viewAll.jsp");*/
			/*System.out.println(request.getContextPath());*/
			/*if(request.getRequestURI().equals("/loginService")){
				System.out.println(request.getHeader("referer"));*/
			
				response.sendRedirect("home.jsp");
		}else{
			errorCode.append("Unable to get doctor information..");
			
			response.sendRedirect("results.jsp?viewError=" + errorCode);
			
		}
		
		//add attributes for presentation or view
		/*request.setAttribute("allDoctorList", doctorList);
		request.setAttribute("errorCode", errorCode.toString());
		
		request.getRequestDispatcher("doctorTiming").forward(request, response);
		
		*/
		
	}

}
